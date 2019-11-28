#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

"""
* @Copyright (c)  all right reserved
* 
* @file:simulation.py
* @author: Sophistt
* @date:2019-11-28 14:15
* @description: Python file
"""


import sys
import time
import matplotlib.pyplot as plt
from pid import PID
from model import Model

pltx = []
plty = []
plt_value = []

def show_analysis():
    global pltx, plty, plt_value

    fig = plt.figure()
    fig.suptitle('PID ANALYSIS')
    sub_plot =  fig.add_subplot(1, 1, 1) 
    sub_plot.set_xlabel('t(s)')
    sub_plot.set_ylabel('Position')
    plt.plot(pltx, plty, color='green')
    plt.plot(pltx, plt_value, color='red')
    plt.show()



if __name__ == '__main__':
    # Period of simulation
    T = 0.04
    
    # Parameters of PID
    Kp = 3
    Ti = 15
    Td = 0.3
    
    # Initialize PID and Model
    p = PID(T, Kp, Ti, Td)
    model = Model(T)
    
    target_value = 50
    current_value = 0
    
    _t = time.time()
    
    loop = True
    
    while loop:
        if time.time() - _t > 10:
            loop = False 
        
        t0 = time.time()
         
        u = p.incremental_pid(target_value, current_value)
        current_value += model.first_order_model(u)
        
        print('current value: ', current_value)

        pltx.append(t0 - _t)
        plty.append(target_value)
        plt_value.append(current_value)

        t = model.T - (time.time() - t0)
        if t > 0:
            time.sleep(t)
    
    show_analysis()

    
