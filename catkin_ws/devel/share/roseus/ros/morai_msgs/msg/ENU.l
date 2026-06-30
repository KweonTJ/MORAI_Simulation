;; Auto-generated. Do not edit!


(when (boundp 'morai_msgs::ENU)
  (if (not (find-package "MORAI_MSGS"))
    (make-package "MORAI_MSGS"))
  (shadow 'ENU (find-package "MORAI_MSGS")))
(unless (find-package "MORAI_MSGS::ENU")
  (make-package "MORAI_MSGS::ENU"))

(in-package "ROS")
;;//! \htmlinclude ENU.msg.html


(defclass morai_msgs::ENU
  :super ros::object
  :slots (_east _north _up ))

(defmethod morai_msgs::ENU
  (:init
   (&key
    ((:east __east) 0.0)
    ((:north __north) 0.0)
    ((:up __up) 0.0)
    )
   (send-super :init)
   (setq _east (float __east))
   (setq _north (float __north))
   (setq _up (float __up))
   self)
  (:east
   (&optional __east)
   (if __east (setq _east __east)) _east)
  (:north
   (&optional __north)
   (if __north (setq _north __north)) _north)
  (:up
   (&optional __up)
   (if __up (setq _up __up)) _up)
  (:serialization-length
   ()
   (+
    ;; float32 _east
    4
    ;; float32 _north
    4
    ;; float32 _up
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _east
       (sys::poke _east (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _north
       (sys::poke _north (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _up
       (sys::poke _up (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _east
     (setq _east (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _north
     (setq _north (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _up
     (setq _up (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get morai_msgs::ENU :md5sum-) "c90797f354fb2a735756281dc238dc87")
(setf (get morai_msgs::ENU :datatype-) "morai_msgs/ENU")
(setf (get morai_msgs::ENU :definition-)
      "float32 east
float32 north
float32 up

")



(provide :morai_msgs/ENU "c90797f354fb2a735756281dc238dc87")


