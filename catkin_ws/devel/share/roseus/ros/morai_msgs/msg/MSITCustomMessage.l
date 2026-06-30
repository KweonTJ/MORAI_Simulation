;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::MSITCustomMessage)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'MSITCustomMessage (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::MSITCUSTOMMESSAGE")
  (make-package "MORAI_MSGS::MSITCUSTOMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude MSITCustomMessage.msg.html


(defclass morai_msgs::MSITCustomMessage
  :super ros::object
  :slots (_position_x _position_y _position_z _velocity_x _velocity_y _velocity_z _acceleration_x _acceleration_y _acceleration_z _max_lateral_acceleration _yaw_angle _front_wheel_angle _throttle _brake _TTC _width _height _fallback_trigger _MRM_select_info _is_collision _way_off_distance _sur_way_off_distance ))

(defmethod morai_msgs::MSITCustomMessage
  (:init
   (&key
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    ((:position_z __position_z) 0.0)
    ((:velocity_x __velocity_x) 0.0)
    ((:velocity_y __velocity_y) 0.0)
    ((:velocity_z __velocity_z) 0.0)
    ((:acceleration_x __acceleration_x) 0.0)
    ((:acceleration_y __acceleration_y) 0.0)
    ((:acceleration_z __acceleration_z) 0.0)
    ((:max_lateral_acceleration __max_lateral_acceleration) 0.0)
    ((:yaw_angle __yaw_angle) 0.0)
    ((:front_wheel_angle __front_wheel_angle) 0.0)
    ((:throttle __throttle) 0.0)
    ((:brake __brake) 0.0)
    ((:TTC __TTC) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:fallback_trigger __fallback_trigger) nil)
    ((:MRM_select_info __MRM_select_info) 0)
    ((:is_collision __is_collision) nil)
    ((:way_off_distance __way_off_distance) 0.0)
    ((:sur_way_off_distance __sur_way_off_distance) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   (setq _position_z (float __position_z))
   (setq _velocity_x (float __velocity_x))
   (setq _velocity_y (float __velocity_y))
   (setq _velocity_z (float __velocity_z))
   (setq _acceleration_x (float __acceleration_x))
   (setq _acceleration_y (float __acceleration_y))
   (setq _acceleration_z (float __acceleration_z))
   (setq _max_lateral_acceleration (float __max_lateral_acceleration))
   (setq _yaw_angle (float __yaw_angle))
   (setq _front_wheel_angle (float __front_wheel_angle))
   (setq _throttle (float __throttle))
   (setq _brake (float __brake))
   (setq _TTC (float __TTC))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _fallback_trigger __fallback_trigger)
   (setq _MRM_select_info (round __MRM_select_info))
   (setq _is_collision __is_collision)
   (setq _way_off_distance (float __way_off_distance))
   (setq _sur_way_off_distance __sur_way_off_distance)
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
  (:velocity_x
   (&optional __velocity_x)
   (if __velocity_x (setq _velocity_x __velocity_x)) _velocity_x)
  (:velocity_y
   (&optional __velocity_y)
   (if __velocity_y (setq _velocity_y __velocity_y)) _velocity_y)
  (:velocity_z
   (&optional __velocity_z)
   (if __velocity_z (setq _velocity_z __velocity_z)) _velocity_z)
  (:acceleration_x
   (&optional __acceleration_x)
   (if __acceleration_x (setq _acceleration_x __acceleration_x)) _acceleration_x)
  (:acceleration_y
   (&optional __acceleration_y)
   (if __acceleration_y (setq _acceleration_y __acceleration_y)) _acceleration_y)
  (:acceleration_z
   (&optional __acceleration_z)
   (if __acceleration_z (setq _acceleration_z __acceleration_z)) _acceleration_z)
  (:max_lateral_acceleration
   (&optional __max_lateral_acceleration)
   (if __max_lateral_acceleration (setq _max_lateral_acceleration __max_lateral_acceleration)) _max_lateral_acceleration)
  (:yaw_angle
   (&optional __yaw_angle)
   (if __yaw_angle (setq _yaw_angle __yaw_angle)) _yaw_angle)
  (:front_wheel_angle
   (&optional __front_wheel_angle)
   (if __front_wheel_angle (setq _front_wheel_angle __front_wheel_angle)) _front_wheel_angle)
  (:throttle
   (&optional __throttle)
   (if __throttle (setq _throttle __throttle)) _throttle)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:TTC
   (&optional __TTC)
   (if __TTC (setq _TTC __TTC)) _TTC)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:fallback_trigger
   (&optional (__fallback_trigger :null))
   (if (not (eq __fallback_trigger :null)) (setq _fallback_trigger __fallback_trigger)) _fallback_trigger)
  (:MRM_select_info
   (&optional __MRM_select_info)
   (if __MRM_select_info (setq _MRM_select_info __MRM_select_info)) _MRM_select_info)
  (:is_collision
   (&optional (__is_collision :null))
   (if (not (eq __is_collision :null)) (setq _is_collision __is_collision)) _is_collision)
  (:way_off_distance
   (&optional __way_off_distance)
   (if __way_off_distance (setq _way_off_distance __way_off_distance)) _way_off_distance)
  (:sur_way_off_distance
   (&optional __sur_way_off_distance)
   (if __sur_way_off_distance (setq _sur_way_off_distance __sur_way_off_distance)) _sur_way_off_distance)
  (:serialization-length
   ()
   (+
    ;; float32 _position_x
    4
    ;; float32 _position_y
    4
    ;; float32 _position_z
    4
    ;; float32 _velocity_x
    4
    ;; float32 _velocity_y
    4
    ;; float32 _velocity_z
    4
    ;; float32 _acceleration_x
    4
    ;; float32 _acceleration_y
    4
    ;; float32 _acceleration_z
    4
    ;; float32 _max_lateral_acceleration
    4
    ;; float32 _yaw_angle
    4
    ;; float32 _front_wheel_angle
    4
    ;; float32 _throttle
    4
    ;; float32 _brake
    4
    ;; float32 _TTC
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; bool _fallback_trigger
    1
    ;; int32 _MRM_select_info
    4
    ;; bool _is_collision
    1
    ;; float32 _way_off_distance
    4
    ;; float32[] _sur_way_off_distance
    (* 4    (length _sur_way_off_distance)) 4
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
     ;; float32 _velocity_x
       (sys::poke _velocity_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity_y
       (sys::poke _velocity_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity_z
       (sys::poke _velocity_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration_x
       (sys::poke _acceleration_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration_y
       (sys::poke _acceleration_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration_z
       (sys::poke _acceleration_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_lateral_acceleration
       (sys::poke _max_lateral_acceleration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_angle
       (sys::poke _yaw_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _front_wheel_angle
       (sys::poke _front_wheel_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _throttle
       (sys::poke _throttle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _TTC
       (sys::poke _TTC (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _fallback_trigger
       (if _fallback_trigger (write-byte -1 s) (write-byte 0 s))
     ;; int32 _MRM_select_info
       (write-long _MRM_select_info s)
     ;; bool _is_collision
       (if _is_collision (write-byte -1 s) (write-byte 0 s))
     ;; float32 _way_off_distance
       (sys::poke _way_off_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _sur_way_off_distance
     (write-long (length _sur_way_off_distance) s)
     (dotimes (i (length _sur_way_off_distance))
       (sys::poke (elt _sur_way_off_distance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
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
   ;; float32 _velocity_x
     (setq _velocity_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity_y
     (setq _velocity_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity_z
     (setq _velocity_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration_x
     (setq _acceleration_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration_y
     (setq _acceleration_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration_z
     (setq _acceleration_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_lateral_acceleration
     (setq _max_lateral_acceleration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_angle
     (setq _yaw_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _front_wheel_angle
     (setq _front_wheel_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _throttle
     (setq _throttle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _brake
     (setq _brake (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _TTC
     (setq _TTC (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _fallback_trigger
     (setq _fallback_trigger (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _MRM_select_info
     (setq _MRM_select_info (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _is_collision
     (setq _is_collision (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _way_off_distance
     (setq _way_off_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _sur_way_off_distance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sur_way_off_distance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sur_way_off_distance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get morai_msgs::MSITCustomMessage :md5sum-) "8f4eb9640f94fd0ad3eb006965c55b6b")
(setf (get morai_msgs::MSITCustomMessage :datatype-) "morai_msgs/MSITCustomMessage")
(setf (get morai_msgs::MSITCustomMessage :definition-)
      "float32 position_x
float32 position_y
float32 position_z
float32 velocity_x
float32 velocity_y
float32 velocity_z
float32 acceleration_x
float32 acceleration_y
float32 acceleration_z
float32 max_lateral_acceleration
float32 yaw_angle
float32 front_wheel_angle
float32 throttle
float32 brake
float32 TTC
float32 width
float32 height
bool fallback_trigger
int32 MRM_select_info
bool is_collision
float32 way_off_distance
float32[] sur_way_off_distance
")



(provide :morai_msgs/MSITCustomMessage "8f4eb9640f94fd0ad3eb006965c55b6b")


