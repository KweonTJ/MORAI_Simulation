#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import rospkg
from math import cos, sin, sqrt, pow, atan2, pi 
from geometry_msgs.msg import Point, PoseStamped
from nav_msgs.msg import Path 
from morai_msgs.msg import CtrlCmd, EgoVehicleStatus # GetTrafficLightStatus 제거
from std_msgs.msg import Int32 # 🚥 YOLO 신호 연동을 위한 표준 Int32 임포트
from sensor_msgs.msg import PointCloud2 
import sensor_msgs.point_cloud2 as pc2 
import numpy as np

class pure_pursuit:
    def __init__(self):
        rospy.init_node('pure_pursuit', anonymous=True)
        
        # 🚗 [차량 상태 구독] 시뮬레이터 직통 Ego_topic 구독
        rospy.Subscriber("/Ego_topic", EgoVehicleStatus, self.status_callback)
        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd_0', CtrlCmd, queue_size=1)

        # 🚥 [신호등 변수] 이제 MORAI 정답 데이터 대신 YOLO 노드가 쏴주는 결과를 구독합니다.
        self.is_started = False
        rospy.Subscriber('/yolo_detections', Int32, self.traffic_light_callback)

        # 🚧 [장애물 회피 변수] 장애물 감지 플래그
        self.obstacle_detected = False
        rospy.Subscriber('/cluster_points', PointCloud2, self.lidar_callback)

        self.ctrl_cmd_msg = CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType = 1

        self.is_odom = False 
        self.is_path = False

        self.forward_point = Point()
        self.current_postion = Point()
        self.current_velocity_kph = 0.0

        self.vehicle_length = 1.0
        self.lfd = 8.0
        self.min_lfd = 5.0
        self.max_lfd = 30.0
        self.lfd_gain = 0.78
        self.target_velocity = 20.0

        self.pid = pidControl()
        self.global_path = Path()

        rospack = rospkg.RosPack()
        pkg_path = rospack.get_path('beginner_tutorials')
        full_path = pkg_path + '/path/path.txt'

        try:
            with open(full_path, 'r') as f:
                lines = f.readlines()
                for line in lines:
                    tmp = line.split()
                    pose = PoseStamped()
                    pose.pose.position.x = float(tmp[0])
                    pose.pose.position.y = float(tmp[1])
                    pose.pose.position.z = float(tmp[2])
                    self.global_path.poses.append(pose)
            self.is_path = True
        except Exception as e:
            pass

        if self.is_path:
            self.vel_planning = velocityPlanning(self.target_velocity / 3.6, 0.15)
            self.velocity_list = self.vel_planning.curvedBaseVelocity(self.global_path, 50)

        rate = rospy.Rate(30)
        while not rospy.is_shutdown():
            if self.is_path and self.is_odom:
                
                # 🔍 [조향 에러 진단용 실시간 디버깅 출력 구문]
                # 차량의 현재 내부 연산 수치를 터미널에 출력하여 좌표계 불일치나 각도 에러를 찾아냅니다.
                print(f"\n[DEBUG] 차량 현재 위치: X={self.current_postion.x:.2f}, Y={self.current_postion.y:.2f}")
                print(f"[DEBUG] 현재 계산된 Yaw 각도: {self.vehicle_yaw:.4f} rad (도 변환: {self.vehicle_yaw * 180 / pi:.1f}도)")
                if len(self.global_path.poses) > 0:
                    first_p = self.global_path.poses[0].pose.position
                    print(f"[DEBUG] 경로 파일(path.txt)의 시작점: X={first_p.x:.2f}, Y={first_p.y:.2f}")
                
                # 🚥 [신호등 제어] YOLO 노드가 출발 신호를 주기 전까지 강제 정지
                if not self.is_started:
                    self.ctrl_cmd_msg.steering = 0.0
                    self.ctrl_cmd_msg.accel = 0.0
                    self.ctrl_cmd_msg.brake = 1.0
                    print("[TRAFFIC LIGHT] 🔴 YOLO 신호 대기 중... 카메라가 '직좌 신호'를 인식하면 자동 출발합니다.")
                    self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                    rate.sleep()
                    continue
                
                self.current_waypoint = self.get_current_waypoint(self.global_path)
                
                total_waypoints = len(self.global_path.poses)
                
                if self.current_waypoint >= total_waypoints - 5:
                    self.ctrl_cmd_msg.steering = 0.0
                    self.ctrl_cmd_msg.accel = 0.0
                    self.ctrl_cmd_msg.brake = 1.0
                    print(f"\n Goal (Index: {self.current_waypoint}/{total_waypoints}) \n")
                    self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                    
                    rate.sleep()
                    continue
                
                if self.current_waypoint >= len(self.velocity_list) - 1:
                    self.target_velocity = 0.0
                else:
                    self.target_velocity = self.velocity_list[self.current_waypoint] * 3.6
                
                steering = self.calc_pure_pursuit()
                
                if self.is_look_forward_point:
                    self.ctrl_cmd_msg.steering = steering
                    output = self.pid.pid(self.target_velocity, self.current_velocity_kph)

                    if output > 0.0:
                        self.ctrl_cmd_msg.accel = min(output, 1.0) 
                        self.ctrl_cmd_msg.brake = 0.0
                    else:
                        self.ctrl_cmd_msg.accel = 0.0
                        self.ctrl_cmd_msg.brake = min(-output, 1.0)
                else: 
                    self.ctrl_cmd_msg.steering = 0.0
                    self.ctrl_cmd_msg.accel = 0.0
                    self.ctrl_cmd_msg.brake = 1.0
                
                obs_status = "DETECTED 🔥" if self.obstacle_detected else "CLEAR 🟢"
                print(f"[RUNNING] Progress: {self.current_waypoint}/{total_waypoints} | Obs: {obs_status} | Target: {self.target_velocity:.1f}km/h | Current: {self.current_velocity_kph:.1f}km/h")
                self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                
            else:
                print(f"[WAITING] 텍스트경로 로드: {self.is_path} | 시뮬레이터 연결(Ego_topic): {self.is_odom}")
                
            rate.sleep()

    # 🚥 [신호등 콜백 함수] YOLO 인지 결과 토픽 처리부
    def traffic_light_callback(self, msg):
        if self.is_started:
            return
        
        # 🌟 [학습 규격 세팅] 본인의 data.yaml 파일에 정의된 '직좌 신호' 클래스 ID를 지정해 주세요.
        # 예시 데이터셋 설명 기준으로 직좌 신호를 3번으로 가정한 상태입니다.
        TARGET_YOLO_CLASS = 3
        
        if msg.data == TARGET_YOLO_CLASS:
            rospy.loginfo("🟢 [YOLO VISION] 출발 조건인 '직좌 신호' 카메라 검출 성공! 차량 주행을 시작합니다.")
            self.is_started = True

    # 🚧 [라이다 장애물 인지 콜백 함수]
    def lidar_callback(self, msg):
        points = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
        
        if not self.obstacle_detected:
            front_points = [p for p in points if 0.8 < p[0] < 7.5 and -1.0 < p[1] < 1.0]
            if len(front_points) > 8:
                self.obstacle_detected = True
                rospy.loginfo("🚧 [LIDAR] 전방 장애물 최초 감지! 회피 기동을 시작합니다.")
        else:
            still_near_points = [p for p in points if -0.5 < p[0] < 7.5 and -2.5 < p[1] < 0.2]
            if len(still_near_points) < 4:
                self.obstacle_detected = False
                rospy.loginfo("🟢 [LIDAR] 장애물 통과 완료! 원래 차선으로 복귀합니다.")

    # 🚗 [Ego_topic 콜백 함수] 차량 상태 및 방위각 갱신
    def status_callback(self, msg):
        self.is_odom = True
        self.current_postion.x = msg.position.x
        self.current_postion.y = msg.position.y
        
        # 💡 조향각 꺾임 에러 발생 시, 위에 추가해 둔 [DEBUG] 터미널 출력 창을 확인하세요!
        # 차를 수동 키보드로 틀었을 때 [도 변환] 각도가 비정상적이거나 0 부근에서 고정되어 있다면 
        # 아래 공식을 'yaw = msg.heading' 형태로 단순화하거나 단위를 전면 수정해야 합니다.
        yaw = (90.0 - msg.heading) * pi / 180.0
        while yaw > pi:
            yaw -= 2.0 * pi
        while yaw < -pi:
            yaw += 2.0 * pi
            
        self.vehicle_yaw = yaw
        
        vx = msg.velocity.x
        vy = msg.velocity.y
        self.current_velocity_kph = sqrt(vx**2 + vy**2) * 3.6

    def get_current_waypoint(self, global_path):
        min_dist = float('inf')        
        current_waypoint = -1
        
        if hasattr(self, 'prev_waypoint'):
            start_idx = max(0, self.prev_waypoint - 20)
            end_idx = min(len(global_path.poses), self.prev_waypoint + 80)
        else:
            start_idx = 0
            end_idx = len(global_path.poses)

        for i in range(start_idx, end_idx):
            dx = self.current_postion.x - global_path.poses[i].pose.position.x
            dy = self.current_postion.y - global_path.poses[i].pose.position.y
            dist = sqrt(pow(dx, 2) + pow(dy, 2))
            if min_dist > dist:
                min_dist = dist
                current_waypoint = i
                
        self.prev_waypoint = current_waypoint
        return current_waypoint

    def calc_pure_pursuit(self):
        current_vel_mps = self.current_velocity_kph / 3.6
        self.lfd = current_vel_mps * self.lfd_gain
        
        if self.lfd < self.min_lfd: 
            self.lfd = self.min_lfd
        elif self.lfd > self.max_lfd:
            self.max_lfd = self.max_lfd
        
        vehicle_position = self.current_postion
        self.is_look_forward_point = False

        translation = [vehicle_position.x, vehicle_position.y]

        trans_matrix = np.array([
                [cos(self.vehicle_yaw), -sin(self.vehicle_yaw), translation[0]],
                [sin(self.vehicle_yaw), cos(self.vehicle_yaw), translation[1]],
                [0                    , 0                     , 1             ]])

        det_trans_matrix = np.linalg.inv(trans_matrix)

        START_OBSTACLE_ZONE = 300  
        END_OBSTACLE_ZONE = 800
        
        path_offset = 0.0
        
        if START_OBSTACLE_ZONE <= self.current_waypoint <= END_OBSTACLE_ZONE:
            if self.obstacle_detected:
                path_offset = 1.6 

        start_idx = self.current_waypoint if hasattr(self, 'current_waypoint') and self.current_waypoint != -1 else 0

        for i in range(start_idx, len(self.global_path.poses)):
            path_point = self.global_path.poses[i].pose.position
            global_path_point = [path_point.x, path_point.y, 1]
            local_path_point = det_trans_matrix.dot(global_path_point)    

            local_path_point[1] += path_offset 

            if local_path_point[0] > 0:
                dis = sqrt(pow(local_path_point[0], 2) + pow(local_path_point[1], 2))
                if dis >= self.lfd:
                    self.forward_point = path_point
                    self.is_look_forward_point = True
                    break
        
        if self.is_look_forward_point:
            theta = atan2(local_path_point[1], local_path_point[0])
            steering = atan2((2 * self.vehicle_length * sin(theta)), self.lfd)
        else:
            steering = 0.0

        return steering


