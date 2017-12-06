---
layout: post  
title: R 기초 106 데이터 살펴보기 (Viewing Data)  
date: 2017-10-06  
category: [R for Beginners]  
tag: [R]  
author: hkim  

---

***preface*** 이번 포스트에서는 R에서 불러온 데이터를 살펴보는 방법에 대하여 설명합니다.

# Getting Information on a Dataset

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/contents.html](http://www.statmethods.net/input/contents.html)

다양한 함수를 통해 데이터를 살펴볼 수 있습니다.

```r
# list objects in the working environment
ls()

# list the variables in mydata
names(mydata)

# list the structure of mydata
str(mydata)

# list levels of factor v1 in mydata
levels(mydata$v1)

# dimensions of an object
dim(object)

# class of an object (numeric, matrix, data frame, etc)
class(object)

# print mydata
mydata

# print first 10 rows of mydata
head(mydata, n=10)

# print last 5 rows of mydata
tail(mydata, n=5)
```
