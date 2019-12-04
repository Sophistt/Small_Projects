# PID Control 

Here are a PID Control Class of Python, a control model and a test python file of PID experiment.

## Principle
A **proportional-integral-derivative controller** (PID controller) is a control loop mechanism employing feedback taht is widely used in industrial control systems and a variety of other applications requiring continously modulated control.



![Imgur](https://i.imgur.com/ci6iFtK.png)

<p align="center">Image of PID controller</p>

From the above image, we can get the equation of PID controller:

<div align=center><img src="https://i.imgur.com/LDFUNlL.png"/></div>

In this equation, *e(t)* means the error between target output and current output; *KP* is the coefficient of the proportional process; *TI* is the coefficient of the integral process; *TD* is the coefficient of the derivative process.

However, in industrial control systems, the input and output values are discrete and we obtain them by sampling periodically by sensors. Therefore, the equation of PID controller should be transfromed into the discrete equation, in which *T* is the sampling period.

![Imgur](https://i.imgur.com/izO8g6R.png)

Through the above equation, the control signal *u* could be calculated by sampling the output *y* of the discrete system each step. Therefore, such equation is named **Positional PID Controller**, since it calculates the input signals each step.

Unfortunately, **Positional PID controller** needs to save and compute all the errors between target output and actual output from the beginning till now, which cost numerous computing resources. Hence, **Incremental PID Controller** is introduced to resolve the problem.

### Incremental PID Controller

A new equation of positional PID controller in the *ek-1* moment is introduced,
![Imgur](https://i.imgur.com/FLoSUkB.png)

Use the equation (1) minus eqution (2), equation (3) could be obtained.
![Imgur](https://i.imgur.com/Rjk3kJs.png)

Through equation (3), we can calculate the increment of control signals only by saving past errors *ek-1*, *ek-2*.

## Optimize parameters of PID Controller

To be continued ...
