#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

"""
* @Copyright (c)  all right reserved
* 
* @file:main.py
* @author: Sophistt
* @date:2019-12-25 16:27
* @description: Python file
"""


import numpy as np

from steering_lqr import SteeringLQR
from steering_lqr import VehicleState

import cubic_spline_planner



def main():
    ax = [0.0, 6.0, 12.5, 10.0, 7.5, 3.0, -1.0]
    ay = [0.0, -3.0, -5.0, 6.5, 3.0, 5.0, -2.0]
    goal = [ax[-1], ay[-1]]

    cx, cy, cyaw, ck, s = cubic_spline_planner.calc_spline_course(ax, ay, ds=0.1)
    
    veh_state =  VehicleState(x=0.5, y=0.0, yaw=0.0, v=0.0)

    e, th_e = 0.0, 0.0
    
    steering_lqr_controller = SteeringLQR()

    dl, target_ind, e, th_e = steering_lqr_controller.lqr_steering_control(veh_state, 
            cx, cy, cyaw, ck, e, th_e)

    print(np.rad2deg(dl))


if __name__ == '__main__':
    main()
