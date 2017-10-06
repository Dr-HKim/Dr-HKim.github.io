---
layout: post  
title: R 기초 107 변수 레이블 (Variable Labels)  
date: 2017-10-01  
category:
- Data Analysis  

tags: [R]  
published: true  
---

***preface*** 이번 포스트에서는 R에서 변수 레이블을 설정하는 방법에 대하여 설명합니다.

# Variable Labels

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/variablelables.html](http://www.statmethods.net/input/variablelables.html)

R의 변수 레이블 처리 능력은 다소 만족스럽지 않습니다.

Hmisc 패키지를 사용하는 경우 몇 가지 레이블 기능을 이용할 수 있습니다.

```r
library(Hmisc)
label(mydata$myvar) <- "Variable label for variable myvar"
describe(mydata)
```

안타깝게도이 레이블은 Hmisc 패키지에서 제공하는 함수(예: describe ())에서만 유효합니다. 다른 방법은 변수 이름으로 변수 레이블을 사용한 다음, 위치 색인을 사용하여 변수를 참조하는 것입니다.

```r
names(mydata)[3] <- "This is the label for variable 3"
mydata[3] # list the variable
```
