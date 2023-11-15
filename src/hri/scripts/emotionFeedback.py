#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from std_msgs.msg import Int32

from ur3_kinematics import ur_invk
from ur3_driver.msg import command
from ur3_driver.msg import position

class RobotPlayer:
    def __init__(self):
        self.SPIN_RATE = 20
        self.at_goal = 0
        self.robot_emotion = {} # end effector positions corresponding to emotion
        self.robot_emotion['happy'] = [0.189, 0.111, 0.18]
        self.robot_emotion['angry'] = [0.189, -0.074, 0.06]
        self.robot_emotion['surprised'] = [0.189, 0.111, 0.06]
        self.robot_emotion['sad'] = [0.189, 0.296, 0.06]
        # self.robot_emotion['disgusted'] = [0.189, -0.074, 0.06]
        # self.robot_emotion['fearful'] = [0.189, 0.111, 0.06]
        # self.robot_emotion['neutral'] = [0.189, 0.296, 0.06]
        self.goal = None
        self.thetas = [0,0,0,0,0,0]
        self.loop_rate = rospy.Rate(self.SPIN_RATE)
        self.pub_cmd = rospy.Publisher('ur3/command', command, queue_size=10)
        rospy.Subscriber('ur3/position', position, self.position_callback)
        rospy.Subscriber('emotion_index', Int32, self.emotion_callback)
        rospy.sleep(1)
        self.goal = self.robot_emotion['default'] 
        self.move_to_goal()
        rospy.loginfo("Robot rock-paper-scissors player initialized.")

    def emotion_callback(self, data):
        emotion = data.data
        print("data",data.data)
        if emotion == 0:
            self.goal = self.robot_emotion['angry']
        elif emotion == 3:
            self.goal = self.robot_emotion['happy']
        elif emotion == 5:
            self.goal = self.robot_emotion['sad']
        elif emotion == 6:
            self.goal = self.robot_emotion['surprised']
        # elif emotion == 1:
        #     self.goal = self.robot_emotion['disgusted']
        # elif emotion == 2:
        #     self.goal = self.robot_emotion['fearful']
        # elif emotion == 4:
        #     self.goal = self.robot_emotion['neutral']

        self.move_to_goal()
       
            
    def position_callback(self, msg):
        self.thetas[0] = msg.position[0]
        self.thetas[1] = msg.position[1]
        self.thetas[2] = msg.position[2]
        self.thetas[3] = msg.position[3]
        self.thetas[4] = msg.position[4]
        self.thetas[5] = msg.position[5]

    def move_to_goal(self):
        spin_count = 0
        at_goal = 0
        if self.goal is None:
            rospy.loginfo("goal is None.")
            raise RuntimeError
        joint_state = ur_invk(self.goal[0], self.goal[1], self.goal[2], 0)
        driver_msg = command()
        driver_msg.destination = joint_state
        driver_msg.v = 1
        driver_msg.a = 1
        self.pub_cmd.publish(driver_msg)
        self.loop_rate.sleep()
        while(at_goal == 0):
            if( abs(self.thetas[0]-driver_msg.destination[0]) < 0.0005 and \
                abs(self.thetas[1]-driver_msg.destination[1]) < 0.0005 and \
                abs(self.thetas[2]-driver_msg.destination[2]) < 0.0005 and \
                abs(self.thetas[3]-driver_msg.destination[3]) < 0.0005 and \
                abs(self.thetas[4]-driver_msg.destination[4]) < 0.0005 and \
                abs(self.thetas[5]-driver_msg.destination[5]) < 0.0005 ):
                at_goal = 1
            self.loop_rate.sleep()
            if(spin_count >  self.SPIN_RATE*5):
                self.pub_cmd.publish(driver_msg)
                rospy.loginfo("Just published again driver_msg")
                spin_count = 0
            spin_count = spin_count + 1

def main():
    rospy.init_node('emotion_robot_player_node')
    rp = RobotPlayer()
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
