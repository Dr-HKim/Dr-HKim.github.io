---
layout: post  
title: 파이썬 기초 03 제어문 if, while, for  
date: 2017-06-13  
category: [Python for Beginners]  
tag: [python]  
author: hkim  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 파이썬에서 사용되는 제어문(Control Structures)에 대해 알아보겠습니다. 코딩에 익숙한 분들이라면 아래 예제들로 충분할 것으로 생각됩니다. 친절한 설명은 생략합니다.

**참고: 들여쓰기와 공백을 혼용하지 않는 것이 중요합니다.**  

파이썬 문법에서는 **들여쓰기(indentation)** 가 중요합니다. 문법에서 들여쓰기를 강요함으로써 코드의 가독성을 높이는 장점이 있습니다. 다만, 사람마다 들여쓰기를 `tab` 으로 하기도 하고 띄어쓰기 2칸 혹은 4칸으로 들여쓰기를 하는 경우도 있습니다. 최소한 한 단락 안에서는 들여쓰기 방식을 통일해야 합니다.

PC, 태블릿 등에서 여러 에디터를 사용하여 코드를 편집하게 되는데, 이때 편집기마다 들여쓰기 정의가 다른 경우가 있습니다. 이로 인해 에러가 뜨기도 합니다. 겉보기에 아무 문제도 없는 코드가 에러가 난다면 이 경우를 의심해볼 수 있습니다.




**참고: 유투브 무료 파이썬 강좌**  
- K-MOOC: 데이터 과학을 위한 파이썬 입문 (가천대학교 최성철 교수)
- [www.flearning.net](www.flearning.net): Python으로 Big Data 분석하기 (10시간, 무료)


**참고: 논리(boolean)가 아닌 자료형의 참과 거짓**

자료형    | 참(True)      | 거짓(False)
---------|---------------|-------------
숫자     | 0이 아닌 숫자   | 0
문자열   | "abc"         | ""
리스트   | [1,2,3]       | []
터플     | (1.2.3)       | ()
딕셔너리 | {"a":"b"}     | {}



# 조건문: if

```python
# 조건문: if, if~else, if~elif~else
score = 85

if score > 90:
  print("A 입니다.")
elif score > 80:
  print("B 입니다.")
else:
  print("재시험을 쳐야합니다.")


# 선택 예제
pocket = ['paper', 'money', 'cellphone']
card = 1
if 'money' in pocket:
  pass #pass 를 쓰면 아무 것도 하지 않습니다
elif card:
  print("택시를 타고가라")
else:
  print("카드를 꺼내라")  
```

# 반복문: for

```python
# 예제: Content
content_list = ["One", "Two", "Three"]
for content in content_list:
  print("Content: ", content)


# 예제: 성적 발표
marks = [90, 25, 67, 45, 80]
number = 0
for mark in marks:
  number = number +1
  if mark < 60:
    continue # continue를 만나면 for문의 처음으로 돌아갑니다
  print("%d번 학생 축하합니다. 합격입니다. " % number)

# 예제: 구구단
numbers = [1,2,3,4,5,6,7,8,9]
for i in numbers:
  for j in numbers:
    print(i, "x", j, "=", i*j)
  print()
```


# 반복문: while

```python
# 예제: 나무 찍기 10회 출력
treeHit = 0
while treeHit < 10:
  treeHit = treeHit +1
  print("나무를 %d번 찍었습니다." % treeHit)
  if treeHit == 10:
    print("나무 넘어갑니다.")


# 예제: 홀수만 출력
a = 0
while a < 10:
  a = a+1
  if a % 2 == 0:
    continue # continue를 쓰면 처음으로 돌아갑니다
  print(a)


# 예제: 커피머신
coffee = 10
while True:
  money = int(input("돈을 넣어 주세요: "))
  if money == 300:
    print("커피를 줍니다.")
    coffee = coffee -1
  elif money > 300:
    print("거스름돈 %d를 주고 커피를 줍니다." % (money -300))
    coffee = coffee -1
  else:
    print("돈을 다시 돌려주고 커피를 주지 않습니다.")
    print("남은 커피의 양은 %d개 입니다." % coffee)
  if not coffee:
    print("커피가 다 떨어졌습니다. 판매를 중지 합니다.")
    break # break를 쓰면 while 문을 빠져나옵니다
```


# 예외처리: Exception

```python
# ZeroDivisionError
4/0 # 이대로는 ZeroDivisionError: division by zero 라는 에러 메세지가 뜹니다

try:
  4/0
except ZeroDivisionError:
  print("0으로 나눌 수 없습니다.")


# IndexError
age = [37, 31, 360, 43, 55, 46, 37]

age[7] # IndexError: list index out of range

try:
  age[7]
except IndexError:
  print("age의 인덱스는 0 부터 6까지 입니다.")
```

# 사용자 정의 함수: Function

```python
# 사용자 함수: def 함수명(인수1, 인수2): return 반환값
def hello():
  print("Hello world!")

hello() # Hello world!


def hello(name):
  print("Hello , ", name)

hello("Python") # Hello, Python

# 예제
def doubleNumber(x):
  return 2*x

def doubleNumber(x):
  result = 2*x
  return(result)

doubleNumber(3) # 6
```
