#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import cv2
import numpy as np
import os

from sensor_msgs.msg import CompressedImage, Image
from std_msgs.msg import Int32
from cv_bridge import CvBridge
from ultralytics import YOLO

class YoloNode:
    def __init__(self):
        rospy.init_node('yolo_detection_node', anonymous=True)

        model_path = rospy.get_param('~model_path', '/home/a/catkin_ws/src/yolo/models/best.pt')
        # 토픽명을 터미널에 나온 /image_jpeg/compressed 로 통일합니다.
        image_topic = rospy.get_param('~image_topic', '/image_jpeg/compressed')

        if not os.path.exists(model_path):
            rospy.logerr(f"YOLO model file not found at {model_path}")
            return

        # 1. 제어기 통신용 퍼블리셔: 제어기가 기다리는 Int32 타입으로 수정
        self.signal_pub = rospy.Publisher('/yolo_detections', Int32, queue_size=10)
        
        # 2. 시각화용 퍼블리셔: rqt에서 바운딩 박스를 보기 위한 Image 퍼블리셔 추가
        self.image_pub = rospy.Publisher('/yolo/result_image', Image, queue_size=1)

        self.bridge = CvBridge()
        self.model = YOLO(model_path)

        # 3. 구독 타입 수정: Image -> CompressedImage
        rospy.Subscriber(image_topic, CompressedImage, self.image_callback, queue_size=1)
        
        rospy.loginfo(f"YOLO detection node started. Subscribing to {image_topic}")
        rospy.spin()

    def image_callback(self, msg):
        try:
            np_arr = np.frombuffer(msg.data, np.uint8)
            cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

            if cv_image is None:
                rospy.logwarn("Failed to decode image, skipping frame.")
                return

            results = self.model(cv_image, verbose=False)[0]

            # rqt에 띄울 결과 이미지 복사본 생성
            result_image = cv_image.copy()
            target_detected = False

            for box in results.boxes:
                x1, y1, x2, y2 = map(int, box.xyxy[0].tolist())
                conf = box.conf[0].item()
                cls_id = int(box.cls[0].item())
                
                # 제어기가 기다리는 '직좌 신호' 클래스(3번)가 검출되었는지 확인
                if cls_id == 3:
                    target_detected = True

                # 결과 이미지에 바운딩 박스와 라벨 그리기
                label = f"{self.model.names[cls_id]} {conf:.2f}"
                cv2.rectangle(result_image, (x1, y1), (x2, y2), (0, 255, 0), 2)
                cv2.putText(result_image, label, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)

            # 직좌 신호가 화면에 있다면 제어기로 3번 신호 쏘기
            if target_detected:
                self.signal_pub.publish(Int32(3))

            # OpenCV 이미지를 ROS Image 메시지로 변환하여 rqt 용으로 발행
            img_msg = self.bridge.cv2_to_imgmsg(result_image, encoding="bgr8")
            self.image_pub.publish(img_msg)

        except Exception as e:
            rospy.logerr(f"Error processing image: {e}")

if __name__ == '__main__':
    try:
        YoloNode()
    except rospy.ROSInterruptException:
        rospy.loginfo("ROS node interrupted.")