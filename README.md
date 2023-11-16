# HRI_emotion
This is a human-robot-interaction experiment based on human emotion detection

Before catkin_make the workspace, remember only keep the src folder.
## turn on ur3 drive
``` bash
cd HRI_emotion
source devel/setup.bash
roslaunch ur3_driver ur3_driver.launch
```

## Run the emotion detector
``` bash
cd src/emotion/src
rosrun emotion emotionDetector.py
```

## Run the robot
``` bash
rosrun hri emotionFeedback.py
```
