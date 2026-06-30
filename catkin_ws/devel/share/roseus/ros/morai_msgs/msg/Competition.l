;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::Competition)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'Competition (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::COMPETITION")
  (make-package "MORAI_MSGS::COMPETITION"))

(in-package "ROS")
;;//! \htmlinclude Competition.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass morai_msgs::Competition
  :super ros::object
  :slots (_header _start_signal _team_name _mission_success ))

(defmethod morai_msgs::Competition
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:start_signal __start_signal) 0)
    ((:team_name __team_name) "")
    ((:mission_success __mission_success) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _start_signal (round __start_signal))
   (setq _team_name (string __team_name))
   (setq _mission_success __mission_success)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:start_signal
   (&optional __start_signal)
   (if __start_signal (setq _start_signal __start_signal)) _start_signal)
  (:team_name
   (&optional __team_name)
   (if __team_name (setq _team_name __team_name)) _team_name)
  (:mission_success
   (&optional (__mission_success :null))
   (if (not (eq __mission_success :null)) (setq _mission_success __mission_success)) _mission_success)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _start_signal
    1
    ;; string _team_name
    4 (length _team_name)
    ;; bool _mission_success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _start_signal
       (write-byte _start_signal s)
     ;; string _team_name
       (write-long (length _team_name) s) (princ _team_name s)
     ;; bool _mission_success
       (if _mission_success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _start_signal
     (setq _start_signal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _team_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _team_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _mission_success
     (setq _mission_success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get morai_msgs::Competition :md5sum-) "bcb03cff40c27e30f70555863407010b")
(setf (get morai_msgs::Competition :datatype-) "morai_msgs/Competition")
(setf (get morai_msgs::Competition :definition-)
      "Header header
uint8 start_signal
string team_name 
bool mission_success

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

")



(provide :morai_msgs/Competition "bcb03cff40c27e30f70555863407010b")


