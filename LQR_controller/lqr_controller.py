#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

"""
* @Copyright (c)  all right reserved
* 
* @file:lqr_controller.py
* @author: Sophistt
* @date:2019-12-23 17:16
* @description: Python file
"""

import numpy as np


class LQR:
    def __init__(self, A, B, Q, R):
        self.A = A  # State transform matrix 
        self.B = B  # Control transform matrix
        self.Q = Q  # self.Q = np.eye(5) for example
        self.R = R  # self.R = np.eye(2) for example
        
        self.max_iter = 150
        self.eps = 0.01


    def solve_DARE(self):

        X_next = X = self.Q

        for i in range(self.max_iter):
            X_next = self.Q + self.A.T @ X @ self.A - self.A.T @ X @ self.B @ \
                     np.linalg.inv(self.R + self.B.T  @ X @ self.B) @ self.B.T @ X @ self.A 
            if (abs(X_next - X)).max() < self.eps:
                break
            X = X_next

        return X_next
        
    
    def get_control_signals(self, x):

        X = self.solve_DARE()

        K = np.linalg.inv(self.B.T @ X @ self.B + self.R) @ (self.B.T @ X @ self.A)

        ustar = -K @ x

        return ustar, K, X
