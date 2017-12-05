---
layout: post  
title: R 기초 204 제어문 (Control Structures)  
date: 2017-10-14  
category:
- R for Beginners  
tag: [R]  
author: hkim  
---

***preface*** 이번 포스트에서는 제어문(if, while, for, switch, ifelse)을 사용하는 방법에 대하여 설명합니다.

# Control Structures: if, while, for, switch, ifelse

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/controlstructures.html](http://www.statmethods.net/management/controlstructures.html)

R 에서도 일반적인 제어문을 사용할 수 있습니다.

R has the standard control structures you would expect. expr can be multiple (compound) statements by enclosing them in braces { }. It is more efficient to use built-in functions rather than control structures whenever possible.

## if-else
```r
if (cond) {expr}
if (cond) {expr1} else {expr2}
```

## for
```r
for (var in seq) {expr}
```

## while
```r
while (cond) {expr}
```

## switch
```r
switch(expr, ...)
```

## ifelse
```r
ifelse(test,yes,no)
```

## Example
```r
# transpose of a matrix
# a poor alternative to built-in t() function

mytrans <- function(x) {
  if (!is.matrix(x)) {
    warning("argument is not a matrix: returning NA")
    return(NA_real_)
  }
  y <- matrix(1, nrow=ncol(x), ncol=nrow(x))
  for (i in 1:nrow(x)) {
    for (j in 1:ncol(x)) {
      y[j,i] <- x[i,j]
    }
  }
return(y)
}

# try it
z <- matrix(1:10, nrow=5, ncol=2)
tz <- mytrans(z)
```
