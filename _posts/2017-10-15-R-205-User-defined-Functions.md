---
layout: post  
title: R 기초 205 사용자 정의 함수 (User-written Functions)  
date: 2017-10-15  
category: [R for Beginners]  
tag: [R]  
author: hkim  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 사용자 정의 함수를 사용하는 방법에 대하여 설명합니다.

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/userfunctions.html](http://www.statmethods.net/management/userfunctions.html)

R 이 강력한 이유 가운데 하나는 ~~사실 대부분의 프로그래밍 언어가 그렇지만~~ 사용자가 직접 함수를 만들어 쓸 수 있다는 것입니다. 실제로 대부분의 R 함수는 함수의 함수(function of functions)로 구성되어 있습니다. 사용자 정의 함수의 구조는 아래와 같습니다.

```r
myfunction <- function(arg1, arg2, ... ){
statements
 return(object)
 }
```

함수의 object 는 해당 함수 안에서만 작동하는 지역(local) 변수입니다. object 는 모든 데이터 형식(data type)을 사용할 수 있습니다.

```r
# function example - get measures of central tendency
# and spread for a numeric vector x. The user has a
# choice of measures and whether the results are printed.

mysummary <- function(x,npar=TRUE,print=TRUE) {
 if (!npar) {
   center <- mean(x); spread <- sd(x)
 } else {
   center <- median(x); spread <- mad(x)
 }
 if (print & !npar) {
   cat("Mean=", center, "\n", "SD=", spread, "\n")
 } else if (print & npar) {
   cat("Median=", center, "\n", "MAD=", spread, "\n")
 }
 result <- list(center=center,spread=spread)
 return(result)
}

# invoking the function
set.seed(1234)
x <- rpois(500, 4)
y <- mysummary(x)
Median= 4
MAD= 1.4826
# y$center is the median (4)
# y$spread is the median absolute deviation (1.4826)

y <- mysummary(x, npar=FALSE, print=FALSE)
# no output
# y$center is the mean (4.052)
# y$spread is the standard deviation (2.01927)
```

R 에서 funciton 의 코드를 보기 위해서는 function name 을 `( )` 없이 타이핑하면 됩니다. 만약 이 방법이 먹히지 않는다면 R wiki 등 구글링을 해봅시다.

자신이 만든 사용자 함수를 매번 호출해서 사용하고 싶을 수 도 있습니다. 이럴 때에는 R environment 를 설정하여 R 실행 시 불러올 수 있도록 합시다.
