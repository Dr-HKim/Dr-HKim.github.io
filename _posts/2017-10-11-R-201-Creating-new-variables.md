---
layout: post  
title: R 기초 201 새로운 변수 만들기 (Creating New Variables)  
date: 2017-10-11  
category: [R for Beginners]  
tag: [R]  
author: hkim  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 기존 자료를 활용하여 새로운 변수를 만들어내는 방법에 대하여 설명합니다.

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/variables.html](http://www.statmethods.net/management/variables.html)

## 연산을 통한 입력

새로운 변수를 만들 때에는 `<-` 라는 연산자를 사용합니다. 새로운 변수 생성을 위해 다양한 연산자와 함수를 사용할 수 있습니다.

```r
# Three examples for doing the same computations

mydata$sum  <-  mydata$x1 + mydata$x2
mydata$mean <- (mydata$x1 + mydata$x2)/2

attach(mydata)
mydata$sum <- x1 + x2
mydata$mean <- (x1 + x2)/2
detach(mydata)

mydata <- transform( mydata,
sum = x1 + x2,
mean = (x1 + x2)/2
)
```

## 조건에 따른 입력 (Recoding variables)

R 의 제어문을 이용하여, 조건에 따른 변수를 입력할 수 있습니다.

```r
# create 2 age categories
mydata$agecat <- ifelse(mydata$age > 70, c("older"), c("younger"))

# another example: create 3 age categories
attach(mydata)
mydata$agecat[age > 75] <- "Elder"
mydata$agecat[age > 45 & age <= 75] <- "Middle Aged"
mydata$agecat[age <= 45] <- "Young"
detach(mydata)
```

## 변수 이름 바꾸기 (Renaming variables)

다음 방법으로 변수 이름을 바꿀 수 있습니다.

```r
# rename interactively
fix(mydata) # results are saved on close

# rename programmatically
library(reshape)
mydata <- rename(mydata, c(oldname="newname"))

# you can re-enter all the variable names in order
# changing the ones you need to change.the limitation
# is that you need to enter all of them!
names(mydata) <- c("x1","age","y", "ses")
```
