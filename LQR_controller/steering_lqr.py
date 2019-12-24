#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

"""
* @Copyright (c)  all right reserved
* 
* @file:steering_lqr.py
* @author: Sophistt
* @date:2019-12-24 16:59
* @description: Python file
"""

import numpy as np

from lqr_controller import LQR


class SteeringLQR(LQR):
    def __init__(self):
        self.L = 2.7
        self.vehicle_spd = 0.0
        self.dt = 0.01
        self.SteeringLQR_init()


    def SteeringLQR_init(self):

        A = np.zeros((4, 4))
        A[0, 0] = 1.0
        A[0, 1] = self.dt
        A[1, 2] = self.vehicle_spd
        A[2, 2] = 1.0
        A[2, 3] = self.dt

        B = np.zeros((4, 1))
        B[3, 0]  = self.vehicle_spd / self.L


        Q = np.eye(4) 
        R = np.eye(1)
        super().__init__(A, B, Q, R)


    def set_speed(self, spd):
        self.vehicle_spd = spd


    def update_matrix(self):
        self.A[1, 2] = self.vehicle_spd
        self.B[3, 0] = self.vehicle_spd / self.L


    def lqr_steering_control(self, state, cx, cy, cyaw, ck, pe, pth_e):
        ind, e = calc_nearest_index(state, cx, cy, cyaw)

        self.set_speed(state.v)
        self.update_matrix()
        
        th_e = pi_2_pi(state.yaw - cyaw[ind])




