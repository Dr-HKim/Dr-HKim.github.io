---
layout: post  
title: TensorFlow 와 KERAS 설치  
date: 2018-02-02  
category: [Data Analysis]  
tag: [python]  
author: hkim  
hidden: false # don't count this post in blog pagination  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png  
headerImage: true  

---

***preface*** 이번 포스트에서는 Python 에서 인공신경망(Artificial Neural Network, ANN) 실습을 하기 위하여 TensorFlow 및 KERAS 설치하는 방법을 알아봅니다.


## TensorFlow 설치

다음 자료를 참고하였습니다:
- [https://www.TensorFlow.org/install/](https://www.TensorFlow.org/install/)

TensorFlow 는 CPU 만을 사용하는 TensorFlow 와 GPU 를 사용하는 TensorFlow-GPU 로 나뉩니다.



### TensorFlow (CPU) 설치

이 블로그의 실습환경인 Anaconda 에서 설치하는 방법은 다음과 같습니다.

```
C:\> activate MYENV
(MYENV) C:\> pip install --ignore-installed --upgrade tensorflow-gpu
```

### TensorFlow-GPU 설치

TensorFlow-GPU 설치에 앞서 자신의 그래픽 카드에 맞는 드라이버 설치가 필요합니다.

자신의 그래픽카드가 NVIDIA 라면 NVIDIA CUDA Toolkit 설치가 필요합니다. 다만 최신버전(18.02.09 현재 9.1)은 TensorFlow 에서 지원을 하지 않아 에러가 발생하므로 9.0 버전을 깔아줍니다.

- 최신버전: [https://developer.nvidia.com/cuda-toolkit](https://developer.nvidia.com/cuda-toolkit)
- 9.0: [https://developer.nvidia.com/cuda-90-download-archive](https://developer.nvidia.com/cuda-90-download-archive)

NVIDIA cuDNN 설치도 필요합니다. 아래 웹사이트에서 CUDA 9.0 버전에 맞는 cuDNN 을 설치합시다. 무료회원가입과 로그인이 필요합니다.

- 최신버전: [https://developer.nvidia.com/cudnn](https://developer.nvidia.com/cudnn)

cuDNN 은 압축파일(zip)로 제공됩니다. 압축을 풀어 Program Files 폴더 안에 cuda 폴더에 넣어줍니다.

환경변수를 설정해줍니다. 내 PC > 속성 > 고급 시스템 설정 > 환경변수 > 시스템 변수 로 들어가 %Path% 변수에 다음 경로를 추가합니다.

```
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\bin
C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.0\libnvvp
C:\Program Files\cuda\bin
```


이제 TensorFlow-GPU 를 설치합시다. 이 블로그의 실습환경인 Anaconda 에서 설치하는 방법은 다음과 같습니다.

```
C:\> activate MYENV
(MYENV) C:\> pip install --ignore-installed --upgrade tensorflow-gpu
```

### 설치 확인

TensorFlow 설치가 제대로 되었는지 확인하려면 다음을 실행해봅시다.


python 실행
```
C:\> activate MYENV
(MYENV) C:\> python
```

TensorFlow 실행
```python
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```

다음 메세지가 정상적으로 출력되는지 확인합시다.
```
Hello, TensorFlow!
```





### 만약 설치가 잘 되지 않는다면?

자신의 PC 환경에서 TensorFlow 설치 및 실행이 잘 되지 않는 원인을 알기 위해서는  [https://gist.github.com/mrry/ee5dbcfdd045fa48a27d56664411d41c](https://gist.github.com/mrry/ee5dbcfdd045fa48a27d56664411d41c) 에서 `tensorflow_self_check.py` 를 다운받아 실행합니다. 필요한 조치 사항을 알려줍니다.


## KERAS 설치

이 블로그의 실습환경인 Anaconda 에서 KERAS를 설치하는 방법은 다음과 같습니다.

KERA (CPU only) 설치

```
C:\> activate MYENV
(MYENV) C:\> conda install -c anaconda keras
```

KERAS-GPU 설치

```
C:\> activate MYENV
(MYENV) C:\> conda install -c anaconda keras-gpu
```


### 설치 확인

마찬가지로 KERAS 설치가 제대로 되었는지 확인하려면 다음을 실행해봅시다.

python 실행
```
C:\> activate MYENV
(MYENV) C:\> python
```

KERAS 실행
```python
import keras
```
