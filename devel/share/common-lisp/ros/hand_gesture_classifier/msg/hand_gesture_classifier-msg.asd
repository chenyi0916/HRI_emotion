
(cl:in-package :asdf)

(defsystem "hand_gesture_classifier-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HandJointPos" :depends-on ("_package_HandJointPos"))
    (:file "_package_HandJointPos" :depends-on ("_package"))
  ))