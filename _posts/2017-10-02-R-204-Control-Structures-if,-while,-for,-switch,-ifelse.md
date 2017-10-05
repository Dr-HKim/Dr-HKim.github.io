---
layout: post  
title: R Basic 201 Creating New Variables  
date: 2017-10-02  
category:
- Data Analysis  

tags: [R]  
published: false  
---

# R Cheatsheet Control Structures: if, while, for, switch, ifelse

다음 자료를 참고하였습니다:  
- http://www.statmethods.net/management/controlstructures.html

# Control Structures: if, while, for, switch, ifelse

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
