;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::RobotPose)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'RobotPose (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::ROBOTPOSE")
  (make-package "MORAI_MSGS::ROBOTPOSE"))

(in-package "ROS")
;;//! \htmlinclude RobotPose.msg.html


(defclass morai_msgs::RobotPose
  :super ros::object
  :slots (_position_x _position_y _position_z _orientation_x _orientation_y _orientation_z ))

(defmethod morai_msgs::RobotPose
  (:init
   (&key
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    ((:position_z __position_z) 0.0)
    ((:orientation_x __orientation_x) 0.0)
    ((:orientation_y __orientation_y) 0.0)
    ((:orientation_z __orientation_z) 0.0)
    )
   (send-super :init)
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   (setq _position_z (float __position_z))
   (setq _orientation_x (float __orientation_x))
   (setq _orientation_y (float __orientation_y))
   (setq _orientation_z (float __orientation_z))
   self)
  (:position_x
   (&optional __position_x)
   (if __position_x (setq _position_x __position_x)) _position_x)
  (:position_y
   (&optional __position_y)
   (if __position_y (setq _position_y __position_y)) _position_y)
  (:position_z
   (&optional __position_z)
   (if __position_z (setq _position_z __position_z)) _position_z)
  (:orientation_x
   (&optional __orientation_x)
   (if __orientation_x (setq _orientation_x __orientation_x)) _orientation_x)
  (:orientation_y
   (&optional __orientation_y)
   (if __orientation_y (setq _orientation_y __orientation_y)) _orientation_y)
  (:orientation_z
   (&optional __orientation_z)
   (if __orientation_z (setq _orientation_z __orientation_z)) _orientation_z)
  (:serialization-length
   ()
   (+
    ;; float32 _position_x
    4
    ;; float32 _position_y
    4
    ;; float32 _position_z
    4
    ;; float32 _orientation_x
    4
    ;; float32 _orientation_y
    4
    ;; float32 _orientation_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _position_x
       (sys::poke _position_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _position_y
       (sys::poke _position_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _position_z
       (sys::poke _position_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _orientation_x
       (sys::poke _orientation_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _orientation_y
       (sys::poke _orientation_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _orientation_z
       (sys::poke _orientation_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _position_x
     (setq _position_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _position_y
     (setq _position_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _position_z
     (setq _position_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _orientation_x
     (setq _orientation_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _orientation_y
     (setq _orientation_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _orientation_z
     (setq _orientation_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get morai_msgs::RobotPose :md5sum-) "957c08c29c2c14d2b47dfb19794a6b00")
(setf (get morai_msgs::RobotPose :datatype-) "morai_msgs/RobotPose")
(setf (get morai_msgs::RobotPose :definition-)
      "float32 position_x
float32 position_y
float32 position_z

float32 orientation_x
float32 orientation_y
float32 orientation_z
")



(provide :morai_msgs/RobotPose "957c08c29c2c14d2b47dfb19794a6b00")


