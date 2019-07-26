#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

""" 
* @Copyright (c)  all right reserved 
* 
* @file:kalman_filter.py 
* @author: Sophistt 
* @date:2019-07-25 09:21 
* @description: Python file 
""" 

import rospy
from std_msgs.msg import String, Float32

import math
import numpy as np

# Covariance for KF
Q = np.diag([
    0.1,
    1.0,
    1.0
    ])**2

R = np.diag([1.0])**2

# Inital value
xEst = np.zeros((3, 1))
PEst = np.eye(3)

DT = 0.05

angle_filter_pub = rospy.Publisher("smooth_angle", Float32, queue_size=1)

def angle_filter_callback(angle):
    global xEst, PEst

    xEst, PEst = estimation(xEst, PEst, angle.data)
    
    smooth_angle = Float32()
    smooth_angle.data = xEst[0]
    angle_filter_pub.publish(smooth_angle)
    
    rospy.loginfo("Smooth angle: %f"%(xEst[0])) 
    
    return

def motion_model(x):

    A = np.array([[1.0, DT, DT * DT /2],
                  [0, 1.0, DT],
                  [0, 0, 1.0]])

    return A @ x, A


def observation_model(x):

    H = np.array([[1.0, 0, 0]])

    return H @ x, H


def estimation(xEst, PEst, z, u=0):
    # Predict
    xPred, A = motion_model(xEst)
    PPred = A @ PEst @ A.T + Q

    # Update
    zPred, H = observation_model(xPred)
    temp = H @ PPred @ H.T + R
    K = PPred @ H.T @ np.linalg.inv(temp)
    xEst = xPred + K @ (z - zPred)
    PEst = (np.eye(len(xEst)) - K @ H) @ PPred

    return xEst, PEst


def main():
    rospy.init_node("kalman_filter_angle", anonymous=True)
    
    rospy.Subscriber("/control/steering_angle", Float32, angle_filter_callback)
    
    rospy.spin()
    

if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass
