---
layout: post  
title: R 기초 109 결측치 처리 (Missing Data)  
date: 2017-10-09  
category: [R for Beginners]  
tag: [R]  
author: hkim  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 R에서 결측치를 처리하는 방법에 대하여 설명합니다.

# Missing Data

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/missingdata.html](http://www.statmethods.net/input/missingdata.html)

R에서 결측값은 기호 NA (Not Available) 로 표시됩니다. 불가능한 값(예: 0으로 나누기)은 기호 NaN (Not a Number) 로 표시됩니다. SAS와 달리 R은 문자 및 숫자 데이터에 대해 동일한 기호를 사용합니다. 결측치 처리에 대한 더 자세한 내용은 [데이터처리 과정](https://www.datacamp.com/courses/cleaning-data-in-r)을 참고하세요.



## Testing for Missing Values

```r
is.na(x) # returns TRUE of x is missing
y <- c(1,2,3,NA)
is.na(y) # returns a vector (F F F T)
```

## Recoding Values to Missing

```r
# recode 99 to missing for variable v1
# select rows where v1 is 99 and recode column v1
mydata$v1[mydata$v1==99] <- NA
```

## Excluding Missing Values from Analyses

결측값에 대한 산술 함수는 결측값을 산출합니다.

```r
x <- c(1,2,NA,3)
mean(x) # returns NA
mean(x, na.rm=TRUE) # returns 2
```

complete.cases() 함수는 어떤 case 가 완료되었는지를 나타내는 논리 벡터를 반환합니다.

```r
# list rows of data that have missing values
mydata[!complete.cases(mydata),]
```

na.omit() 함수는 결측값을 listwise deletion 하여 반환합니다.


```r
# create new dataset without missing data
newdata <- na.omit(mydata)
```

데이터에 NA, NaN, Inf 값이 있는 경우 실행되지 않는 분석들이 있습니다. `colSums(is.na(mydata))`, `colSums(is.nan(mydata))`, `colSums(is.infinite(mydata))` 혹은 `sum(is.na(mydata$myvar))`, `sum(is.nan(mydata$myvar))`, `sum(is.infinite(mydata$myvar))` 를 이용하여 해당되는 부분이 있는지 먼저 살펴봅시다.


## Last Observation Carried Forward

결측값을 다루는 여러가지 방법이 있습니다. 여기서는 최근 관측치를 그대로 입력하는 방법을 알아봅니다.

다음을 참고하였습니다:
[https://stackoverflow.com/questions/2776135/last-observation-carried-forward-in-a-data-frame](https://stackoverflow.com/questions/2776135/last-observation-carried-forward-in-a-data-frame)

```r
# Function: Last Observation Carried Forward
LOCF <- function(MYVAR) {
  X <- !is.na(MYVAR)
  c(NA, MYVAR[X])[cumsum(X)+1]
}

data.frame(lapply(MYDATA, LOCF))
```
