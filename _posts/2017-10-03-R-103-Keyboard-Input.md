---
layout: post  
title: R 기초 103 직접 데이터 입력하기 (Keyboard Input)  
date: 2017-10-03  
category: [R for Beginners]  
tag: [R]  
author: hkim  

---

***preface*** 이번 포스트에서는 R에서 직접 데이터를 입력하는 방법에 대하여 설명합니다.

# Keyboard Input

다음 자료를 참고하였습니다:  
- http://www.statmethods.net/input/importingdata.html

일반적으로는 SAS, SPSS, Excel, Stata, 데이터베이스 또는 ASCII 파일에서 데이터 프레임을 가져옵니다. 하지만 직접 자료를 입력하고자 한다면 다음과 같이 합니다.

```r
# create a data frame from scratch
age <- c(25, 30, 56)
gender <- c("male", "female", "male")
weight <- c(160, 110, 220)
mydata <- data.frame(age,gender,weight)
```

R 내장 스프레드 시트(built in spreadsheet)를 사용하여 데이터를 입력할 수도 있습니다.

```r
# enter data using editor
mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
mydata <- edit(mydata)
# note that without the assignment in the line above,
# the edits are not saved!
```
