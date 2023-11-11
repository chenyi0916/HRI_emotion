#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
from tensorflow.keras import models, layers, optimizers, utils
import rospy
from std_msgs.msg import Int32

# Initialize the ROS node
rospy.init_node('emotion_detector', anonymous=True)
# Create a publisher object
pub = rospy.Publisher('emotion_index', Int32, queue_size=10)

# Load the trained model
model = models.Sequential()
model.add(layers.Conv2D(32, kernel_size=(3, 3), activation='relu', input_shape=(48,48,1)))
model.add(layers.Conv2D(64, kernel_size=(3, 3), activation='relu'))
model.add(layers.MaxPooling2D(pool_size=(2, 2)))
model.add(layers.Dropout(0.25))
model.add(layers.Conv2D(128, kernel_size=(3, 3), activation='relu'))
model.add(layers.MaxPooling2D(pool_size=(2, 2)))
model.add(layers.Conv2D(128, kernel_size=(3, 3), activation='relu'))
model.add(layers.MaxPooling2D(pool_size=(2, 2)))
model.add(layers.Dropout(0.25))
model.add(layers.Flatten())
model.add(layers.Dense(1024, activation='relu'))
model.add(layers.Dropout(0.5))
model.add(layers.Dense(7, activation='softmax'))

model.load_weights('model.h5')

# Dictionary mapping class labels to emotions
emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"}

# Start the webcam feed
cap = cv2.VideoCapture(0)

while not rospy.is_shutdown():
    # Capture frame-by-frame
    ret, frame = cap.read()
    if not ret:
        break

    facecasc = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
    bodycasc = cv2.CascadeClassifier('haarcascade_fullbody.xml')

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = facecasc.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=2)
    people = bodycasc.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=2)

    # for (bx, by, bw, bh) in people:
    #     cv2.rectangle(frame, (bx, by - 50), (bx + bw, by + bh + 10), (0, 0, 255), 2)
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y - 50), (x + w, y + h + 10), (255, 0, 0), 2)
        roi_gray = gray[y:y + h, x:x + w]
        cropped_img = np.expand_dims(np.expand_dims(cv2.resize(roi_gray, (48, 48)), -1), 0)
        prediction = model.predict(cropped_img)
        maxindex = int(np.argmax(prediction))
        cv2.putText(frame, emotion_dict[maxindex], (x, y), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2,
                    cv2.LINE_AA)
    
    # Publish the maxindex as a ROS topic
    emotion_msg = Int32()
    emotion_msg.data = maxindex
    pub.publish(emotion_msg)

    # Display the resulting frame
    cv2.imshow('Video', cv2.resize(frame, (640, 480), interpolation=cv2.INTER_CUBIC))
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything is done, release the capture
cap.release()
cv2.destroyAllWindows()
