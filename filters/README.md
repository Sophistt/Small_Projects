# Various simple filters

## Kalman filter
Tutorial: [click here](https://sophistt.github.io/study/2019/07/24/kalman-filter.html)

Principle:

<img src="https://latex.codecogs.com/gif.latex?\begin{align*}&space;\hat{x}^-_t&space;=&space;A\hat{x_{t-1}}&space;&plus;&space;Bu_t&space;\\&space;\hat{P}^-_t&space;=&space;A\hat{P_{t-1}}A^T&space;&plus;&space;Q&space;\\&space;K_t&space;=&space;\frac{\hat{P}^-_tH^T}{H^T\hat{P}^-_tH^T&space;&plus;&space;R}&space;\\&space;\hat{x}_t&space;=&space;\hat{x}^-_t&space;&plus;&space;K_t(z_t&space;-&space;H\hat{x}^-_t)&space;\\&space;\hat{P}_t&space;=&space;(I&space;-&space;K_tH)\hat{P}^-_t&space;\end{align*}" title="\begin{align*} \hat{x}^-_t = A\hat{x_{t-1}} + Bu_t \\ \hat{P}^-_t = A\hat{P_{t-1}}A^T + Q \\ K_t = \frac{\hat{P}^-_tH^T}{H^T\hat{P}^-_tH^T + R} \\ \hat{x}_t = \hat{x}^-_t + K_t(z_t - H\hat{x}^-_t) \\ \hat{P}_t = (I - K_tH)\hat{P}^-_t \end{align*}" />

## Mean filter

<a href="https://www.codecogs.com/eqnedit.php?latex=\\&space;Y_{pre}&space;=&space;[Y_{n-4},&space;Y_{n-4},&space;Y_{n-3},&space;Y_{n-2},&space;Y_{n-1}]&space;\\&space;Y_n&space;=&space;\frac{Y_{pre}}{5}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\\&space;Y_{pre}&space;=&space;[Y_{n-4},&space;Y_{n-4},&space;Y_{n-3},&space;Y_{n-2},&space;Y_{n-1}]&space;\\&space;Y_n&space;=&space;\frac{Y_{pre}}{5}" title="\\ Y_{pre} = [Y_{n-4}, Y_{n-4}, Y_{n-3}, Y_{n-2}, Y_{n-1}] \\ Y_n = \frac{Y_{pre}}{5}" /></a>

## Exponential filter

## First-order lowpass filter
Parameters:

<img src="https://latex.codecogs.com/gif.latex?\\&space;X(n):&space;sample&space;\quad&space;value&space;\\&space;Y(n):&space;filtered&space;\quad&space;output&space;\quad&space;value&space;\\&space;\alpha:&space;filter&space;\quad&space;coefficient" title="\\ X(n): sample \quad value \\ Y(n): filtered \quad output \quad value \\ \alpha: filter \quad coefficient" />

Principle:

<img src="https://latex.codecogs.com/gif.latex?Y(n)={\alpha}X(n)&plus;(1-{\alpha})Y(n-1)" title="Y(n)={\alpha}X(n)+(1-{\alpha})Y(n-1)" />
