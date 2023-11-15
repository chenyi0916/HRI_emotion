# HRI_emotion
It is a human-robot-interaction experiment based on human emotion detection

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
