---
layout:
title: Using with( ) and by( )
date: 2017-10-31  
category:
- R for Beginners
tag: [R]   
author: hkim  
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/stats/withby.html](https://www.statmethods.net/stats/withby.html)

# Using with( ) and by( )
There are two functions that can help write simpler and more efficient code.

## With
The with( ) function applys an expression to a dataset. It is similar to DATA= in SAS.

```r
# with(data, expression)
# example applying a t-test to a data frame mydata
with(mydata, t.test(y ~ group))
```

## By
The by( ) function applys a function to each level of a factor or factors. It is similar to BY processing in SAS.

```r
# by(data, factorlist, function)
# example obtain variable means separately for
# each level of byvar in data frame mydata
by(mydata, mydata$byvar, function(x) mean(x))
```

## To Practice
This data manipulation tutorial in R includes excercises on using the by() function.
