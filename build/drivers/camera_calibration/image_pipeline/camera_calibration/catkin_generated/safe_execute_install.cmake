execute_process(COMMAND "/home/ur3/HRI_emotion/build/drivers/camera_calibration/image_pipeline/camera_calibration/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ur3/HRI_emotion/build/drivers/camera_calibration/image_pipeline/camera_calibration/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
