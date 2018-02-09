---
layout: post  
title: RNN을 이용한 시계열 예측  
date: 2018-02-02  
category: [Data Analysis]  
tag: [python]  
author: hkim  
hidden: true # don't count this post in blog pagination  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png  
headerImage: true  

---

***preface*** LTSM(Long Short-Term Memory)은


다음 자료를 참고하였습니다:
- [Multivariate Time Series Forecasting with LSTMs in Keras](https://machinelearningmastery.com/multivariate-time-series-forecasting-lstms-keras/) (17.08.14)


Neural networks like Long Short-Term Memory (LSTM) recurrent neural networks are able to almost seamlessly model problems with multiple input variables.
LSTM(Long Short-Term Memory) RNN(Recurrent Neural Networks)과 같은 Neural Networks는 입력 변수가 여러개인 경우에도 적용 가능합니다.

This is a great benefit in time series forecasting, where classical linear methods can be difficult to adapt to multivariate or multiple input forecasting problems.
이러한 부분은 시계열 예측에서 고전적인 선형 방법론이 다변량 분석을 적용하기 힘들다는 점을 고려할 때 큰 장점이 될 수 있습니다.

In this tutorial, you will discover how you can develop an LSTM model for multivariate time series forecasting in the Keras deep learning library.
이 튜토리얼에서는 Keras 심층 학습 라이브러리(Deep Learning Library)에서 다변량 시계열 예측을 위한 LSTM 모델을 개발하는 방법을 설명합니다.

After completing this tutorial, you will know:
이 자습서를 완료하면 다음 사항을 알 수 있습니다:

- How to transform a raw dataset into something we can use for time series forecasting.
- 원자료를 시계열 예측에 사용가능한 형태로 바꾸는 방법
- How to prepare data and fit an LSTM for a multivariate time series forecasting problem.
- 다변량 시계열 예측을 위한 LTSM 모형 적용을 위해 데이터를 준비하고 적합(fitting)하는 방법
- How to make a forecast and rescale the result back into the original units.
- 예측을 하고 결과를 원래 단위로 다시 조정하는 방법

Let’s get started.
시작해봅시다

Updated Aug/2017:
Fixed a bug where yhat was compared to obs at the previous time step when calculating the final RMSE. Thanks, Songbin Xu and David Righart.
최종 RMSE를 계산할 때 yhat가 이전 시간 단계에서 obs와 비교 된 버그가 수정되었습니다. 감사합니다, Songbin Xu 및 David Righart.

Update Oct/2017:
Added a new example showing how to train on multiple prior time steps due to popular demand
대중의 요구로 인해 이전의 여러 단계를 훈련하는 방법을 보여주는 새로운 예가 추가되었습니다.



## Tutorial Overview
This tutorial is divided into 3 parts; they are:
이 자습서는 다음 세 부분으로 나뉘어집니다:

- Air Pollution Forecasting
- 대기 오염 예측
- Basic Data Preparation
- 기본 데이터 준비
- Multivariate LSTM Forecast Model
- 다변량 LSTM 예측 모델


### Python Environment
This tutorial assumes you have a Python SciPy environment installed. You can use either Python 2 or 3 with this tutorial.
이 튜토리얼에서는 Python SciPy 환경이 설치되어 있다고 가정합니다. Python 2 또는 3을 사용할 수 있습니다.

You must have Keras (2.0 or higher) installed with either the TensorFlow or Theano backend.
TensorFlow 또는 Theano 백엔드와 함께 Keras (2.0 이상)가 설치되어 있어야합니다.

The tutorial also assumes you have scikit-learn, Pandas, NumPy and Matplotlib installed.
이 튜토리얼에서는 또한 Scikit-Learn, Pandas, NumPy 및 Matplotlib가 설치되어 있다고 가정합니다.

If you need help with your environment, see this post:
환경에 대한 도움이 필요한 경우 다음 게시물을 참조하세요:
- [How to Setup a Python Environment for Machine Learning and Deep Learning with Anaconda](http://machinelearningmastery.com/setup-python-environment-machine-learning-deep-learning-anaconda/)



## 1. Air Pollution Forecasting

In this tutorial, we are going to use the Air Quality dataset.
이 튜토리얼에서는 대기 오염과 관련된 데이터를 사용합니다.

This is a dataset that reports on the weather and the level of pollution each hour for five years at the US embassy in Beijing, China.
이 자료는 중국 베이징에 있는 미국 대사관에서 5년 동안의 날씨와 대기오염수준을 매 시간마다 보고한 데이터입니다.

The data includes the date-time, the pollution called PM2.5 concentration, and the weather information including dew point, temperature, pressure, wind direction, wind speed and the cumulative number of hours of snow and rain. The complete feature list in the raw data is as follows:
데이터에는 날짜와 시간, PM2.5 농도, 이슬점, 온도, 압력, 풍향, 풍속, 눈, 비 등 날씨 정보가 포함되어있습니다. 데이터의 전체 변수 목록은 다음과 같습니다.

1. **No**: row number (행 번호)
1. **year**: year of data in this row (연도)
1. **month**: month of data in this row (월)
1. **day**: day of data in this row (일)
1. **hour**: hour of data in this row (시간)
1. **pm2.5**: PM2.5 concentration (PM2.5 농도)
1. **DEWP**: Dew Point (이슬점)
1. **TEMP**: Temperature (온도)
1. **PRES**: Pressure (압력)
1. **cbwd**: Combined wind direction (풍향)
1. **Iws**: Cumulated wind speed (풍속)
1. **Is**: Cumulated hours of snow (눈)
1. **Ir**: Cumulated hours of rain (비)

We can use this data and frame a forecasting problem where, given the weather conditions and pollution for prior hours, we forecast the pollution at the next hour.
우리는이 데이터를 사용하여 예측 문제를 구체화 할 수 있습니다. 이전 시간의 날씨와 오염을 고려하여 다음 시간에 오염을 예측합니다.

This dataset can be used to frame other forecasting problems.
이 데이터 세트를 사용하여 다른 예측 문제를 구체화 할 수 있습니다.

Do you have good ideas? Let me know in the comments below.
좋은 아이디어가 있습니까? 아래 코멘트에서 알려주십시오.

You can download the dataset from the UCI Machine Learning Repository.
UCI Machine Learning Repository 에서 데이터 세트를 다운로드 할 수 있습니다.

[Beijing PM2.5 Data Set](https://archive.ics.uci.edu/ml/datasets/Beijing+PM2.5+Data)

Download the dataset and place it in your current working directory with the filename “raw.csv“.
데이터 세트를 다운로드하여 현재 작업 디렉토리에 "raw.csv"라는 파일 이름으로 저장하십시오.
