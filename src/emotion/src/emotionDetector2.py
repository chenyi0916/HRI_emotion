
#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
from tensorflow.keras import models, layers, optimizers, utils
from std_msgs.msg import Int32
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class EmotionDetector:
    def __init__(self):
        rospy.init_node('emotion_detector', anonymous=True)

        self.subscriber = rospy.Subscriber('/cv_camera_node/image_raw', Image, self.callback)
        self.publisher = rospy.Publisher('emotion_index', Int32, queue_size=10)

        # Initialize the bridge between ROS and OpenCV
        self.bridge = CvBridge()

        # Load the trained model
        self.model = self.load_model()
        self.facecasc = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
        self.bodycasc = cv2.CascadeClassifier('haarcascade_fullbody.xml')
        self.emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"}

    def load_model(self):
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
        return model

    def callback(self, data):
        # Convert ROS image to OpenCV format
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            rospy.logerr("CvBridge Error: {0}".format(e))
            return

        # Preprocess the image for the CNN
        processed_image = self.preprocess_image(cv_image)

        # Detect emotion
        emotion_index = self.detect_emotion(processed_image)

        # Publish the result
        self.publisher.publish(emotion_index)

        # Display the result on the image
        emotion_label = self.emotion_dict[emotion_index]
        cv2.putText(cv_image, emotion_label, (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2, cv2.LINE_AA)
        cv2.imshow("Emotion Detector", cv2.resize(cv_image, (640, 480), interpolation=cv2.INTER_CUBIC))
        cv2.waitKey(1)

    def preprocess_image(self, cv_image):
        gray = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)
        faces = self.facecasc.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=2)
        people = self.bodycasc.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=2)

        # for (bx, by, bw, bh) in people:
        #     cv2.rectangle(frame, (bx, by - 50), (bx + bw, by + bh + 10), (0, 0, 255), 2)
        for (x, y, w, h) in faces:
            cv2.rectangle(cv_image, (x, y - 50), (x + w, y + h + 10), (255, 0, 0), 2)
            roi_gray = gray[y:y + h, x:x + w]
            cropped_img = np.expand_dims(np.expand_dims(cv2.resize(roi_gray, (48, 48)), -1), 0)
        return cropped_img

    def detect_emotion(self, processed_image):
        # Predict the emotion from the processed image
        prediction = self.model.predict(processed_image)
        emotion_index = np.argmax(prediction)
        return emotion_index

# Main function
if __name__ == '__main__':
    detector = EmotionDetector()
    rospy.spin()
