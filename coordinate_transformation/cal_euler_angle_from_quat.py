#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
* @Copyright (c) all right reserved 
* 
* @File    : cal_euler_angle_from_quat.py
* @Date    : 2019-09-19 21:57:10
* @Author  : Sophistt
* @Desc    : Python file
"""

import numpy as np
from pyquaternion import Quaternion


def cal_euler_angle_from_quat(x, y, z, w):
    quat = Quaternion(axis=[x, y, z], angle=w)
    # Get rotation matrix from quaternion
    quat_matrix = quat.rotation_matrix

    if (abs(quat_matrix[2][0]) >= 1):
        yaw = 0
        if (quat_matrix[2][0] < 0):
            pitch = np.pi / 2.0
            roll = np.arctan2(quat_matrix[0][1], quat_matrix[0][2])
        else:
            pitch = -np.pi / 2.0
            roll = np.arctan2(-quat_matrix[0][1], -quat_matrix[0][2])
    else:
        pitch = np.arcsin(-quat_matrix[2][0])
        roll = np.arctan2(quat_matrix[2][1], quat_matrix[2][2])
        yaw = np.arctan2(quat_matrix[1][0], quat_matrix[0][0])

    return yaw, pitch, roll


def main():
    print(cal_euler_angle_from_quat(1, 1, 1, np.pi / 2.0))


if __name__ == '__main__':
    main()
