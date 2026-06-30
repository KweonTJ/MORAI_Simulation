;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::EgoNoisyStatus)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'EgoNoisyStatus (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::EGONOISYSTATUS")
  (make-package "MORAI_MSGS::EGONOISYSTATUS"))

(in-package "ROS")
;;//! \htmlinclude EgoNoisyStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass morai_msgs::EgoNoisyStatus
  :super ros::object
  :slots (_header _noisy_position _noisy_orientation _noisy_enu_velocity _noisy_velocity _noisy_angularVelocity _noisy_acceleration _accel _brake _steer ))

(defmethod morai_msgs::EgoNoisyStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:noisy_position __noisy_position) (instance morai_msgs::ENU :init))
    ((:noisy_orientation __noisy_orientation) (instance morai_msgs::RPY :init))
    ((:noisy_enu_velocity __noisy_enu_velocity) (instance morai_msgs::ENU :init))
    ((:noisy_velocity __noisy_velocity) (instance morai_msgs::XYZ :init))
    ((:noisy_angularVelocity __noisy_angularVelocity) (instance morai_msgs::RPY :init))
    ((:noisy_acceleration __noisy_acceleration) (instance morai_msgs::XYZ :init))
    ((:accel __accel) 0.0)
    ((:brake __brake) 0.0)
    ((:steer __steer) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _noisy_position __noisy_position)
   (setq _noisy_orientation __noisy_orientation)
   (setq _noisy_enu_velocity __noisy_enu_velocity)
   (setq _noisy_velocity __noisy_velocity)
   (setq _noisy_angularVelocity __noisy_angularVelocity)
   (setq _noisy_acceleration __noisy_acceleration)
   (setq _accel (float __accel))
   (setq _brake (float __brake))
   (setq _steer (float __steer))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:noisy_position
   (&rest __noisy_position)
   (if (keywordp (car __noisy_position))
       (send* _noisy_position __noisy_position)
     (progn
       (if __noisy_position (setq _noisy_position (car __noisy_position)))
       _noisy_position)))
  (:noisy_orientation
   (&rest __noisy_orientation)
   (if (keywordp (car __noisy_orientation))
       (send* _noisy_orientation __noisy_orientation)
     (progn
       (if __noisy_orientation (setq _noisy_orientation (car __noisy_orientation)))
       _noisy_orientation)))
  (:noisy_enu_velocity
   (&rest __noisy_enu_velocity)
   (if (keywordp (car __noisy_enu_velocity))
       (send* _noisy_enu_velocity __noisy_enu_velocity)
     (progn
       (if __noisy_enu_velocity (setq _noisy_enu_velocity (car __noisy_enu_velocity)))
       _noisy_enu_velocity)))
  (:noisy_velocity
   (&rest __noisy_velocity)
   (if (keywordp (car __noisy_velocity))
       (send* _noisy_velocity __noisy_velocity)
     (progn
       (if __noisy_velocity (setq _noisy_velocity (car __noisy_velocity)))
       _noisy_velocity)))
  (:noisy_angularVelocity
   (&rest __noisy_angularVelocity)
   (if (keywordp (car __noisy_angularVelocity))
       (send* _noisy_angularVelocity __noisy_angularVelocity)
     (progn
       (if __noisy_angularVelocity (setq _noisy_angularVelocity (car __noisy_angularVelocity)))
       _noisy_angularVelocity)))
  (:noisy_acceleration
   (&rest __noisy_acceleration)
   (if (keywordp (car __noisy_acceleration))
       (send* _noisy_acceleration __noisy_acceleration)
     (progn
       (if __noisy_acceleration (setq _noisy_acceleration (car __noisy_acceleration)))
       _noisy_acceleration)))
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:steer
   (&optional __steer)
   (if __steer (setq _steer __steer)) _steer)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; morai_msgs/ENU _noisy_position
    (send _noisy_position :serialization-length)
    ;; morai_msgs/RPY _noisy_orientation
    (send _noisy_orientation :serialization-length)
    ;; morai_msgs/ENU _noisy_enu_velocity
    (send _noisy_enu_velocity :serialization-length)
    ;; morai_msgs/XYZ _noisy_velocity
    (send _noisy_velocity :serialization-length)
    ;; morai_msgs/RPY _noisy_angularVelocity
    (send _noisy_angularVelocity :serialization-length)
    ;; morai_msgs/XYZ _noisy_acceleration
    (send _noisy_acceleration :serialization-length)
    ;; float32 _accel
    4
    ;; float32 _brake
    4
    ;; float32 _steer
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; morai_msgs/ENU _noisy_position
       (send _noisy_position :serialize s)
     ;; morai_msgs/RPY _noisy_orientation
       (send _noisy_orientation :serialize s)
     ;; morai_msgs/ENU _noisy_enu_velocity
       (send _noisy_enu_velocity :serialize s)
     ;; morai_msgs/XYZ _noisy_velocity
       (send _noisy_velocity :serialize s)
     ;; morai_msgs/RPY _noisy_angularVelocity
       (send _noisy_angularVelocity :serialize s)
     ;; morai_msgs/XYZ _noisy_acceleration
       (send _noisy_acceleration :serialize s)
     ;; float32 _accel
       (sys::poke _accel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steer
       (sys::poke _steer (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; morai_msgs/ENU _noisy_position
     (send _noisy_position :deserialize buf ptr-) (incf ptr- (send _noisy_position :serialization-length))
   ;; morai_msgs/RPY _noisy_orientation
     (send _noisy_orientation :deserialize buf ptr-) (incf ptr- (send _noisy_orientation :serialization-length))
   ;; morai_msgs/ENU _noisy_enu_velocity
     (send _noisy_enu_velocity :deserialize buf ptr-) (incf ptr- (send _noisy_enu_velocity :serialization-length))
   ;; morai_msgs/XYZ _noisy_velocity
     (send _noisy_velocity :deserialize buf ptr-) (incf ptr- (send _noisy_velocity :serialization-length))
   ;; morai_msgs/RPY _noisy_angularVelocity
     (send _noisy_angularVelocity :deserialize buf ptr-) (incf ptr- (send _noisy_angularVelocity :serialization-length))
   ;; morai_msgs/XYZ _noisy_acceleration
     (send _noisy_acceleration :deserialize buf ptr-) (incf ptr- (send _noisy_acceleration :serialization-length))
   ;; float32 _accel
     (setq _accel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake
     (setq _brake (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steer
     (setq _steer (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get morai_msgs::EgoNoisyStatus :md5sum-) "93b556ef5e38f8da38c67217e4fe4664")
(setf (get morai_msgs::EgoNoisyStatus :datatype-) "morai_msgs/EgoNoisyStatus")
(setf (get morai_msgs::EgoNoisyStatus :definition-)
      "Header header

morai_msgs/ENU noisy_position
morai_msgs/RPY noisy_orientation
morai_msgs/ENU noisy_enu_velocity
morai_msgs/XYZ noisy_velocity
morai_msgs/RPY noisy_angularVelocity
morai_msgs/XYZ noisy_acceleration

float32 accel
float32 brake
float32 steer

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: morai_msgs/ENU
float32 east
float32 north
float32 up

================================================================================
MSG: morai_msgs/RPY
float32 roll
float32 pitch
float32 yaw

================================================================================
MSG: morai_msgs/XYZ
float32 x
float32 y
float32 z

")



(provide :morai_msgs/EgoNoisyStatus "93b556ef5e38f8da38c67217e4fe4664")


