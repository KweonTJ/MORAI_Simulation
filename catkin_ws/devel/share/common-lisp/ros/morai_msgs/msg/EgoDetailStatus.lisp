; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude EgoDetailStatus.msg.html

(cl:defclass <EgoDetailStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (unique_id
    :reader unique_id
    :initarg :unique_id
    :type cl:integer
    :initform 0)
   (front_left_location
    :reader front_left_location
    :initarg :front_left_location
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (front_right_location
    :reader front_right_location
    :initarg :front_right_location
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (rear_left_location
    :reader rear_left_location
    :initarg :rear_left_location
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (rear_right_location
    :reader rear_right_location
    :initarg :rear_right_location
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (turn_signal_lamp
    :reader turn_signal_lamp
    :initarg :turn_signal_lamp
    :type cl:fixnum
    :initform 0))
)

(cl:defclass EgoDetailStatus (<EgoDetailStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EgoDetailStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EgoDetailStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<EgoDetailStatus> is deprecated: use morai_msgs-msg:EgoDetailStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:header-val is deprecated.  Use morai_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'unique_id-val :lambda-list '(m))
(cl:defmethod unique_id-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:unique_id-val is deprecated.  Use morai_msgs-msg:unique_id instead.")
  (unique_id m))

(cl:ensure-generic-function 'front_left_location-val :lambda-list '(m))
(cl:defmethod front_left_location-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:front_left_location-val is deprecated.  Use morai_msgs-msg:front_left_location instead.")
  (front_left_location m))

(cl:ensure-generic-function 'front_right_location-val :lambda-list '(m))
(cl:defmethod front_right_location-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:front_right_location-val is deprecated.  Use morai_msgs-msg:front_right_location instead.")
  (front_right_location m))

(cl:ensure-generic-function 'rear_left_location-val :lambda-list '(m))
(cl:defmethod rear_left_location-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:rear_left_location-val is deprecated.  Use morai_msgs-msg:rear_left_location instead.")
  (rear_left_location m))

(cl:ensure-generic-function 'rear_right_location-val :lambda-list '(m))
(cl:defmethod rear_right_location-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:rear_right_location-val is deprecated.  Use morai_msgs-msg:rear_right_location instead.")
  (rear_right_location m))

(cl:ensure-generic-function 'turn_signal_lamp-val :lambda-list '(m))
(cl:defmethod turn_signal_lamp-val ((m <EgoDetailStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:turn_signal_lamp-val is deprecated.  Use morai_msgs-msg:turn_signal_lamp instead.")
  (turn_signal_lamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EgoDetailStatus>) ostream)
  "Serializes a message object of type '<EgoDetailStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'unique_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'front_left_location) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'front_right_location) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rear_left_location) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rear_right_location) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'turn_signal_lamp)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EgoDetailStatus>) istream)
  "Deserializes a message object of type '<EgoDetailStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'unique_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'front_left_location) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'front_right_location) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rear_left_location) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rear_right_location) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'turn_signal_lamp)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EgoDetailStatus>)))
  "Returns string type for a message object of type '<EgoDetailStatus>"
  "morai_msgs/EgoDetailStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EgoDetailStatus)))
  "Returns string type for a message object of type 'EgoDetailStatus"
  "morai_msgs/EgoDetailStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EgoDetailStatus>)))
  "Returns md5sum for a message object of type '<EgoDetailStatus>"
  "d27a205035704912eadcd8056b5dd496")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EgoDetailStatus)))
  "Returns md5sum for a message object of type 'EgoDetailStatus"
  "d27a205035704912eadcd8056b5dd496")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EgoDetailStatus>)))
  "Returns full string definition for message of type '<EgoDetailStatus>"
  (cl:format cl:nil "Header header~%int32 unique_id~%geometry_msgs/Point front_left_location~%geometry_msgs/Point front_right_location~%geometry_msgs/Point rear_left_location~%geometry_msgs/Point rear_right_location~%uint8 turn_signal_lamp~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EgoDetailStatus)))
  "Returns full string definition for message of type 'EgoDetailStatus"
  (cl:format cl:nil "Header header~%int32 unique_id~%geometry_msgs/Point front_left_location~%geometry_msgs/Point front_right_location~%geometry_msgs/Point rear_left_location~%geometry_msgs/Point rear_right_location~%uint8 turn_signal_lamp~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EgoDetailStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'front_left_location))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'front_right_location))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rear_left_location))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rear_right_location))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EgoDetailStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'EgoDetailStatus
    (cl:cons ':header (header msg))
    (cl:cons ':unique_id (unique_id msg))
    (cl:cons ':front_left_location (front_left_location msg))
    (cl:cons ':front_right_location (front_right_location msg))
    (cl:cons ':rear_left_location (rear_left_location msg))
    (cl:cons ':rear_right_location (rear_right_location msg))
    (cl:cons ':turn_signal_lamp (turn_signal_lamp msg))
))
