---
layout: post  
title: R 기초 301 기술통계량 (Descriptive Statistics)  
date: 2017-10-21  
category: [R for Beginners]  
tag: [R]  
author: hkim  
hidden: false # don't count this post in blog pagination  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 데이터에 대한 개략적 정보를 알아보는 기술통계량에 대하여 설명합니다. R 은 기술통계량을 제공하는 다양한 함수를 가지고 있습니다.

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/stats/descriptives.html](https://www.statmethods.net/stats/descriptives.html)

## 기술통계량

평균, 분산, 중위값 등 특정 기술통계량을 얻기 위해서는 `sapply( )` 함수를 사용합니다. 다음 기술통계량을 얻을 수 있습니다: mean, sd, var, min, max, median, range, and quantile.

```r
# get means for variables in data frame mydata
# excluding missing values
sapply(mydata, mean, na.rm=TRUE)
```

4분위수, 10분위수, 100분위수(quantile, decile, percentile)는 `quantile( )` 함수를 사용하여 구할 수 있습니다.

```r
quantile(mydata) # quantile
quantile(mydata, prob = seq(0, 1, length = 11), type = 5) # decile
quantile(mydata, prob = seq(0, 1, length = 101), type = 5) # percentile
```

다양한 기술 통계량을 한번에 보여주는 함수들은 아래와 같습니다.

```r
# mean,median,25th and 75th quartiles,min,max
summary(mydata)

# Tukey min,lower-hinge, median,upper-hinge,max
fivenum(x)
```

Hmisc 패키지를 사용할 수도 있습니다.

```r
library(Hmisc)
describe(mydata)
# n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles
# 5 lowest and 5 highest scores
```

pastecs 패키지를 사용할 수도 있습니다.

```r
library(pastecs)
stat.desc(mydata)
# nbr.val, nbr.null, nbr.na, min max, range, sum,
# median, mean, SE.mean, CI.mean, var, std.dev, coef.var
```

psych 패키지를 사용할 수도 있습니다.

```r
library(psych)
describe(mydata)
# item name ,item number, nvalid, mean, sd,
# median, mad, min, max, skew, kurtosis, se
```

## 그룹별 요약통계량 (Summary Statistics by Group)

psych 패키지를 이용하면 그룹별 요약통계량을 간단하게 구할 수 있습니다.

```r
library(psych)
describe.by(mydata, group,...)
```

doBy 패키지를 이용하면 SAS 에서의 PROC SUMMARY 기능을 대부분 사용할 수 있습니다. model 옵션을 조정하여 원하는 형태로 얻을 수 있습니다.

```r
library(doBy)
summaryBy(mpg + wt ~ cyl + vs, data = mtcars,
 	FUN = function(x) { c(m = mean(x), s = sd(x)) } )
# produces mpg.m wt.m mpg.s wt.s for each
# combination of the levels of cyl and vs
```
