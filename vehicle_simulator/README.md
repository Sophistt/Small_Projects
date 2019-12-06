# Autonomous Vehicle Simulator  

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
![Build Passing](https://img.shields.io/appveyor/ci/gruntjs/grunt)

> A vehicle simulator based PyGame and simple kinematic model, which could imitate the vehicle motion in simple conditions.

Here are a Class of PathPlan which generates cubic splines for vehicle's motion planning, a Class of PurePursuit which tracks the trajectory through the purepursuit algorithm and a python file of simulator which consists of a Class of Vehicle and a Class of Game. The Game Class provides functions and logic to refresh the UI and the Vehicle Class is responsible for calculating the rate of position change.

## Table of Contents

- [Background](#background)
- [Requirement](#requirement)
- [Usage](#usage)

## Background

An excellent simulator for testing codes about self-driving vehicles is really useful. Carla is one of the most popular and successful platform in autonomous driving fields. However, installing and cofiguring the running environment of Carla is really troublesome especially when you are in some areas with annoying Internet. A portble simulator is useful enough in some conditions. Hence, this project use PyGame and simple vehicle kinematic models to create a rough simulator framework for logical experiment of self-driving cars.

<div align="center"> 
<img height="50%" width="50%" src="https://i.imgur.com/rgfhNGm.gif" title="example"/><br>
gif of simulator while running experimental scripts <br>
</div><br>  

## Requirement

- Python
  - PyGame
  - numpy
 
## Usage 
```
python simulator.py
```
