#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

"""
* @Copyright (c)  all right reserved
* 
* @file:pid.py
* @author: Sophistt
* @date:2019-11-26 08:52
* @description: Python file
"""


class PID:
    def __init__(self, 
                 T,
                 Kp=0.5,
                 Ti=10000000,
                 Td=0.0):
        # Sample period
        self.T = T

        # Coefficients of PID
        self.Kp = Kp
        self.Ti = Ti
        self.Td = Td

        # Coefficients of incremental PID
        self.A = self.Kp * (1 + self.T / self.Ti + self.Td / self.T)
        self.B = self.Kp * (1 + 2 * self.Td / self.T)
        self.C = self.Kp * self.Td / self.T

        # Saturation 
        self.USE_SATURATION = True
        self.MAX_U = 50.0
        
        self.u = 0.0  # Output of PID
        self.e1 = self.e2 = self.e3 = 0.0  # Error between target and practical value

    
    def incremental_pid(self, target, current):

        self.e1 = target - current
        
        du = self.A * self.e1 - self.B * self.e2 + self.C * self.e3

        self.u += du

        self.e3 = self.e2
        self.e2 = self.e1

        _u = self.u
        if self.USE_SATURATION:
            return min(self.MAX_U, _u) if _u > 0 else max(-self.MAX_U, _u)
        else:
            return _u



if __name__ == '__main__':
    
    p = PID()
    print(p.incremental_pid(-200, 0))
