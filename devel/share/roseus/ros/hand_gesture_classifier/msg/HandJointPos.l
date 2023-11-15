;; Auto-generated. Do not edit!


(when (boundp 'hand_gesture_classifier::HandJointPos)
  (if (not (find-package "HAND_GESTURE_CLASSIFIER"))
    (make-package "HAND_GESTURE_CLASSIFIER"))
  (shadow 'HandJointPos (find-package "HAND_GESTURE_CLASSIFIER")))
(unless (find-package "HAND_GESTURE_CLASSIFIER::HANDJOINTPOS")
  (make-package "HAND_GESTURE_CLASSIFIER::HANDJOINTPOS"))

(in-package "ROS")
;;//! \htmlinclude HandJointPos.msg.html


(defclass hand_gesture_classifier::HandJointPos
  :super ros::object
  :slots (_t _x ))

(defmethod hand_gesture_classifier::HandJointPos
  (:init
   (&key
    ((:t __t) 0.0)
    ((:x __x) (make-array 75 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _t (float __t))
   (setq _x __x)
   self)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:serialization-length
   ()
   (+
    ;; float64 _t
    8
    ;; float64[75] _x
    (* 8    75)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _t
       (sys::poke _t (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[75] _x
     (dotimes (i 75)
       (sys::poke (elt _x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _t
     (setq _t (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[75] _x
   (dotimes (i (length _x))
     (setf (elt _x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get hand_gesture_classifier::HandJointPos :md5sum-) "646eb86a127f34e71d16f8252e81874b")
(setf (get hand_gesture_classifier::HandJointPos :datatype-) "hand_gesture_classifier/HandJointPos")
(setf (get hand_gesture_classifier::HandJointPos :definition-)
      "# This contains 3D locations of hand joints of length 75 and time .
float64 t
float64[75] x
")



(provide :hand_gesture_classifier/HandJointPos "646eb86a127f34e71d16f8252e81874b")


