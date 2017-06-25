---
layout: post  
title: 파이썬(Python) 설치 및 환경설정  
date: 2017-06-25  
tags: [python]  
published: true  
---

이번 포스트는 **윈도우** 환경에서 **데이터 분석** 을 목적으로 파이썬(Python)을 설치하고 환경설정을 하는 방법을 다룹니다.

# Python 설치 방법

## Anaconda 설치

파이썬은 단독으로 설치하면 함께 설치해야할 패키지가 많아 번거롭습니다.

Anaconda 라는 배포판에 기본적인 패키지와 유용한 프로그램들이 함께 들어있으므로 이를 설치하는 것을 추천합니다.

Anaconda 다운로드 링크: https://www.continuum.io/downloads#windows

본인의 시스템(32bit/64bit)을 확인한 후 이에 맞는 최신버전을 설치합니다.

운영체제가 64bit 라면 작성 시점 현재 최신버전은 다음과 같습니다: Python 3.6 version 64bit installer


## 가상환경 구성

Anaconda 의 장점 가운데 하나는 가상환경을 구성해서 사용하기 쉽다는 것입니다.

개발하는 내용에 따라 사용하는 패키지가 다르고, 패키지마다 충돌이 일어나는 등 문제가 발생할 수 있으므로 프로젝트 별로 다음과 가팅 가상환경을 구성해서 개발하는 것을 추천합니다.

- 가상환경1(프로젝트1): 파이썬2.7, 패키지 A, B, C, D
- 가상환경2(프로젝트2): 파이썬3.5, 패키지 X, Y, Z

가상환경을 구성하고 실행하는 방법은 다음과 같습니다:

실행>cmd

```
# MYENV 는 사용자 설정 환경 이름, 뒤에 anaconda 옵션 붙여야 3.5 환경에서 무리없이 실행
C:\> conda create -n MYENV python=3.5 anaconda

# 리눅스 환경일 때는 다음을 추가합니다 (윈도우에서는 필요없음)
$ python -m ipykernel install --user --name MYENV --display-name "Python (MYENV)"
```

MYENV 라는 이름의 가상환경을 파이썬 3.5 버전으로 만드는 예제입니다.
텐서플로의 경우 파이썬 3.6을 아직 지원하지 않으므로 파이썬 3.5 가상환경을 구성합니다.

이렇게 구성된 가상환경은 설정에 따라 다음 폴더에 저장됩니다:

- C:\Users\Username\AppData\Local\conda\conda\envs\MYENV
- C:\ProgramData\Anaconda3\envs\MYENV

가상환경을 실행하거나 종료할 때는 다음을 실행합니다:

```
# 가상환경 실행
C:\> activate MYENV

# 가상환경 종료
(MYENV) C:\> deactivate
```

참고로, python 3.5 환경을 사용하였으므로 작성자는 MYENV = py35 라고 명명했습니다.

가상환경을 지우는 방법은 deactivate 후 해당 폴더를 삭제하면 됩니다.

파이썬이 제대로 내가 원하는 환경(python 3.5)에서 돌아가고 있는지 확인하려면 다음을 실시합니다.

```
C:\> activate MYENV
(MYENV) C:\> python

>> import sys
>> print (sys.version)
```




## 패키지 설치

파이썬을 데이터 분석에 사용하기 위해서는 몇가지 패키지가 추가 설치되어야 합니다.

패키지 설치는 다음 명령어를 사용합니다:

```
(MYENV) C:\> pip install PACKAGENAME
```

pip install 대신 conda install 명령어를 사용하기도 하지만 Anaconda Library에 없는 것들도 있어서 pip 명령어를 선호합니다.

머신러닝에서 기본적으로 사용하는 패키지는 다음과 같습니다:

- numpy: 선형대수, 행렬 연산을 합니다.
- pandas: DataFrame을 사용할 수 있습니다.
- scipy
- matblotlib: 그래프를 그립니다.
- sklearn: 각종 통계 분석을 사용할 수 있습니다.

참고로, numpy의 경우 윈도우에서는 Windows prebuilt binary (www.lfd.uci.edu/~gohlke/pythonlibs/) 사이트 들어가서 numpy+mkl 버전을 다운받아 설치해야 합니다. 현재 가상환경으 python 3.5버전이므로 cp35 라고 적힌 파일을 다운받읍시다. 시스템(32bit/64bit)에 주의합니다.

CMD 상에서 아래와 같이 패키지를 설치합니다:

```
(MYENV) C:\> pip install c:\Users\User\Downloads\numpy-1.12.1+mkl-cp35-cp35m-win_amd64.whl1
(MYENV) C:\> pip install pandas
(MYENV) C:\> pip install scipy (에러시 직접 다운로드)
(MYENV) C:\> pip install matplotlib
(MYENV) C:\> pip install sklearn
```

참고로 CMD 에서 붙여넣기를 하려면 좌상단 아이콘 우클릭 > 편집 > 붙여넣기 를 하면 됩니다.

제대로 설치되었는지 확인하기 위해서는 파이썬을 실행하여 다음 명령어를 입력합니다. 아무 메시지도 뜨지 않는다면 정상적으로 설치된 것입니다.

```
C:\> activate MYENV
(MYENV) C:\> python

>> import numpy
>> import pandas
>> import scipy
>> import matplotlib
>> import sklearn
```

파이썬에서 빠져나오기 위해서는 Ctrl+Z 를 입력합니다. CMD 에서 빠져나오려면 exit 를 입력합니다.

```
>> ^Z

(MYENV) C:\> exit
```



---
**Error: import matplotlib 에서 에러가 나는 경우**

다음 링크를 참고하였습니다:
https://stackoverflow.com/questions/34004063/error-on-import-matplotlib-pyplot-on-anaconda3-for-windows-10-home-64-bit-pc

