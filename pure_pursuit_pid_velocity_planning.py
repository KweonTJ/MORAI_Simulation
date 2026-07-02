#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import rospkg
from math import cos, sin, sqrt, pow, atan2, pi

from geometry_msgs.msg import Point, PoseStamped
from nav_msgs.msg import Odometry, Path
from morai_msgs.msg import CtrlCmd
from std_msgs.msg import Int32

import numpy as np
from tf.transformations import euler_from_quaternion

class pure_pursuit:
    def __init__(self):
        rospy.init_node('pure_pursuit', anonymous=True)
        
        # 📍 차량 상태 구독 (/odom 으로 수정)
        rospy.Subscriber("/odom", Odometry, self.odom_callback)
        self.ctrl_cmd_pub = rospy.Publisher('ctrl_cmd_0', CtrlCmd, queue_size=1)

        # 🚥 YOLO 신호등 인식 결과 구독
        self.is_started = False
        rospy.Subscriber('/yolo_detections', Int32, self.traffic_light_callback)

        self.ctrl_cmd_msg = CtrlCmd()
        self.ctrl_cmd_msg.longlCmdType = 1

        self.is_odom = False 
        self.is_path = False

        self.forward_point = Point()
        self.current_postion = Point()
        self.current_velocity_kph = 0.0
        self.vehicle_yaw = 0.0

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
                
                # 🚥 신호 대기 로직 (YOLO 신호 받기 전까지 대기)
                if not self.is_started:
                    self.ctrl_cmd_msg.steering = 0.0
                    self.ctrl_cmd_msg.accel = 0.0
                    self.ctrl_cmd_msg.brake = 1.0
                    print("[TRAFFIC LIGHT] 🔴 YOLO '직좌 신호' 대기 중...")
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
                
                print(f"[RUNNING] Progress: {self.current_waypoint}/{total_waypoints} | Target: {self.target_velocity:.1f}km/h | Current: {self.current_velocity_kph:.1f}km/h | Steer: {self.ctrl_cmd_msg.steering:.3f}")
                self.ctrl_cmd_pub.publish(self.ctrl_cmd_msg)
                
            else:
                print(f"[WAITING] 텍스트경로 로드: {self.is_path} | 시뮬레이터 연결(Odom): {self.is_odom}")
                
            rate.sleep()

    # 🚥 YOLO 콜백
    def traffic_light_callback(self, msg):
        if self.is_started:
            return
        TARGET_YOLO_CLASS = 3
        if msg.data == TARGET_YOLO_CLASS:
            rospy.loginfo("🟢 [YOLO] '직좌 신호' 검출! 주행 시작")
            self.is_started = True

    # 📍 Odom 콜백
    def odom_callback(self, msg):
        self.is_odom = True
        self.current_postion.x = msg.pose.pose.position.x
        self.current_postion.y = msg.pose.pose.position.y
        
        odom_quaternion = (msg.pose.pose.orientation.x, msg.pose.pose.orientation.y, msg.pose.pose.orientation.z, msg.pose.pose.orientation.w)
        _, _, self.vehicle_yaw = euler_from_quaternion(odom_quaternion)
        
        vx = msg.twist.twist.linear.x
        vy = msg.twist.twist.linear.y
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

    # 🔄 Pure Pursuit 계산 (장애물 회피 로직 완전 삭제)
    def calc_pure_pursuit(self):
        current_vel_mps = self.current_velocity_kph / 3.6
        self.lfd = current_vel_mps * self.lfd_gain
        
        if self.lfd < self.min_lfd: 
            self.lfd = self.min_lfd
        elif self.lfd > self.max_lfd:
            self.lfd = self.max_lfd
        
        vehicle_position = self.current_postion
        self.is_look_forward_point = False

        translation = [vehicle_position.x, vehicle_position.y]

        trans_matrix = np.array([
                [cos(self.vehicle_yaw), -sin(self.vehicle_yaw), translation[0]],
                [sin(self.vehicle_yaw),  cos(self.vehicle_yaw), translation[1]],
                [0                    ,  0                    , 1             ]])

        det_trans_matrix = np.linalg.inv(trans_matrix)

        start_idx = self.current_waypoint if hasattr(self, 'current_waypoint') and self.current_waypoint != -1 else 0

        for i in range(start_idx, len(self.global_path.poses)):
            path_point = self.global_path.poses[i].pose.position
            global_path_point = [path_point.x, path_point.y, 1]
            local_path_point = det_trans_matrix.dot(global_path_point)    

            if local_path_point[0] > 0:
                dis = sqrt(pow(local_path_point[0], 2) + pow(local_path_point[1], 2))
                if dis >= self.lfd:
                    self.forward_point = path_point
                    self.is_look_forward_point = True
                    break
        
        if self.is_look_forward_point:
            theta = atan2(local_path_point[1], local_path_point[0])
            steering = atan2((2 * self.vehicle_length * sin(theta)), self.lfd)
            # 첫 번째 코드 조향 제한(-28도 ~ 28도 수준인 0.489 rad) 적용
            steering = max(min(steering, 0.489), -0.489)
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