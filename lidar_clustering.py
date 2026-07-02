#!/usr/bin/env python3

import rospy
import numpy as np
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import PointStamped
from sklearn.linear_model import RANSACRegressor
import hdbscan
import std_msgs.msg


def get_ros_params():
    params = {
        "ransac_threshold": rospy.get_param("~ransac_threshold", 0.3),
        "min_cluster_size": rospy.get_param("~min_cluster_size", 5),
        "min_samples": rospy.get_param("~min_samples", 3),
        "cluster_selection_epsilon": rospy.get_param("~cluster_selection_epsilon", 1.5),
        "lidar_topic": rospy.get_param("~lidar_topic", "/velodyne_points"),

        "roi_x_min": rospy.get_param("~roi_x_min", -15.0),
        "roi_x_max": rospy.get_param("~roi_x_max", 15.0),
        "roi_y_min": rospy.get_param("~roi_y_min", -6.0),
        "roi_y_max": rospy.get_param("~roi_y_max", 6.0),
        "roi_z_min": rospy.get_param("~roi_z_min", -5.0),
        "roi_z_max": rospy.get_param("~roi_z_max", 5.0),

        # ---- Bounding Box 크기 필터 ----
        # ★ 먼지/작은 점 덩어리와 실제 장애물을 구분하려고 추가
        "bbox_z_min": rospy.get_param("~bbox_z_min", 0.7),
        "bbox_z_max": rospy.get_param("~bbox_z_max", 2.0),
        "bbox_x_max": rospy.get_param("~bbox_x_max", 5.0),
        "bbox_y_max": rospy.get_param("~bbox_y_max", 2.5),

        # ---- 다중 프레임 트래킹 관련 파라미터 ----
        # ★ 한 번 잡힌 물체를 바로 장애물로 확정하지 않고, 여러 프레임에서 반복 감지됐을 때 확정하려고 추가
        "track_match_dist": rospy.get_param("~track_match_dist", 0.6),
        "track_confirm_count": rospy.get_param("~track_confirm_count", 8),
        "track_max_miss": rospy.get_param("~track_max_miss", 5),

        # ---- 로그 출력 관련 ----
        "log_throttle_sec": rospy.get_param("~log_throttle_sec", 0.5),

        # ★ 다운샘플링 간격을 launch에서 조절할 수 있게 추가
        "voxel_size": rospy.get_param("~voxel_size", 0.02),

        # ★ 터미널 출력 켜고 끌 수 있게 추가
        "enable_terminal_log": rospy.get_param("~enable_terminal_log", True),

        # ★ RViz Marker publish 켜고 끌 수 있게 추가
        "enable_rviz_markers": rospy.get_param("~enable_rviz_markers", True),
    }

    # ★ launch 파일 값이 실제로 반영됐는지 확인하려고 추가
    rospy.loginfo("[lidar_clustering_node] Parameters:")
    for key, value in params.items():
        rospy.loginfo(f"  {key}: {value}")

    return params


prev_marker_ids = set()
confirmed_prev_marker_ids = set()

# ---- 트랙 관리용 전역 상태 ----
tracks = {}
next_track_id = 0


# Voxel 기반 다운샘플링
def voxel_downsample(points, voxel_size=0.02):
    discrete = np.floor(points / voxel_size)
    _, idx = np.unique(discrete, axis=0, return_index=True)
    return points[idx]


# RANSAC으로 지면 제거
def remove_ground_ransac(points, threshold=0.3):
    X = points[:, :2]
    y = points[:, 2]
    ransac = RANSACRegressor(residual_threshold=threshold)

    try:
        ransac.fit(X, y)
        z_pred = ransac.predict(X)
        residuals = np.abs(y - z_pred)
        mask = residuals > threshold
        return points[mask]
    except Exception:
        # ★ RANSAC 실패 시 노드가 죽지 않도록 원본 포인트를 그대로 사용
        return points


# 크기가 임계값 이상/이하인 클러스터 제거
# ★ z 길이 조건까지 추가해서 너무 낮은 먼지성 클러스터를 제거
def filter_by_bounding_box(
    cluster_points,
    max_length=5.0,
    max_width=2.5,
    min_height=0.7,
    max_height=2.0
):
    x_len = np.ptp(cluster_points[:, 0])
    y_len = np.ptp(cluster_points[:, 1])
    z_len = np.ptp(cluster_points[:, 2])

    return (
        x_len < max_length and
        y_len < max_width and
        min_height <= z_len <= max_height
    )


# 다운샘플링 + 지면 제거 후 포인트 퍼블리시
def publish_downsampled_points(points, frame_id):
    header = std_msgs.msg.Header()
    header.stamp = rospy.Time.now()
    header.frame_id = frame_id
    cloud_msg = pc2.create_cloud_xyz32(header, points)
    downsample_pub.publish(cloud_msg)


