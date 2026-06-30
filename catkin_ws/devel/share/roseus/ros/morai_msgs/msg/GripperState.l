;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::GripperState)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'GripperState (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::GRIPPERSTATE")
  (make-package "MORAI_MSGS::GRIPPERSTATE"))

(in-package "ROS")
;;//! \htmlinclude GripperState.msg.html


(defclass morai_msgs::GripperState
  :super ros::object
  :slots (_release_limit _grip_limit ))

(defmethod morai_msgs::GripperState
  (:init
   (&key
    ((:release_limit __release_limit) nil)
    ((:grip_limit __grip_limit) nil)
    )
   (send-super :init)
   (setq _release_limit __release_limit)
   (setq _grip_limit __grip_limit)
   self)
  (:release_limit
   (&optional (__release_limit :null))
   (if (not (eq __release_limit :null)) (setq _release_limit __release_limit)) _release_limit)
  (:grip_limit
   (&optional (__grip_limit :null))
   (if (not (eq __grip_limit :null)) (setq _grip_limit __grip_limit)) _grip_limit)
  (:serialization-length
   ()
   (+
    ;; bool _release_limit
    1
    ;; bool _grip_limit
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _release_limit
       (if _release_limit (write-byte -1 s) (write-byte 0 s))
     ;; bool _grip_limit
       (if _grip_limit (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _release_limit
     (setq _release_limit (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _grip_limit
     (setq _grip_limit (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get morai_msgs::GripperState :md5sum-) "fc4558688d7d357989e10d3f6df1fa69")
(setf (get morai_msgs::GripperState :datatype-) "morai_msgs/GripperState")
(setf (get morai_msgs::GripperState :definition-)
      "bool release_limit
bool grip_limit
")



(provide :morai_msgs/GripperState "fc4558688d7d357989e10d3f6df1fa69")


