# PID Controller

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
![Build Passing](https://img.shields.io/appveyor/ci/gruntjs/grunt)

> PID Controller and simulator with basic first-order model

Here are a Class of PID Controller, a simple first-order model for simulation and a python file of simulator for PID experiment.

## Table of Contents

- [Background](#background)
- [Requirement](#requirement)
- [Usage](#usage)

## Background

This project started with the issue about controlling the steering wheel through torque to achieve target steering angle. A python Class of simple incremental PID controller was created for convenient call. To test the effect of PID controller, a simple first-order plant was established. Through the simulator, the tracking process was recorded and data were shown by matplotlib.

If interested, check out the link of mathmatical principle about PID controller: [Pinciple of PID controller](https://sophistt.github.io/study/2019/12/04/pid-controller.html) 

## Requirement

- python
  - matplotlib

## Usage

```
python simulator.py
```