# 가까운 클러스터 병합
# ★ 같은 장애물이 여러 조각으로 나뉘는 경우가 있어서 가까운 클러스터끼리 합치려고 추가
def merge_close_clusters(points, labels, max_gap=0.5):
    unique_labels = set(labels)
    unique_labels.discard(-1)

    centroids = {}

    for label in unique_labels:
        cluster_points = points[labels == label]
        centroids[label] = np.mean(cluster_points, axis=0)

    merged_labels = {}
    merged = set()

    for label_1 in unique_labels:
        if label_1 in merged:
            continue

        merged_labels[label_1] = label_1

        for label_2 in unique_labels:
            if label_1 == label_2 or label_2 in merged:
                continue

            dist = np.linalg.norm(
                centroids[label_1][:2] - centroids[label_2][:2]
            )

            if dist < max_gap:
                merged_labels[label_2] = label_1
                merged.add(label_2)

    new_labels = np.array([
        merged_labels.get(label, -1) if label != -1 else -1
        for label in labels
    ])

    return new_labels


# ---- 다중 프레임 트래킹 ----
# ★ 순간적으로 튀는 포인트를 바로 장애물로 보지 않기 위해 추가
def update_tracks(curr_centroids, match_dist, confirm_count, max_miss):
    global tracks, next_track_id

    unmatched_curr = list(range(len(curr_centroids)))
    matched_track_ids = set()

    # 기존 트랙과 현재 프레임의 centroid를 거리 기준으로 매칭
    for track_id, track in list(tracks.items()):
        if not unmatched_curr:
            break

        best_idx = None
        best_dist = match_dist

        for idx in unmatched_curr:
            dist = np.linalg.norm(
                np.array(curr_centroids[idx][:2]) -
                np.array(track["centroid"][:2])
            )

            if dist < best_dist:
                best_dist = dist
                best_idx = idx

        if best_idx is not None:
            # 같은 물체가 다시 감지된 경우
            track["centroid"] = curr_centroids[best_idx]
            track["hit_count"] += 1
            track["miss_count"] = 0
            matched_track_ids.add(track_id)
            unmatched_curr.remove(best_idx)

    # 이번 프레임에서 매칭되지 않은 기존 트랙은 miss 증가
    dead_tracks = []

    for track_id, track in tracks.items():
        if track_id not in matched_track_ids:
            track["miss_count"] += 1

            if track["miss_count"] > max_miss:
                dead_tracks.append(track_id)

    # miss_count가 max_miss를 넘은 트랙 삭제
    for track_id in dead_tracks:
        del tracks[track_id]

    # 새로 잡힌 centroid는 새 트랙으로 등록
    for idx in unmatched_curr:
        tracks[next_track_id] = {
            "centroid": curr_centroids[idx],
            "hit_count": 1,
            "miss_count": 0,
        }
        next_track_id += 1

    # hit_count가 confirm_count 이상인 트랙만 확정 장애물
    confirmed_tracks = []

    for track_id, track in tracks.items():
        if track["hit_count"] >= confirm_count:
            confirmed_tracks.append({
                "track_id": track_id,
                "centroid": track["centroid"],
                "hit_count": track["hit_count"],
                "miss_count": track["miss_count"],
            })

    return confirmed_tracks


def publish_delete_markers(marker_array, frame_id, namespace, removed_ids):
    for rem_id in removed_ids:
        del_marker = Marker()
        del_marker.header.frame_id = frame_id
        del_marker.header.stamp = rospy.Time.now()
        del_marker.ns = namespace
        del_marker.id = rem_id
        del_marker.action = Marker.DELETE
        marker_array.markers.append(del_marker)


def publish_empty_markers(frame_id):
    global prev_marker_ids, confirmed_prev_marker_ids

    if not params["enable_rviz_markers"]:
        prev_marker_ids = set()
        confirmed_prev_marker_ids = set()
        return

    marker_array = MarkerArray()
    confirmed_marker_array = MarkerArray()

    publish_delete_markers(
        marker_array,
        frame_id,
        "lidar_clusters",
        prev_marker_ids
    )

    publish_delete_markers(
        confirmed_marker_array,
        frame_id,
        "confirmed_obstacles",
        confirmed_prev_marker_ids
    )

    marker_pub.publish(marker_array)
    confirmed_marker_pub.publish(confirmed_marker_array)

    prev_marker_ids = set()
    confirmed_prev_marker_ids = set()


def print_final_result(throttle, filter_pass_count, confirmed_tracks):
    # ★ enable_terminal_log가 false면 계산은 그대로 하고 터미널 출력만 끔
    if not params["enable_terminal_log"]:
        return

    confirm_count_pass = len(confirmed_tracks)
    final_obstacles = len(confirmed_tracks)

    log_msg = (
        "\n========== Obstacle Check ==========\n"
        f"filter_pass        : {filter_pass_count}\n"
        f"confirm_count_pass : {confirm_count_pass}\n"
        f"final_obstacles    : {final_obstacles}\n"
        "=================================="
    )

    rospy.loginfo_throttle(throttle, log_msg)


