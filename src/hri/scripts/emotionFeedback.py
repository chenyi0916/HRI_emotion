#!/usr/bin/env python3
import rospy
import numpy as np
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
        self.robot_emotion['default'] = [0.1, 0.1, 0.18]
        # self.robot_emotion['happy'] = [0.189, 0.111, 0.18]
        # self.robot_emotion['angry'] = [0.189, -0.074, 0.06]
        # self.robot_emotion['surprised'] = [0.189, 0.111, 0.06]
        # self.robot_emotion['sad'] = [0.189, 0.296, 0.06]
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
        self.home = np.array([182.9 * np.pi / 180, -95.4* np.pi / 180, 68.4* np.pi / 180, -150* np.pi / 180, -92.7* np.pi / 180, 92* np.pi / 180] )
        # self.move_to_joint(self.home)
        self.goal = self.robot_emotion['default'] 
        self.sad()
        # self.move_to_goal()
        rospy.loginfo("Robot initialized.")

    def emotion_callback(self, data):
        emotion_dict = {0: "Angry", 1: "Disgusted", 2: "Fearful", 3: "Happy", 4: "Neutral", 5: "Sad", 6: "Surprised"}
        emotion = data.data
        print("user emotion:",emotion_dict[data.data])
        if emotion == 0:
            self.angry()
            print()
            
        elif emotion == 1:
            self.vomit()
            print()
            
        elif emotion == 2:
            self.fallback()
            print()
            
        elif emotion == 3:
            self.thanks()
            print()

        elif emotion == 4:
            self.nod()
            print()

        elif emotion == 5:
            self.sad()
            print()
            
        elif emotion == 6:
            self.confuse()
            print()
        # rospy.sleep(10)
    #---------------robot feedback-------------------
    def nod(self):
        self.move_to_joint(self.home, 1)
    
        self.move_to_joint(np.array([182.9 * np.pi / 180, -95.4* np.pi / 180, 68.4* np.pi / 180, -132.77* np.pi / 180, -92.7* np.pi / 180, 92* np.pi / 180] ),1)  
        self.move_to_joint(self.home,1)
        self.move_to_joint(np.array([182.9 * np.pi / 180, -95.4* np.pi / 180, 68.4* np.pi / 180, -132.77* np.pi / 180, -92.7* np.pi / 180, 92* np.pi / 180] ),1)  
        self.move_to_joint(self.home,1)

    def fallback(self):
        self.move_to_joint(self.home, 1)
        self.move_to_joint(np.array([180 * np.pi / 180, -161* np.pi / 180, 136* np.pi / 180, -167* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1)  
        rospy.sleep(1)
        self.move_to_joint(np.array([264 * np.pi / 180, -141* np.pi / 180, 142* np.pi / 180, -172* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1) 

    def angry(self):
        self.move_to_joint(self.home, 1)
        self.move_to_joint(np.array([182 * np.pi / 180, -75* np.pi / 180, 55* np.pi / 180, -156* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1,flag=False)
        self.move_to_joint(np.array([182 * np.pi / 180, -75* np.pi / 180, 55* np.pi / 180, -156* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1,flag=True)
        rospy.sleep(1)
        self.move_to_joint(np.array([182 * np.pi / 180, -75* np.pi / 180, 55* np.pi / 180, -156* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1,flag=False)
        self.move_to_joint(self.home, 1,flag=False)
    
    def vomit(self):
        self.move_to_joint(self.home, 1)
        self.move_to_joint(np.array([183 * np.pi / 180, -58* np.pi / 180, 96* np.pi / 180, -132* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1,flag=False)
        self.move_to_joint(np.array([183 * np.pi / 180, -58* np.pi / 180, 96* np.pi / 180, -132* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1,flag=True)
        rospy.sleep(2)
        self.move_to_joint(np.array([183 * np.pi / 180, -58* np.pi / 180, 96* np.pi / 180, -132* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1,flag=False)
        self.move_to_joint(np.array([289 * np.pi / 180, -60* np.pi / 180, 96* np.pi / 180, -132* np.pi / 180, -91* np.pi / 180, 91* np.pi / 180] ),1)

    def confuse(self):
        self.move_to_joint(self.home, 1)
        self.move_to_joint(np.array([182.9 * np.pi / 180, -95.4* np.pi / 180, 68.4* np.pi / 180, -150* np.pi / 180, -92.7* np.pi / 180, 50* np.pi / 180] ),1)
        rospy.sleep(1)
        self.move_to_joint(self.home, 1)
        for _ in range(2):
            self.move_to_joint(np.array([182.9 * np.pi / 180, -95.4* np.pi / 180, 68.4* np.pi / 180, -150* np.pi / 180, -102* np.pi / 180, 92* np.pi / 180] ),1)
            self.move_to_joint(np.array([182.9 * np.pi / 180, -95.4* np.pi / 180, 68.4* np.pi / 180, -150* np.pi / 180, -82* np.pi / 180, 92* np.pi / 180] ),1)
        self.move_to_joint(self.home, 1)

    def thanks(self):
        self.move_to_joint(self.home, 1)
        for _ in range(3):
            self.move_to_joint(np.array([167.5 * np.pi / 180, -88* np.pi / 180, 100* np.pi / 180, -170* np.pi / 180, -100* np.pi / 180, 118* np.pi / 180] ),1)
            self.move_to_joint(np.array([187 * np.pi / 180, -89* np.pi / 180, 82* np.pi / 180, -173* np.pi / 180, -99* np.pi / 180, 90* np.pi / 180] ),1) 
            self.move_to_joint(np.array([204 * np.pi / 180, -69* np.pi / 180, 90* np.pi / 180, -180* np.pi / 180, -109* np.pi / 180, 66* np.pi / 180] ),1) 
            self.move_to_joint(np.array([187 * np.pi / 180, -89* np.pi / 180, 82* np.pi / 180, -173* np.pi / 180, -99* np.pi / 180, 90* np.pi / 180] ),1) 
    
    def sad(self):
        self.move_to_joint(self.home, 1)
        self.move_to_joint(np.array([248 * np.pi / 180, -9* np.pi / 180, 28* np.pi / 180, -156* np.pi / 180, -111* np.pi / 180, 90* np.pi / 180] ),0.3)
        self.move_to_joint(np.array([248 * np.pi / 180, -9* np.pi / 180, 28* np.pi / 180, -156* np.pi / 180, -111* np.pi / 180, 90* np.pi / 180] ),0.3,flag=True)
        rospy.sleep(0.5)
        self.move_to_joint(np.array([248 * np.pi / 180, -9* np.pi / 180, 28* np.pi / 180, -156* np.pi / 180, -111* np.pi / 180, 90* np.pi / 180] ),0.3,flag=False)
    #---------------robot feedback-------------------

    def position_callback(self, msg):
        self.thetas[0] = msg.position[0]
        self.thetas[1] = msg.position[1]
        self.thetas[2] = msg.position[2]
        self.thetas[3] = msg.position[3]
        self.thetas[4] = msg.position[4]
        self.thetas[5] = msg.position[5]

    def move_to_goal(self, speed=1):
        spin_count = 0
        at_goal = 0
        if self.goal is None:
            rospy.loginfo("goal is None.")
            raise RuntimeError
        joint_state = ur_invk(self.goal[0], self.goal[1], self.goal[2], 0)
        driver_msg = command()
        driver_msg.destination = joint_state
        driver_msg.v = speed
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

    def move_to_joint(self,angle,speed,flag = False):
        spin_count = 0
        at_goal = 0
        joint_state = angle
        driver_msg = command()
        driver_msg.destination = joint_state
        driver_msg.v = speed
        driver_msg.a = 1
        driver_msg.io_0 = flag
        self.pub_cmd.publish(driver_msg)
        # self.loop_rate.sleep()
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
