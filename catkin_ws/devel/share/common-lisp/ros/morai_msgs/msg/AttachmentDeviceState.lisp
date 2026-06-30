; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude AttachmentDeviceState.msg.html

(cl:defclass <AttachmentDeviceState> (roslisp-msg-protocol:ros-message)
  ((sensor1
    :reader sensor1
    :initarg :sensor1
    :type cl:integer
    :initform 0)
   (sensor2
    :reader sensor2
    :initarg :sensor2
    :type cl:integer
    :initform 0)
   (sensor3
    :reader sensor3
    :initarg :sensor3
    :type cl:integer
    :initform 0)
   (sensor4
    :reader sensor4
    :initarg :sensor4
    :type cl:integer
    :initform 0))
)

(cl:defclass AttachmentDeviceState (<AttachmentDeviceState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AttachmentDeviceState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AttachmentDeviceState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<AttachmentDeviceState> is deprecated: use morai_msgs-msg:AttachmentDeviceState instead.")))

(cl:ensure-generic-function 'sensor1-val :lambda-list '(m))
(cl:defmethod sensor1-val ((m <AttachmentDeviceState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:sensor1-val is deprecated.  Use morai_msgs-msg:sensor1 instead.")
  (sensor1 m))

(cl:ensure-generic-function 'sensor2-val :lambda-list '(m))
(cl:defmethod sensor2-val ((m <AttachmentDeviceState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:sensor2-val is deprecated.  Use morai_msgs-msg:sensor2 instead.")
  (sensor2 m))

(cl:ensure-generic-function 'sensor3-val :lambda-list '(m))
(cl:defmethod sensor3-val ((m <AttachmentDeviceState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:sensor3-val is deprecated.  Use morai_msgs-msg:sensor3 instead.")
  (sensor3 m))

(cl:ensure-generic-function 'sensor4-val :lambda-list '(m))
(cl:defmethod sensor4-val ((m <AttachmentDeviceState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:sensor4-val is deprecated.  Use morai_msgs-msg:sensor4 instead.")
  (sensor4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AttachmentDeviceState>) ostream)
  "Serializes a message object of type '<AttachmentDeviceState>"
  (cl:let* ((signed (cl:slot-value msg 'sensor1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sensor2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sensor3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sensor4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AttachmentDeviceState>) istream)
  "Deserializes a message object of type '<AttachmentDeviceState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor3) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sensor4) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AttachmentDeviceState>)))
  "Returns string type for a message object of type '<AttachmentDeviceState>"
  "morai_msgs/AttachmentDeviceState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AttachmentDeviceState)))
  "Returns string type for a message object of type 'AttachmentDeviceState"
  "morai_msgs/AttachmentDeviceState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AttachmentDeviceState>)))
  "Returns md5sum for a message object of type '<AttachmentDeviceState>"
  "28db62a0887dae3362a1a7153c82b912")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AttachmentDeviceState)))
  "Returns md5sum for a message object of type 'AttachmentDeviceState"
  "28db62a0887dae3362a1a7153c82b912")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AttachmentDeviceState>)))
  "Returns full string definition for message of type '<AttachmentDeviceState>"
  (cl:format cl:nil "int32 sensor1~%int32 sensor2~%int32 sensor3~%int32 sensor4~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AttachmentDeviceState)))
  "Returns full string definition for message of type 'AttachmentDeviceState"
  (cl:format cl:nil "int32 sensor1~%int32 sensor2~%int32 sensor3~%int32 sensor4~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AttachmentDeviceState>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AttachmentDeviceState>))
  "Converts a ROS message object to a list"
  (cl:list 'AttachmentDeviceState
    (cl:cons ':sensor1 (sensor1 msg))
    (cl:cons ':sensor2 (sensor2 msg))
    (cl:cons ':sensor3 (sensor3 msg))
    (cl:cons ':sensor4 (sensor4 msg))
))