def print_empty_result(throttle, frame_id):
    confirmed_tracks = update_tracks(
        [],
        match_dist=params["track_match_dist"],
        confirm_count=params["track_confirm_count"],
        max_miss=params["track_max_miss"],
    )

    publish_empty_markers(frame_id)

    print_final_result(
        throttle,
        filter_pass_count=0,
        confirmed_tracks=confirmed_tracks
    )


# PointCloud 콜백 함수
def pointcloud_callback(msg):
    global prev_marker_ids, confirmed_prev_marker_ids

    throttle = params["log_throttle_sec"]
    frame_id = msg.header.frame_id

    points = np.array([
        [p[0], p[1], p[2]]
        for p in pc2.read_points(
            msg,
            field_names=("x", "y", "z"),
            skip_nans=True
        )
    ])

    if len(points) == 0:
        print_empty_result(throttle, frame_id)
        return

    # ROI 필터링
    x_cond = (params["roi_x_min"] <= points[:, 0]) & (points[:, 0] <= params["roi_x_max"])
    y_cond = (params["roi_y_min"] <= points[:, 1]) & (points[:, 1] <= params["roi_y_max"])
    z_cond = (params["roi_z_min"] <= points[:, 2]) & (points[:, 2] <= params["roi_z_max"])

    roi_points = points[x_cond & y_cond & z_cond]

    if len(roi_points) == 0:
        print_empty_result(throttle, frame_id)
        return

    # 다운샘플링
    downsampled_points = voxel_downsample(
        roi_points,
        voxel_size=params["voxel_size"]  # ★ launch에서 voxel_size 조절 가능하게 수정
    )

    if len(downsampled_points) == 0:
        print_empty_result(throttle, frame_id)
        return

    # 지면 제거
    non_ground_points = remove_ground_ransac(
        downsampled_points,
        threshold=params["ransac_threshold"]
    )

    if len(non_ground_points) == 0:
        print_empty_result(throttle, frame_id)
        return

    # RViz에서 지면 제거 후 포인트 확인용
    publish_downsampled_points(non_ground_points, frame_id)

    # ---- HDBSCAN 에러 방지 ----
    # ★ 포인트 수가 너무 적을 때 HDBSCAN이 에러 나지 않도록 추가
    min_required_points = max(
        params["min_cluster_size"],
        params["min_samples"] + 1
    )

    if len(non_ground_points) < min_required_points:
        print_empty_result(throttle, frame_id)
        return

    # 클러스터링 수행
    clusterer = hdbscan.HDBSCAN(
        min_cluster_size=params["min_cluster_size"],
        min_samples=params["min_samples"],
        cluster_selection_epsilon=params["cluster_selection_epsilon"],
    )

    try:
        labels = clusterer.fit_predict(non_ground_points)
    except Exception:
        # ★ HDBSCAN 실패 시 노드가 죽지 않도록 추가
        print_empty_result(throttle, frame_id)
        return

    # 가까운 클러스터 병합
    labels = merge_close_clusters(non_ground_points, labels, max_gap=0.5)

    # 이번 프레임 클러스터 centroid 계산
    curr_centroids = []
    raw_results = []

    marker_array = MarkerArray()
    curr_marker_ids = set()
    marker_id = 0

    for cluster_id in set(labels):
        if cluster_id == -1:
            continue

        cluster_points = non_ground_points[labels == cluster_id]

        if len(cluster_points) == 0:
            continue

        # bbox 필터 통과 여부 확인
        if not filter_by_bounding_box(
            cluster_points,
            max_length=params["bbox_x_max"],
            max_width=params["bbox_y_max"],
            min_height=params["bbox_z_min"],
            max_height=params["bbox_z_max"]
        ):
            continue

        centroid = np.mean(cluster_points, axis=0)

        x_len = np.ptp(cluster_points[:, 0])
        y_len = np.ptp(cluster_points[:, 1])
        z_len = np.ptp(cluster_points[:, 2])

        curr_centroids.append(centroid)

        # 좌표와 크기 값은 내부 기록으로 유지
        # 터미널에는 출력하지 않음
        raw_results.append({
            "cluster_id": int(cluster_id),
            "x": centroid[0],
            "y": centroid[1],
            "z": centroid[2],
            "x_len": x_len,
            "y_len": y_len,
            "z_len": z_len,
            "points": len(cluster_points),
        })

        if params["enable_rviz_markers"]:
            marker = Marker()
            marker.header.frame_id = frame_id
            marker.header.stamp = rospy.Time.now()
            marker.ns = "lidar_clusters"
            marker.id = marker_id
            marker.type = Marker.SPHERE
            marker.action = Marker.ADD
            marker.pose.position.x = centroid[0]
            marker.pose.position.y = centroid[1]
            marker.pose.position.z = centroid[2]
            marker.scale.x = 0.3
            marker.scale.y = 0.3
            marker.scale.z = 0.3
            marker.color.r = 0.0
            marker.color.g = 1.0
            marker.color.b = 0.0
            marker.color.a = 0.8
            marker_array.markers.append(marker)

            curr_marker_ids.add(marker_id)
            marker_id += 1

        # raw 클러스터 중심 위치 토픽
        pt_msg = PointStamped()
        pt_msg.header.frame_id = frame_id
        pt_msg.header.stamp = rospy.Time.now()
        pt_msg.point.x = centroid[0]
        pt_msg.point.y = centroid[1]
        pt_msg.point.z = centroid[2]
        cluster_pos_pub.publish(pt_msg)

    if params["enable_rviz_markers"]:
        # 사라진 raw 마커 삭제
        removed_ids = prev_marker_ids - curr_marker_ids
        publish_delete_markers(
            marker_array,
            frame_id,
            "lidar_clusters",
            removed_ids
        )
        prev_marker_ids = curr_marker_ids
    else:
        prev_marker_ids = set()

    # 다중 프레임 트래킹으로 확정 장애물 판정
    confirmed_tracks = update_tracks(
        curr_centroids,
        match_dist=params["track_match_dist"],
        confirm_count=params["track_confirm_count"],
        max_miss=params["track_max_miss"],
    )

    confirmed_marker_array = MarkerArray()
    confirmed_curr_marker_ids = set()

    for obstacle_id, track in enumerate(confirmed_tracks):
        centroid = track["centroid"]

        if params["enable_rviz_markers"]:
            marker = Marker()
            marker.header.frame_id = frame_id
            marker.header.stamp = rospy.Time.now()
            marker.ns = "confirmed_obstacles"
            marker.id = obstacle_id
            marker.type = Marker.CUBE
            marker.action = Marker.ADD
            marker.pose.position.x = centroid[0]
            marker.pose.position.y = centroid[1]
            marker.pose.position.z = centroid[2]
            marker.scale.x = 0.4
            marker.scale.y = 0.4
            marker.scale.z = 0.4
            marker.color.r = 1.0
            marker.color.g = 0.0
            marker.color.b = 0.0
            marker.color.a = 0.9
            confirmed_marker_array.markers.append(marker)

            confirmed_curr_marker_ids.add(obstacle_id)

        # 확정 장애물 중심 위치 토픽
        # ★ 메인 주행 코드에서 사용할 최종 장애물 좌표 publish
        pt_msg = PointStamped()
        pt_msg.header.frame_id = frame_id
        pt_msg.header.stamp = rospy.Time.now()
        pt_msg.point.x = centroid[0]
        pt_msg.point.y = centroid[1]
        pt_msg.point.z = centroid[2]
        confirmed_pos_pub.publish(pt_msg)

    if params["enable_rviz_markers"]:
        # 사라진 confirmed 마커 삭제
        removed_confirmed_ids = confirmed_prev_marker_ids - confirmed_curr_marker_ids
        publish_delete_markers(
            confirmed_marker_array,
            frame_id,
            "confirmed_obstacles",
            removed_confirmed_ids
        )
        confirmed_prev_marker_ids = confirmed_curr_marker_ids

        # RViz publish
        marker_pub.publish(marker_array)
        confirmed_marker_pub.publish(confirmed_marker_array)
    else:
        confirmed_prev_marker_ids = set()

    # ---- 터미널 최종 출력 ----
    print_final_result(
        throttle,
        filter_pass_count=len(raw_results),
        confirmed_tracks=confirmed_tracks
    )


# ROS 노드 초기화 및 실행
if __name__ == "__main__":
    rospy.init_node("lidar_clustering_node")
    params = get_ros_params()

    marker_pub = rospy.Publisher(
        "/lidar_clusters",
        MarkerArray,
        queue_size=1
    )

    confirmed_marker_pub = rospy.Publisher(
        "/confirmed_obstacles_markers",
        MarkerArray,
        queue_size=1
    )

    downsample_pub = rospy.Publisher(
        "/downsampled_points",
        PointCloud2,
        queue_size=1
    )

    cluster_pos_pub = rospy.Publisher(
        "/cluster_positions",
        PointStamped,
        queue_size=10
    )

    confirmed_pos_pub = rospy.Publisher(
        "/confirmed_obstacle_positions",
        PointStamped,
        queue_size=10
    )

    rospy.Subscriber(
        params["lidar_topic"],
        PointCloud2,
        pointcloud_callback,
        queue_size=1
    )

    rospy.spin()
