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

import math
import numpy as np

from lqr_controller import LQR


class VehicleState:
    def __init__(self, x=0.0, y=0.0, yaw=0.0, v=0.0):
        self.x = x
        self.y = y
        self.yaw = yaw
        self.v = v


class SteeringLQR(LQR):
    def __init__(self):
        self.L = 2.7
        self.vehicle_spd = 0.0
        self.dt = 0.1
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
    
    
    def pi_2_pi(self, angle):
        return (angle + math.pi) % (2 * math.pi) - math.pi
    
    
    def calc_nearest_index(self, state, cx, cy, cyaw):
        dx = [state.x - icx for icx in cx]
        dy = [state.y - icy for icy in cy]
        d = [idx ** 2 + idy ** 2 for (idx, idy) in zip(dx, dy)]

        mind = min(d)
        ind = d.index(mind)

        dxl = cx[ind] - state.x
        dyl = cy[ind] - state.y

        angle = self.pi_2_pi(cyaw[ind] - math.atan2(dyl, dxl))
        if angle < 0:
            mind *= -1

        return ind, mind

    
    def set_speed(self, spd):
        self.vehicle_spd = spd


    def update_matrix(self):
        self.A[1, 2] = self.vehicle_spd
        self.B[3, 0] = self.vehicle_spd / self.L


    def lqr_steering_control(self, state, cx, cy, cyaw, ck, pe, pth_e):
        ind, e = self.calc_nearest_index(state, cx, cy, cyaw)

        self.set_speed(state.v)
        self.update_matrix()
        
        th_e = self.pi_2_pi(state.yaw - cyaw[ind])

        x = np.zeros((4, 1))

        x[0, 0] = e
        x[1, 0] = (e - pe) / dt
        x[2, 0] = the
        x[3, 0] = (th_e - pth_e) / dt

        ustar, _, _ = self.get_control_signals(x)

        ff = math.atan2(self.L * k, 1) 
        fb = self.pi_2_pi(ustar[0, 0])

        delta = ff + fb

        return delta, ind, e, th_e

