# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hand_gesture_classifier: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ihand_gesture_classifier:/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hand_gesture_classifier_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" NAME_WE)
add_custom_target(_hand_gesture_classifier_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hand_gesture_classifier" "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hand_gesture_classifier
  "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hand_gesture_classifier
)

### Generating Services

### Generating Module File
_generate_module_cpp(hand_gesture_classifier
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hand_gesture_classifier
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hand_gesture_classifier_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hand_gesture_classifier_generate_messages hand_gesture_classifier_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" NAME_WE)
add_dependencies(hand_gesture_classifier_generate_messages_cpp _hand_gesture_classifier_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hand_gesture_classifier_gencpp)
add_dependencies(hand_gesture_classifier_gencpp hand_gesture_classifier_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hand_gesture_classifier_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hand_gesture_classifier
  "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hand_gesture_classifier
)

### Generating Services

### Generating Module File
_generate_module_eus(hand_gesture_classifier
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hand_gesture_classifier
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hand_gesture_classifier_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hand_gesture_classifier_generate_messages hand_gesture_classifier_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" NAME_WE)
add_dependencies(hand_gesture_classifier_generate_messages_eus _hand_gesture_classifier_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hand_gesture_classifier_geneus)
add_dependencies(hand_gesture_classifier_geneus hand_gesture_classifier_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hand_gesture_classifier_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hand_gesture_classifier
  "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hand_gesture_classifier
)

### Generating Services

### Generating Module File
_generate_module_lisp(hand_gesture_classifier
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hand_gesture_classifier
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hand_gesture_classifier_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hand_gesture_classifier_generate_messages hand_gesture_classifier_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" NAME_WE)
add_dependencies(hand_gesture_classifier_generate_messages_lisp _hand_gesture_classifier_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hand_gesture_classifier_genlisp)
add_dependencies(hand_gesture_classifier_genlisp hand_gesture_classifier_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hand_gesture_classifier_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hand_gesture_classifier
  "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hand_gesture_classifier
)

### Generating Services

### Generating Module File
_generate_module_nodejs(hand_gesture_classifier
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hand_gesture_classifier
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hand_gesture_classifier_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hand_gesture_classifier_generate_messages hand_gesture_classifier_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" NAME_WE)
add_dependencies(hand_gesture_classifier_generate_messages_nodejs _hand_gesture_classifier_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hand_gesture_classifier_gennodejs)
add_dependencies(hand_gesture_classifier_gennodejs hand_gesture_classifier_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hand_gesture_classifier_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hand_gesture_classifier
  "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hand_gesture_classifier
)

### Generating Services

### Generating Module File
_generate_module_py(hand_gesture_classifier
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hand_gesture_classifier
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hand_gesture_classifier_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hand_gesture_classifier_generate_messages hand_gesture_classifier_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ur3/HRI_emotion/src/hand_gesture_classifier/msg/HandJointPos.msg" NAME_WE)
add_dependencies(hand_gesture_classifier_generate_messages_py _hand_gesture_classifier_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hand_gesture_classifier_genpy)
add_dependencies(hand_gesture_classifier_genpy hand_gesture_classifier_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hand_gesture_classifier_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hand_gesture_classifier)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hand_gesture_classifier
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hand_gesture_classifier_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hand_gesture_classifier)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hand_gesture_classifier
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hand_gesture_classifier_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hand_gesture_classifier)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hand_gesture_classifier
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hand_gesture_classifier_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hand_gesture_classifier)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hand_gesture_classifier
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hand_gesture_classifier_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hand_gesture_classifier)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hand_gesture_classifier\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hand_gesture_classifier
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hand_gesture_classifier_generate_messages_py std_msgs_generate_messages_py)
endif()
