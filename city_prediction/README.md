
# City Prediction

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
![Build Passing](https://img.shields.io/appveyor/ci/gruntjs/grunt)

> A project utilze data of city to test pytorch template. 
Here are a class of Neural Network used for defining the model, a `params.py` file consists of parameters for training, a `main.py` file to begin to train evaluate the model, a `data.py` to create data pipeline from `train.txt` and `eval.txt` and a `tool.py` for visualization of the training process.

## Table of Contents

- [Background](#background)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)

## Background
Codes for creating data pipeline, training the model and results evaluation are similar. To save time and stop monotonous work, a template was created and we can quickly begin our work by only modifying a bit of codes through it. In order to test codes, data of cities are downloaded and recorded. Modify `data.py` to create the datapipe line and run `main.py` to begin the training process. 

## Prerequisites

- python3.6
  - pytorch 1.4
  - cuda 10.1

 ## Installation 
 
 Use **conda** could install `pytorch` and `cuda` easily.
 ```
 conda install pytorch torchvision cudatoolkit=10.1 -c pytorch
 ```
 
## Usage

1. Clone this folder and enter into the template folder.
2. Define your own neural network model in `network.py` and redefine the **forward()** function.
3. Construct **train_loader** and **eval_loader** to load data in `main.py` 
4. Modify training parameters in `params.py` according your own needs.
5. Start train and evaluate your own neural network model,
```
python main.py
```

<a href="https://imgur.com/9NglSqn"><img src="https://i.imgur.com/9NglSqn.png" title="source: imgur.com" /></a>
