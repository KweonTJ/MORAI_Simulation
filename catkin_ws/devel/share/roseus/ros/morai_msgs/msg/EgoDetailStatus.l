;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::EgoDetailStatus)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'EgoDetailStatus (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::EGODETAILSTATUS")
  (make-package "MORAI_MSGS::EGODETAILSTATUS"))

(in-package "ROS")
;;//! \htmlinclude EgoDetailStatus.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass morai_msgs::EgoDetailStatus
  :super ros::object
  :slots (_header _unique_id _front_left_location _front_right_location _rear_left_location _rear_right_location _turn_signal_lamp ))

(defmethod morai_msgs::EgoDetailStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:unique_id __unique_id) 0)
    ((:front_left_location __front_left_location) (instance geometry_msgs::Point :init))
    ((:front_right_location __front_right_location) (instance geometry_msgs::Point :init))
    ((:rear_left_location __rear_left_location) (instance geometry_msgs::Point :init))
    ((:rear_right_location __rear_right_location) (instance geometry_msgs::Point :init))
    ((:turn_signal_lamp __turn_signal_lamp) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _unique_id (round __unique_id))
   (setq _front_left_location __front_left_location)
   (setq _front_right_location __front_right_location)
   (setq _rear_left_location __rear_left_location)
   (setq _rear_right_location __rear_right_location)
   (setq _turn_signal_lamp (round __turn_signal_lamp))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:unique_id
   (&optional __unique_id)
   (if __unique_id (setq _unique_id __unique_id)) _unique_id)
  (:front_left_location
   (&rest __front_left_location)
   (if (keywordp (car __front_left_location))
       (send* _front_left_location __front_left_location)
     (progn
       (if __front_left_location (setq _front_left_location (car __front_left_location)))
       _front_left_location)))
  (:front_right_location
   (&rest __front_right_location)
   (if (keywordp (car __front_right_location))
       (send* _front_right_location __front_right_location)
     (progn
       (if __front_right_location (setq _front_right_location (car __front_right_location)))
       _front_right_location)))
  (:rear_left_location
   (&rest __rear_left_location)
   (if (keywordp (car __rear_left_location))
       (send* _rear_left_location __rear_left_location)
     (progn
       (if __rear_left_location (setq _rear_left_location (car __rear_left_location)))
       _rear_left_location)))
  (:rear_right_location
   (&rest __rear_right_location)
   (if (keywordp (car __rear_right_location))
       (send* _rear_right_location __rear_right_location)
     (progn
       (if __rear_right_location (setq _rear_right_location (car __rear_right_location)))
       _rear_right_location)))
  (:turn_signal_lamp
   (&optional __turn_signal_lamp)
   (if __turn_signal_lamp (setq _turn_signal_lamp __turn_signal_lamp)) _turn_signal_lamp)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _unique_id
    4
    ;; geometry_msgs/Point _front_left_location
    (send _front_left_location :serialization-length)
    ;; geometry_msgs/Point _front_right_location
    (send _front_right_location :serialization-length)
    ;; geometry_msgs/Point _rear_left_location
    (send _rear_left_location :serialization-length)
    ;; geometry_msgs/Point _rear_right_location
    (send _rear_right_location :serialization-length)
    ;; uint8 _turn_signal_lamp
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _unique_id
       (write-long _unique_id s)
     ;; geometry_msgs/Point _front_left_location
       (send _front_left_location :serialize s)
     ;; geometry_msgs/Point _front_right_location
       (send _front_right_location :serialize s)
     ;; geometry_msgs/Point _rear_left_location
       (send _rear_left_location :serialize s)
     ;; geometry_msgs/Point _rear_right_location
       (send _rear_right_location :serialize s)
     ;; uint8 _turn_signal_lamp
       (write-byte _turn_signal_lamp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _unique_id
     (setq _unique_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point _front_left_location
     (send _front_left_location :deserialize buf ptr-) (incf ptr- (send _front_left_location :serialization-length))
   ;; geometry_msgs/Point _front_right_location
     (send _front_right_location :deserialize buf ptr-) (incf ptr- (send _front_right_location :serialization-length))
   ;; geometry_msgs/Point _rear_left_location
     (send _rear_left_location :deserialize buf ptr-) (incf ptr- (send _rear_left_location :serialization-length))
   ;; geometry_msgs/Point _rear_right_location
     (send _rear_right_location :deserialize buf ptr-) (incf ptr- (send _rear_right_location :serialization-length))
   ;; uint8 _turn_signal_lamp
     (setq _turn_signal_lamp (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get morai_msgs::EgoDetailStatus :md5sum-) "d27a205035704912eadcd8056b5dd496")
(setf (get morai_msgs::EgoDetailStatus :datatype-) "morai_msgs/EgoDetailStatus")
(setf (get morai_msgs::EgoDetailStatus :definition-)
      "Header header
int32 unique_id
geometry_msgs/Point front_left_location
geometry_msgs/Point front_right_location
geometry_msgs/Point rear_left_location
geometry_msgs/Point rear_right_location
uint8 turn_signal_lamp

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :morai_msgs/EgoDetailStatus "d27a205035704912eadcd8056b5dd496")


