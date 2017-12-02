---
layout: post  
title: R 기초 108 값 레이블 (Value Labels)  
date: 2017-10-01  
category:
- R for Beginners
tag: [R]  
author: hkim  
---

***preface*** 이번 포스트에서는 R에서 값 레이블을 설정하는 방법에 대하여 설명합니다.

# Value Labels

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/valuelabels.html](http://www.statmethods.net/input/valuelabels.html)


R의 값 레이블을 이해하려면 데이터 구조 요소를 이해해야합니다.

factor 함수를 사용하여 고유 한 값 레이블을 만들 수 있습니다.


```r
# variable v1 is coded 1, 2 or 3
# we want to attach value labels 1=red, 2=blue, 3=green

mydata$v1 <- factor(mydata$v1,
  levels = c(1,2,3),
  labels = c("red", "blue", "green"))
```

```r
# variable y is coded 1, 3 or 5
# we want to attach value labels 1=Low, 3=Medium, 5=High

mydata$v1 <- ordered(mydata$y,
  levels = c(1,3, 5),
  labels = c("Low", "Medium", "High"))
```

nominal 데이터에는 factor () 함수를 사용하고, ordinal 데이터에는 ordered () 함수를 사용합니다. 이렇게 하면 R 통계 및 그래픽 기능에서 데이터를 적절하게 처리할 수 있습니다.

참고: factor와 ordered는 동일한 인수를 사용하여 같은 방식으로 사용됩니다. 전자는 factor 를 만들고 나중에는 ordered factor 를 만듭니다.
