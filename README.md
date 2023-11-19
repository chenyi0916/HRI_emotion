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

## Start interaction
Step1: click the camera visualization window
Step2: make an emotion and press "p" to tell the robot
Step3: wait for robot's feedback
Repeat: make another emotion, press "p"
...
