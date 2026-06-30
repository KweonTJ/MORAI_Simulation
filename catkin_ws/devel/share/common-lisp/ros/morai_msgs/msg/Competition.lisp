; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude Competition.msg.html

(cl:defclass <Competition> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (start_signal
    :reader start_signal
    :initarg :start_signal
    :type cl:fixnum
    :initform 0)
   (team_name
    :reader team_name
    :initarg :team_name
    :type cl:string
    :initform "")
   (mission_success
    :reader mission_success
    :initarg :mission_success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Competition (<Competition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Competition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Competition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<Competition> is deprecated: use morai_msgs-msg:Competition instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Competition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:header-val is deprecated.  Use morai_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'start_signal-val :lambda-list '(m))
(cl:defmethod start_signal-val ((m <Competition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:start_signal-val is deprecated.  Use morai_msgs-msg:start_signal instead.")
  (start_signal m))

(cl:ensure-generic-function 'team_name-val :lambda-list '(m))
(cl:defmethod team_name-val ((m <Competition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:team_name-val is deprecated.  Use morai_msgs-msg:team_name instead.")
  (team_name m))

(cl:ensure-generic-function 'mission_success-val :lambda-list '(m))
(cl:defmethod mission_success-val ((m <Competition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:mission_success-val is deprecated.  Use morai_msgs-msg:mission_success instead.")
  (mission_success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Competition>) ostream)
  "Serializes a message object of type '<Competition>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start_signal)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'team_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'team_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mission_success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Competition>) istream)
  "Deserializes a message object of type '<Competition>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start_signal)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'team_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'team_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'mission_success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Competition>)))
  "Returns string type for a message object of type '<Competition>"
  "morai_msgs/Competition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Competition)))
  "Returns string type for a message object of type 'Competition"
  "morai_msgs/Competition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Competition>)))
  "Returns md5sum for a message object of type '<Competition>"
  "bcb03cff40c27e30f70555863407010b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Competition)))
  "Returns md5sum for a message object of type 'Competition"
  "bcb03cff40c27e30f70555863407010b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Competition>)))
  "Returns full string definition for message of type '<Competition>"
  (cl:format cl:nil "Header header~%uint8 start_signal~%string team_name ~%bool mission_success~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Competition)))
  "Returns full string definition for message of type 'Competition"
  (cl:format cl:nil "Header header~%uint8 start_signal~%string team_name ~%bool mission_success~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Competition>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4 (cl:length (cl:slot-value msg 'team_name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Competition>))
  "Converts a ROS message object to a list"
  (cl:list 'Competition
    (cl:cons ':header (header msg))
    (cl:cons ':start_signal (start_signal msg))
    (cl:cons ':team_name (team_name msg))
    (cl:cons ':mission_success (mission_success msg))
))