파이썬 오류로 나타나는 현상입니다.  
`C:\ProgramData\Anaconda3\envs\MYENV\Lib\site-packages\matplotlib\font_manager.py` 혹은
`C:\Users\Username\AppData\Local\conda\conda\envs\MYENV\Lib\site-packages\matplotlib\font_manager.py`  
를 열고 win32InstalledFonts() 함수를 찾아 다음과 같이 수정합니다:

```python
key, direc, any = winreg.EnumValue( local, j)
if not is_string_like(direc):
    continue
if not os.path.dirname(direc):
    direc = os.path.join(directory, direc)
direc = direc.split('\0', 1)[0] # 이 부분만 수정하면 됩니다.
```
---


## Pycharm (IDE) 설치

IDE란 Integrated Development Enviornment (통합개발환경) 를 말합니다.

R 이 익숙한 분들에게, Python 이 R 이라면 IDE 는 R-Studio 를 말합니다.  

참고: R 은 요즘 VisualStudio 로 많이 쓴다고 합니다. R 보다 Python 이 대체로 더 빠르다고 합니다.

Pycharm 홈페이지에서 community 버전을 다운받아 설치합니다.

Pycharm에서 가상환경(Virtual Enviorment) 선택 방법:

- File > Setting > Project:untitled > Project Interpreter
- Project Interpreter 옆에 톱니바퀴 클릭
- 설정에 따라 다음 경로를 찾아서 python.exe 를 선택
- C:\Users\Username\AppData\Local\conda\conda\envs\MYENV\python.exe
- C:\ProgramData\Anaconda3\envs\MYENV\python.exe


## Jupyter 실행

Jupyter Notebook 은 파이썬 코드를 한줄 한줄 실행하며 바로 결과를 볼 수 있어 교육 목적으로 적당합니다. 마크다운 형식으로 노트를 작성하는 것도 가능합니다. 브라우저에서 실행되므로 설정에 따라 외부접속도 가능해서 실제 개발환경으로도 좋습니다.


실행 방법: cmd 에서 가상환경에 들어간 뒤 다음을 실행합니다.

```
C:\> activate MYENV
(MYENV) C:\> jupyter notebook
```

익스플로러에서는 잘 실행되지 않을 수도 있습니다. 이 경우 크롬을 기본 브라우저로 설정하고 실행합니다.

Jupyter 를 실행했다면 새로운 파이썬 노트를 만들어봅시다.
새로운 노트를 만드는 방법은 우상단 아이콘을 클릭합니다.

Jupyter Notebook에서 다음을 실행해봅시다: (실행은 shift+Enter)

```python
print("Hello World!")
```

다음을 실행하면 jupyter notebook 이 실행중인 파이썬 버전을 확인할 수 있습니다.
가상환경 설정과 동일한지 확인해두는 것이 좋습니다.

```python
import sys
sys.version
sys.version_info
```

jupyter notebook 을 종료해도 cmd 창에는 여전히 실행 중인 것을 확인할 수 있습니다. Ctrl+C 를 입력하면 종료됩니다.


# Appendex: Anaconda Python 삭제 방법 (Windows)

다음 링크를 참고하였습니다: https://docs.continuum.io/anaconda/install

cmd 에서 다음과 같이 삭제 패키지를 실행합니다:

```
C:\> conda install anaconda-clean
C:\> anaconda-clean
C:\> anaconda-clean --yes
```

윈도우 제어판 > 프로그램 제거 >  Python 3.6 (Anaconda)



# Appendix: Jupyter notebook 외부접속 설정

다음 링크를 참고하였습니다: http://goodtogreate.tistory.com/entry/IPython-Notebook-%EC%84%A4%EC%B9%98%EB%B0%A9%EB%B2%95

포트포워딩이 익숙한 경우 보안을 위해 바꿔줍시다.

**포트포워딩**  
iptime config 192.168.0.1  
포트포워딩 설정 외부 8888 내부 8888

**방화벽 인바운드 규칙 설정**  
windows 방화벽 고급설정  
인바운드 규칙 > jupyter 8888 허용

**jupyter config 설정**  
터미널에서 다음을 입력하면 config 파일이 생성됩니다.

```
$ jupyter notebook --generate-config
```

jupyter 에서 다음 코드를 실행해서 암호에 사용될 key 값을 뽑습니다.

```
In [1]: from notebook.auth import passwd

In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:q2df542sd425:542hj2ae754682edk542sd25302d227f0ca7bdf541'
```

jupyter_notebook_config.py를 열어서 아래의 내용을 입력합니다.

```python
# Password to use for web authentication
c = get_config()
c.NotebookApp.password =
u'sha1:q2df542sd425:542hj2ae754682edk542sd25302d227f0ca7bdf541'
```

참고: sha1 값은 설정한 패스워드에 따라 달라집니다. 예시에 들어간 sha1 값은 임의로 수정한 값입니다.

다음을 추가로 수정합니다.

```python
# The IP address the notebook server will listen on.
# c.NotebookApp.ip = 'localhost'
c.NotebookApp.ip = '192.168.0.1' #jupyter 구동 PC 내부 IP
# c.NotebookApp.port_retries = 50
c.NotebookApp.port_retries = 8888
```


# Appendix: Jupyter Notebook 에서 R kernel 설정

다음 링크를 참고하였습니다: https://www.continuum.io/blog/developer/jupyter-and-conda-r

현재 환경(current environment)에 R Essentials를 설치할 때

```
(MYENV) C:\> conda install -c r r-essentials
```

새로운 환경(MYENV)을 만들어 R Essentials를 설치할 때

```
C:\> conda create -n MYENV -c r r-essentials
```
