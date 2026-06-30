; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude ENU.msg.html

(cl:defclass <ENU> (roslisp-msg-protocol:ros-message)
  ((east
    :reader east
    :initarg :east
    :type cl:float
    :initform 0.0)
   (north
    :reader north
    :initarg :north
    :type cl:float
    :initform 0.0)
   (up
    :reader up
    :initarg :up
    :type cl:float
    :initform 0.0))
)

(cl:defclass ENU (<ENU>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ENU>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ENU)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<ENU> is deprecated: use morai_msgs-msg:ENU instead.")))

(cl:ensure-generic-function 'east-val :lambda-list '(m))
(cl:defmethod east-val ((m <ENU>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:east-val is deprecated.  Use morai_msgs-msg:east instead.")
  (east m))

(cl:ensure-generic-function 'north-val :lambda-list '(m))
(cl:defmethod north-val ((m <ENU>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:north-val is deprecated.  Use morai_msgs-msg:north instead.")
  (north m))

(cl:ensure-generic-function 'up-val :lambda-list '(m))
(cl:defmethod up-val ((m <ENU>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:up-val is deprecated.  Use morai_msgs-msg:up instead.")
  (up m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ENU>) ostream)
  "Serializes a message object of type '<ENU>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'east))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'north))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'up))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ENU>) istream)
  "Deserializes a message object of type '<ENU>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'east) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'north) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'up) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ENU>)))
  "Returns string type for a message object of type '<ENU>"
  "morai_msgs/ENU")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ENU)))
  "Returns string type for a message object of type 'ENU"
  "morai_msgs/ENU")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ENU>)))
  "Returns md5sum for a message object of type '<ENU>"
  "c90797f354fb2a735756281dc238dc87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ENU)))
  "Returns md5sum for a message object of type 'ENU"
  "c90797f354fb2a735756281dc238dc87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ENU>)))
  "Returns full string definition for message of type '<ENU>"
  (cl:format cl:nil "float32 east~%float32 north~%float32 up~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ENU)))
  "Returns full string definition for message of type 'ENU"
  (cl:format cl:nil "float32 east~%float32 north~%float32 up~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ENU>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ENU>))
  "Converts a ROS message object to a list"
  (cl:list 'ENU
    (cl:cons ':east (east msg))
    (cl:cons ':north (north msg))
    (cl:cons ':up (up msg))
))
