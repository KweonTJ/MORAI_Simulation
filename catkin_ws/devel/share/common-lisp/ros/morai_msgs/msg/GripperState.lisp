; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude GripperState.msg.html

(cl:defclass <GripperState> (roslisp-msg-protocol:ros-message)
  ((release_limit
    :reader release_limit
    :initarg :release_limit
    :type cl:boolean
    :initform cl:nil)
   (grip_limit
    :reader grip_limit
    :initarg :grip_limit
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GripperState (<GripperState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<GripperState> is deprecated: use morai_msgs-msg:GripperState instead.")))

(cl:ensure-generic-function 'release_limit-val :lambda-list '(m))
(cl:defmethod release_limit-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:release_limit-val is deprecated.  Use morai_msgs-msg:release_limit instead.")
  (release_limit m))

(cl:ensure-generic-function 'grip_limit-val :lambda-list '(m))
(cl:defmethod grip_limit-val ((m <GripperState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:grip_limit-val is deprecated.  Use morai_msgs-msg:grip_limit instead.")
  (grip_limit m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperState>) ostream)
  "Serializes a message object of type '<GripperState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'release_limit) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'grip_limit) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperState>) istream)
  "Deserializes a message object of type '<GripperState>"
    (cl:setf (cl:slot-value msg 'release_limit) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'grip_limit) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperState>)))
  "Returns string type for a message object of type '<GripperState>"
  "morai_msgs/GripperState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperState)))
  "Returns string type for a message object of type 'GripperState"
  "morai_msgs/GripperState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperState>)))
  "Returns md5sum for a message object of type '<GripperState>"
  "fc4558688d7d357989e10d3f6df1fa69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperState)))
  "Returns md5sum for a message object of type 'GripperState"
  "fc4558688d7d357989e10d3f6df1fa69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperState>)))
  "Returns full string definition for message of type '<GripperState>"
  (cl:format cl:nil "bool release_limit~%bool grip_limit~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperState)))
  "Returns full string definition for message of type 'GripperState"
  (cl:format cl:nil "bool release_limit~%bool grip_limit~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperState>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperState>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperState
    (cl:cons ':release_limit (release_limit msg))
    (cl:cons ':grip_limit (grip_limit msg))
))
