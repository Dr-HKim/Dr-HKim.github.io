---
layout:
title: Descriptive Statistics
date: 2017-10-21  
category:
- R for Beginners
tag: [R]  
author: hkim  
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/stats/descriptives.html](https://www.statmethods.net/stats/descriptives.html)

# Descriptive Statistics
R provides a wide range of functions for obtaining summary statistics. One method of obtaining descriptive statistics is to use the sapply( ) function with a specified summary statistic.

```r
# get means for variables in data frame mydata
# excluding missing values
sapply(mydata, mean, na.rm=TRUE)
```

Possible functions used in sapply include mean, sd, var, min, max, median, range, and quantile.

There are also numerous R functions designed to provide a range of descriptive statistics at once. For example

```r
# mean,median,25th and 75th quartiles,min,max
summary(mydata)

# Tukey min,lower-hinge, median,upper-hinge,max
fivenum(x)
```

Using the Hmisc package

```r
library(Hmisc)
describe(mydata)
# n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles
# 5 lowest and 5 highest scores
```

Using the pastecs package

```r
library(pastecs)
stat.desc(mydata)
# nbr.val, nbr.null, nbr.na, min max, range, sum,
# median, mean, SE.mean, CI.mean, var, std.dev, coef.var
```

Using the psych package

```r
library(psych)
describe(mydata)
# item name ,item number, nvalid, mean, sd,
# median, mad, min, max, skew, kurtosis, se
```

## Summary Statistics by Group
A simple way of generating summary statistics by grouping variable is available in the psych package.

```r
library(psych)
describe.by(mydata, group,...)
```

The doBy package provides much of the functionality of SAS PROC SUMMARY. It defines the desired table using a model formula and a function. Here is a simple example.

```r
library(doBy)
summaryBy(mpg + wt ~ cyl + vs, data = mtcars,
 	FUN = function(x) { c(m = mean(x), s = sd(x)) } )
# produces mpg.m wt.m mpg.s wt.s for each
# combination of the levels of cyl and vs
```

See also: aggregating data.

## To Practice
Want to practice interactively? Try this free course on statistics and R
