---
layout: post  
title: 파이썬 기초 02 변수의 종류  
date: 2017-06-12  
category: [Python for Beginners]  
tag: [python]  
author: hkim  

---

***preface*** 이번 포스트에서는 파이썬에서 사용되는 기본적인 변수들에 대해 알아보겠습니다.

# Python 변수의 종류

# 변수

파이썬에 저장되는 입력값의 종류는 크게 아래 3가지로 구분할 수 있습니다.

```python
# 숫자
age = 29
print(age)   # 29

# 문자
name = "Simon"
print(name)  # Simon

# 논리(Boolean)
marry = True
print(marry) # True
```


# 리스트(list)

## 리스트(list)란?

- 임의의 개체들의 순서열입니다.
- 대괄호([]) 안에 값들을 입력합니다.

```python
# 숫자
age = [29, 39, 49]
print(age)   # [29, 39, 49]

# 문자
name = ["Simon", "James", "Julie"]
print(name)  # ['Simon', 'James', 'Julie']

# 논리(Boolean)
marry = [True, False, True]
print(marry) # [True, False, True]
```


## 리스트(list)의 인덱싱과 슬라이싱

리스트를 구성하는 원소를 번호를 기준으로 자를 수 있습니다.
PROGRAMIZ 라는 순서의 리스트라면, 인덱싱(위치를 나타내는 숫자)은 다음과 같습니다.

.|P|.|R|.|O|.|G|.|R|.|A|.|M|.|I|.|Z|.
-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-
0|.|1|.|2|.|3|.|4|.|5|.|6|.|7|.|8|.|9

혹은 거꾸로

 .|P| .|R| .|O| .|G| .|R| .|A| .|M| .|I| .|Z
--|-|--|-|--|-|--|-|--|-|--|-|--|-|--|-|--|-
-9|.|-8|.|-7|.|-6|.|-5|.|-4|.|-3|.|-2|.|-1|.

이를 기준으로 리스트를 자르면 다음과 같습니다.

```python
# 인덱싱과 슬라이싱
index = ["P", "R", "O", "G", "R", "A", "M", "I", "Z"]

index[0]   # "P"
index[-1]  # "Z"
index[2:4] # ["O","G"]
index[:4]  # ["P", "R", "O", "G"]
index[4:]  # ["R", "A", "M", "I", "Z"]


# 값을 치환할 때
age = [29, 39, 49]
age[1] = 40

age # [29, 40, 49]


# 2차원 리스트
age2 = [[37,31,45,45],
        [40,47,35,34]]

age2       # [[37, 31, 45, 45], [40, 47, 35, 34]]
age2[0]    # [37, 31, 45, 45]
age2[0][1] # 31
```


## 리스트(list) 관련 함수들

코드      |설명
---------|----------------
append() |리스트의 끝에 하나의 원소를 추가
extend() |리스트의 끝에 여러 개의 원소를 추가
insert() |특정한 위치에 하나의 item 을 추가
remove() |특정 item 을 제거
pop()    |특정한 위치의 요소를 제거
clear()  |리스트에 있는 모든 item 을 제거
count()  |특정한 값의 빈도를 계산
sort()   |오름차순으로 정렬
reverse()|내림차순으로 정렬
copy()   |리스트를 복사




# 튜플(tuple)

## 튜플(tuple)이란?

- 리스트와 유사하나 값이 변환되지 않습니다.
- 따라서 상수 등을 저장할 때 유용합니다.


## 튜플(tuple)의 인덱싱과 슬라이싱

```python
telecom = ("SKT", "KT", "LGU+")
telecom[0]  # 'SKT'
telecom[1]  # 'KT'
telecom[1:] # ('KT', 'LGU+')

telecom[1] = "Samsung" # 튜플은 값이 변환되지 않으므로 error 발생
```



# 딕셔너리(dictionalry)

## 딕셔너리(dictionalry)란?

- key 와 value 를 한 쌍으로 가지는 자료형입니다.
- {key1:value1. key2:value2, ...}
- key 에는 변하지 않는 값을 사용하고, value 에는 변하는 값과 변하지 않는 값 모두를 사용할 수 있습니다.

```python
baseball = {"김재환":"두산", "최형우":"기아", "박용택":"LG"}

baseball              # {'김재환':'두산', '최형우':'기아', '박용택':'LG'}
baseball["김재환"]     # '두산'
baseball.keys()       # dict_keys(['김재환', '박용택', '최형우'])
baseball.values()     # dict_values(['두산', 'LG', '기아'])
baseball.items()      # dict_items([('김재환', '두산'), ('박용택', 'LG'), ('최형우', '기아')])
baseball.get("최형우") # '기아'

baseball.clear()
baseball # {}
```
