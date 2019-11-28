#!/home/wcy/software/miniconda3/envs/py3.6/bin/python3
# -*- coding: utf-8 -*-

"""
* @Copyright (c)  all right reserved
* 
* @file:model.py
* @author: Sophistt
* @date:2019-11-28 14:07
* @description: Python file
"""

class Model:
    def __init__(self, T):
        # Update period
        self.T = T
       

    def first_order_model(self, x):
        return self.T * (x - 5)
   

    def second_order_model(self, x):

        _x = abs(x)
        
        y = self.T * (0.25 * _x * _x + 0.3 * _x)
        
        if x >= 0:
            return y
        else:
            return -y



if __name__ == '__main__':
    model = Model()
    print(model.T)
