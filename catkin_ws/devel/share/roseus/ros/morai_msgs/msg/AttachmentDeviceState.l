;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::AttachmentDeviceState)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'AttachmentDeviceState (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::ATTACHMENTDEVICESTATE")
  (make-package "MORAI_MSGS::ATTACHMENTDEVICESTATE"))

(in-package "ROS")
;;//! \htmlinclude AttachmentDeviceState.msg.html


(defclass morai_msgs::AttachmentDeviceState
  :super ros::object
  :slots (_sensor1 _sensor2 _sensor3 _sensor4 ))

(defmethod morai_msgs::AttachmentDeviceState
  (:init
   (&key
    ((:sensor1 __sensor1) 0)
    ((:sensor2 __sensor2) 0)
    ((:sensor3 __sensor3) 0)
    ((:sensor4 __sensor4) 0)
    )
   (send-super :init)
   (setq _sensor1 (round __sensor1))
   (setq _sensor2 (round __sensor2))
   (setq _sensor3 (round __sensor3))
   (setq _sensor4 (round __sensor4))
   self)
  (:sensor1
   (&optional __sensor1)
   (if __sensor1 (setq _sensor1 __sensor1)) _sensor1)
  (:sensor2
   (&optional __sensor2)
   (if __sensor2 (setq _sensor2 __sensor2)) _sensor2)
  (:sensor3
   (&optional __sensor3)
   (if __sensor3 (setq _sensor3 __sensor3)) _sensor3)
  (:sensor4
   (&optional __sensor4)
   (if __sensor4 (setq _sensor4 __sensor4)) _sensor4)
  (:serialization-length
   ()
   (+
    ;; int32 _sensor1
    4
    ;; int32 _sensor2
    4
    ;; int32 _sensor3
    4
    ;; int32 _sensor4
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sensor1
       (write-long _sensor1 s)
     ;; int32 _sensor2
       (write-long _sensor2 s)
     ;; int32 _sensor3
       (write-long _sensor3 s)
     ;; int32 _sensor4
       (write-long _sensor4 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sensor1
     (setq _sensor1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sensor2
     (setq _sensor2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sensor3
     (setq _sensor3 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sensor4
     (setq _sensor4 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get morai_msgs::AttachmentDeviceState :md5sum-) "28db62a0887dae3362a1a7153c82b912")
(setf (get morai_msgs::AttachmentDeviceState :datatype-) "morai_msgs/AttachmentDeviceState")
(setf (get morai_msgs::AttachmentDeviceState :definition-)
      "int32 sensor1
int32 sensor2
int32 sensor3
int32 sensor4
")



(provide :morai_msgs/AttachmentDeviceState "28db62a0887dae3362a1a7153c82b912")


