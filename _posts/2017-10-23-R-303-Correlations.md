---
layout: post  
title: Correlations
date: 2017-10-23  
category:
- R for Beginners  
tag: [R]   
author: hkim  
hidden: true # don't count this post in blog pagination  
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/stats/correlations.html](https://www.statmethods.net/stats/correlations.html)

# Correlations
You can use the cor( ) function to produce correlations and the cov( ) function to produces covariances.

A simplified format is cor(x, use=, method= ) where

Option	Description
--------|---------------
x	      | Matrix or data frame
use    	| Specifies the handling of missing data. Options are all.obs (assumes no missing data - missing data will produce an error), complete.obs (listwise deletion), and pairwise.complete.obs (pairwise deletion)
method  |  Specifies the type of correlation. Options are pearson, spearman or kendall.

```r
# Correlations/covariances among numeric variables in
# data frame mtcars. Use listwise deletion of missing data.
cor(mtcars, use="complete.obs", method="kendall")
cov(mtcars, use="complete.obs")
```

Unfortunately, neither cor( ) or cov( ) produce tests of significance, although you can use the cor.test( ) function to test a single correlation coefficient.

The rcorr( ) function in the Hmisc package produces correlations/covariances and significance levels for pearson and spearman correlations. However, input must be a matrix and pairwise deletion is used.

```r
# Correlations with significance levels
library(Hmisc)
rcorr(x, type="pearson") # type can be pearson or spearman

#mtcars is a data frame
rcorr(as.matrix(mtcars))
```

You can use the format cor(X, Y) or rcorr(X, Y) to generate correlations between the columns of X and the columns of Y. This similar to the VAR and WITH commands in SAS PROC CORR.

```r
# Correlation matrix from mtcars
# with mpg, cyl, and disp as rows
# and hp, drat, and wt as columns
x <- mtcars[1:3]
y <- mtcars[4:6]
cor(x, y)
```

## Other Types of Correlations

```r
# polychoric correlation
# x is a contingency table of counts
library(polycor)
polychor(x)

# heterogeneous correlations in one matrix
# pearson (numeric-numeric),
# polyserial (numeric-ordinal),
# and polychoric (ordinal-ordinal)
# x is a data frame with ordered factors
# and numeric variables
library(polycor)
hetcor(x)


# partial correlations
library(ggm)
data(mydata)
pcor(c("a", "b", "x", "y", "z"), var(mydata))
# partial corr between a and b controlling for x, y, z
```

## Visualizing Correlations
Use corrgram( ) to plot correlograms .

Use the pairs() or splom( ) to create scatterplot matrices.

## To Practice
Try this interactive course on correlations and regressions in R.