class pidControl:
    def __init__(self):
        self.p_gain = 0.5
        self.i_gain = 0.00
        self.d_gain = 0.03
        self.prev_error = 0
        self.i_control = 0
        self.controlTime = 0.02

    def pid(self, target_vel, current_vel):
        error = target_vel - current_vel
        p_control = self.p_gain * error
        self.i_control += self.i_gain * error * self.controlTime
        d_control = self.d_gain * (error - self.prev_error) / self.controlTime
        output = p_control + self.i_control + d_control
        self.prev_error = error
        return output


class velocityPlanning:
    def __init__(self, car_max_speed, road_friction):
        self.car_max_speed = car_max_speed
        self.road_friction = road_friction

    def curvedBaseVelocity(self, global_path, point_num):
        out_vel_plan = []
        path_len = len(global_path.poses)
        
        if path_len < point_num * 2:
            return [self.car_max_speed] * path_len

        for i in range(0, point_num):
            out_vel_plan.append(self.car_max_speed)

        for i in range(point_num, path_len - point_num):
            x_list = []
            y_list = []
            for box in range(-point_num, point_num):
                x = global_path.poses[i+box].pose.position.x
                y = global_path.poses[i+box].pose.position.y
                x_list.append([-2*x, -2*y, 1])
                y_list.append((-x*x) - (y*y))

            x_matrix = np.array(x_list)
            y_matrix = np.array(y_list)
            x_trans = x_matrix.T

            try:
                a_matrix = np.linalg.inv(x_trans.dot(x_matrix)).dot(x_trans).dot(y_matrix)
                a = a_matrix[0]
                b = a_matrix[1]
                c = a_matrix[2]
                r = sqrt(a*a + b*b - c)
                v_max = sqrt(r * 9.8 * self.road_friction)
                
                if v_max > self.car_max_speed:
                    v_max = self.car_max_speed
            except:
                v_max = self.car_max_speed
                
            out_vel_plan.append(v_max)

        for i in range(path_len - point_num, path_len - 10):
            out_vel_plan.append(10.0 / 3.6)

        for i in range(path_len - 10, path_len):
            out_vel_plan.append(0.0)

        return out_vel_plan

if __name__ == '__main__':
    try:
        test_track = pure_pursuit()
    except rospy.ROSInterruptException:
        pass