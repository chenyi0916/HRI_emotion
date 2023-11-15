; Auto-generated. Do not edit!


(cl:in-package hand_gesture_classifier-msg)


;//! \htmlinclude HandJointPos.msg.html

(cl:defclass <HandJointPos> (roslisp-msg-protocol:ros-message)
  ((t
    :reader t
    :initarg :t
    :type cl:float
    :initform 0.0)
   (x
    :reader x
    :initarg :x
    :type (cl:vector cl:float)
   :initform (cl:make-array 75 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass HandJointPos (<HandJointPos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandJointPos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandJointPos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hand_gesture_classifier-msg:<HandJointPos> is deprecated: use hand_gesture_classifier-msg:HandJointPos instead.")))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <HandJointPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hand_gesture_classifier-msg:t-val is deprecated.  Use hand_gesture_classifier-msg:t instead.")
  (t m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <HandJointPos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hand_gesture_classifier-msg:x-val is deprecated.  Use hand_gesture_classifier-msg:x instead.")
  (x m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandJointPos>) ostream)
  "Serializes a message object of type '<HandJointPos>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 't))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'x))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandJointPos>) istream)
  "Deserializes a message object of type '<HandJointPos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 't) (roslisp-utils:decode-double-float-bits bits)))
  (cl:setf (cl:slot-value msg 'x) (cl:make-array 75))
  (cl:let ((vals (cl:slot-value msg 'x)))
    (cl:dotimes (i 75)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandJointPos>)))
  "Returns string type for a message object of type '<HandJointPos>"
  "hand_gesture_classifier/HandJointPos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandJointPos)))
  "Returns string type for a message object of type 'HandJointPos"
  "hand_gesture_classifier/HandJointPos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandJointPos>)))
  "Returns md5sum for a message object of type '<HandJointPos>"
  "646eb86a127f34e71d16f8252e81874b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandJointPos)))
  "Returns md5sum for a message object of type 'HandJointPos"
  "646eb86a127f34e71d16f8252e81874b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandJointPos>)))
  "Returns full string definition for message of type '<HandJointPos>"
  (cl:format cl:nil "# This contains 3D locations of hand joints of length 75 and time .~%float64 t~%float64[75] x~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandJointPos)))
  "Returns full string definition for message of type 'HandJointPos"
  (cl:format cl:nil "# This contains 3D locations of hand joints of length 75 and time .~%float64 t~%float64[75] x~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandJointPos>))
  (cl:+ 0
     8
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'x) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandJointPos>))
  "Converts a ROS message object to a list"
  (cl:list 'HandJointPos
    (cl:cons ':t (t msg))
    (cl:cons ':x (x msg))
))
