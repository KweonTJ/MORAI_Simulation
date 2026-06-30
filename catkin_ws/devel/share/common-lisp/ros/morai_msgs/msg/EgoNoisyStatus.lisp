; Auto-generated. Do not edit!


(cl:in-package morai_msgs-msg)


;//! \htmlinclude EgoNoisyStatus.msg.html

(cl:defclass <EgoNoisyStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (noisy_position
    :reader noisy_position
    :initarg :noisy_position
    :type morai_msgs-msg:ENU
    :initform (cl:make-instance 'morai_msgs-msg:ENU))
   (noisy_orientation
    :reader noisy_orientation
    :initarg :noisy_orientation
    :type morai_msgs-msg:RPY
    :initform (cl:make-instance 'morai_msgs-msg:RPY))
   (noisy_enu_velocity
    :reader noisy_enu_velocity
    :initarg :noisy_enu_velocity
    :type morai_msgs-msg:ENU
    :initform (cl:make-instance 'morai_msgs-msg:ENU))
   (noisy_velocity
    :reader noisy_velocity
    :initarg :noisy_velocity
    :type morai_msgs-msg:XYZ
    :initform (cl:make-instance 'morai_msgs-msg:XYZ))
   (noisy_angularVelocity
    :reader noisy_angularVelocity
    :initarg :noisy_angularVelocity
    :type morai_msgs-msg:RPY
    :initform (cl:make-instance 'morai_msgs-msg:RPY))
   (noisy_acceleration
    :reader noisy_acceleration
    :initarg :noisy_acceleration
    :type morai_msgs-msg:XYZ
    :initform (cl:make-instance 'morai_msgs-msg:XYZ))
   (accel
    :reader accel
    :initarg :accel
    :type cl:float
    :initform 0.0)
   (brake
    :reader brake
    :initarg :brake
    :type cl:float
    :initform 0.0)
   (steer
    :reader steer
    :initarg :steer
    :type cl:float
    :initform 0.0))
)

(cl:defclass EgoNoisyStatus (<EgoNoisyStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EgoNoisyStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EgoNoisyStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name morai_msgs-msg:<EgoNoisyStatus> is deprecated: use morai_msgs-msg:EgoNoisyStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:header-val is deprecated.  Use morai_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'noisy_position-val :lambda-list '(m))
(cl:defmethod noisy_position-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:noisy_position-val is deprecated.  Use morai_msgs-msg:noisy_position instead.")
  (noisy_position m))

(cl:ensure-generic-function 'noisy_orientation-val :lambda-list '(m))
(cl:defmethod noisy_orientation-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:noisy_orientation-val is deprecated.  Use morai_msgs-msg:noisy_orientation instead.")
  (noisy_orientation m))

(cl:ensure-generic-function 'noisy_enu_velocity-val :lambda-list '(m))
(cl:defmethod noisy_enu_velocity-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:noisy_enu_velocity-val is deprecated.  Use morai_msgs-msg:noisy_enu_velocity instead.")
  (noisy_enu_velocity m))

(cl:ensure-generic-function 'noisy_velocity-val :lambda-list '(m))
(cl:defmethod noisy_velocity-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:noisy_velocity-val is deprecated.  Use morai_msgs-msg:noisy_velocity instead.")
  (noisy_velocity m))

(cl:ensure-generic-function 'noisy_angularVelocity-val :lambda-list '(m))
(cl:defmethod noisy_angularVelocity-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:noisy_angularVelocity-val is deprecated.  Use morai_msgs-msg:noisy_angularVelocity instead.")
  (noisy_angularVelocity m))

(cl:ensure-generic-function 'noisy_acceleration-val :lambda-list '(m))
(cl:defmethod noisy_acceleration-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:noisy_acceleration-val is deprecated.  Use morai_msgs-msg:noisy_acceleration instead.")
  (noisy_acceleration m))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:accel-val is deprecated.  Use morai_msgs-msg:accel instead.")
  (accel m))

(cl:ensure-generic-function 'brake-val :lambda-list '(m))
(cl:defmethod brake-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:brake-val is deprecated.  Use morai_msgs-msg:brake instead.")
  (brake m))

(cl:ensure-generic-function 'steer-val :lambda-list '(m))
(cl:defmethod steer-val ((m <EgoNoisyStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader morai_msgs-msg:steer-val is deprecated.  Use morai_msgs-msg:steer instead.")
  (steer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EgoNoisyStatus>) ostream)
  "Serializes a message object of type '<EgoNoisyStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noisy_position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noisy_orientation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noisy_enu_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noisy_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noisy_angularVelocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noisy_acceleration) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'brake))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EgoNoisyStatus>) istream)
  "Deserializes a message object of type '<EgoNoisyStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noisy_position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noisy_orientation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noisy_enu_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noisy_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noisy_angularVelocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noisy_acceleration) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steer) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EgoNoisyStatus>)))
  "Returns string type for a message object of type '<EgoNoisyStatus>"
  "morai_msgs/EgoNoisyStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EgoNoisyStatus)))
  "Returns string type for a message object of type 'EgoNoisyStatus"
  "morai_msgs/EgoNoisyStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EgoNoisyStatus>)))
  "Returns md5sum for a message object of type '<EgoNoisyStatus>"
  "93b556ef5e38f8da38c67217e4fe4664")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EgoNoisyStatus)))
  "Returns md5sum for a message object of type 'EgoNoisyStatus"
  "93b556ef5e38f8da38c67217e4fe4664")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EgoNoisyStatus>)))
  "Returns full string definition for message of type '<EgoNoisyStatus>"
  (cl:format cl:nil "Header header~%~%morai_msgs/ENU noisy_position~%morai_msgs/RPY noisy_orientation~%morai_msgs/ENU noisy_enu_velocity~%morai_msgs/XYZ noisy_velocity~%morai_msgs/RPY noisy_angularVelocity~%morai_msgs/XYZ noisy_acceleration~%~%float32 accel~%float32 brake~%float32 steer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: morai_msgs/ENU~%float32 east~%float32 north~%float32 up~%~%================================================================================~%MSG: morai_msgs/RPY~%float32 roll~%float32 pitch~%float32 yaw~%~%================================================================================~%MSG: morai_msgs/XYZ~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EgoNoisyStatus)))
  "Returns full string definition for message of type 'EgoNoisyStatus"
  (cl:format cl:nil "Header header~%~%morai_msgs/ENU noisy_position~%morai_msgs/RPY noisy_orientation~%morai_msgs/ENU noisy_enu_velocity~%morai_msgs/XYZ noisy_velocity~%morai_msgs/RPY noisy_angularVelocity~%morai_msgs/XYZ noisy_acceleration~%~%float32 accel~%float32 brake~%float32 steer~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: morai_msgs/ENU~%float32 east~%float32 north~%float32 up~%~%================================================================================~%MSG: morai_msgs/RPY~%float32 roll~%float32 pitch~%float32 yaw~%~%================================================================================~%MSG: morai_msgs/XYZ~%float32 x~%float32 y~%float32 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EgoNoisyStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noisy_position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noisy_orientation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noisy_enu_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noisy_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noisy_angularVelocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noisy_acceleration))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EgoNoisyStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'EgoNoisyStatus
    (cl:cons ':header (header msg))
    (cl:cons ':noisy_position (noisy_position msg))
    (cl:cons ':noisy_orientation (noisy_orientation msg))
    (cl:cons ':noisy_enu_velocity (noisy_enu_velocity msg))
    (cl:cons ':noisy_velocity (noisy_velocity msg))
    (cl:cons ':noisy_angularVelocity (noisy_angularVelocity msg))
    (cl:cons ':noisy_acceleration (noisy_acceleration msg))
    (cl:cons ':accel (accel msg))
    (cl:cons ':brake (brake msg))
    (cl:cons ':steer (steer msg))
))
