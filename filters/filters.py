#!/usr/bin/python
# -*- coding: utf-8 -*-

""" 
* @Copyright (c)  all right reserved 
* 
* @file:src/path_track/scripts/filter.py 
* @author: Sophistt 
* @date:2019-08-21 18:55 
* @description: Python file 
""" 

import numpy as np

# ------------------------- Dimension 1 Kalman Filter -----------------------------
class KalmanFilter:
    def __init__(self, xEst, PEst, dT):
        # Covariance for KF
        self.Q = np.diag([
                0.1,
                1.0,
                1.0
                ])**2

        self.R = np.diag([1.0])**2

        self.DT = dT

        # Initial value
        self.xEst = xEst
        self.PEst = PEst

    def motion_model(self, x):
        A = np.array([[1.0, self.DT, self.DT * self.DT / 2],
                      [0, 1.0, self.DT],
                      [0, 0, 1.0]])

        return np.matmul(A, x), A


    def observation_model(self, x):
        H = np.array([[1.0, 0, 0]])

        return np.matmul(H, x), H


    def estimation(self, z, u=0):
        # Predict
        xPred, A = self.motion_model(self.xEst)
        PPred = np.matmul(A, np.matmul(self.PEst, A.T)) + self.Q

        # Update
        zPred, H = self.observation_model(xPred)
        temp = np.matmul(H, np.matmul(PPred, H.T)) + self.R
        K = np.matmul(PPred, np.matmul(H.T, np.linalg.inv(temp)))
        self.xEst = xPred + np.matmul(K, (z - zPred))
        self.PEst = np.matmul((np.eye(len(self.xEst)) - np.matmul(K, H)), PPred)

        return float(self.xEst[0])
   

# ------------------------- Mean filtering ------------------------------
class MeanFilter:
    def __init__(self):
        self.DT = 0.01
        self.slideWindow = []

    def average(self, slideWindow):
        nsum = 0
        for i in range(len(slideWindow)):
            nsum += slideWindow[i]
        return nsum / len(slideWindow)

    def estimation(self, z):
        
        if len(self.slideWindow) > 5:
            self.slideWindow.pop(0)
        
        self.slideWindow.append(z)

        return self.average(self.slideWindow)


# ------------------------- Exponential filtering ----------------------
class ExponentialFilter:
    def __init__(self):
        self.sz = 0
    
    def estimation(self, z):
        if z - self.sz == 0:
            self.sz = z
        else:
            self.sz += (0.1 * pow(abs((z - self.sz)), 2.0/3.0) * (z - self.sz) / abs(z - self.sz))

        return self.sz


# ------------------------- First-order lowpass filtering ---------------------
class LowpassFilter:
    def __init__(self, alpha):
        self.zPre = 0
        
        self.alpha = alpha

    def estimation(self, z):
        
        self.zPre = self.alpha * z + (1 - self.alpha) * self.zPre

        return self.zPre
        
