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
    def __init__(self,
                 Q,
                 R):
        self.Q = Q  # self.Q = np.eye(5) for example
        self.R = R  # self.R = np.eye(2) for example
        

