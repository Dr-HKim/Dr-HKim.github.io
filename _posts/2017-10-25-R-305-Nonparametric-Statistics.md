---
layout: post  
title: Nonparametric Tests of Group Differences
date: 2017-10-25  
category:
- R for Beginners  
tag: [R]   
author: hkim  
hidden: true # don't count this post in blog pagination  
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/stats/nonparametric.html](https://www.statmethods.net/stats/nonparametric.html)

# Nonparametric Tests of Group Differences
R provides functions for carrying out Mann-Whitney U, Wilcoxon Signed Rank, Kruskal Wallis, and Friedman tests.

```r
# independent 2-group Mann-Whitney U Test
wilcox.test(y~A)
# where y is numeric and A is A binary factor

# independent 2-group Mann-Whitney U Test
wilcox.test(y,x) # where y and x are numeric

# dependent 2-group Wilcoxon Signed Rank Test
wilcox.test(y1,y2,paired=TRUE) # where y1 and y2 are numeric

# Kruskal Wallis Test One Way Anova by Ranks
kruskal.test(y~A) # where y1 is numeric and A is a factor

# Randomized Block Design - Friedman Test
friedman.test(y~A|B)
# where y are the data values, A is a grouping factor
# and B is a blocking factor
```

For the wilcox.test you can use the alternative="less" or alternative="greater" option to specify a one tailed test.

Parametric and resampling alternatives are available.

The package pgirmess provides nonparametric multiple comparisons. (Note: This package has been withdrawn but is still available in the CRAN archives.)

```r
library(npmc)
npmc(x)
# where x is a data frame containing variable 'var'
# (response variable) and 'class' (grouping variable)
```

## Visualizing Results
Use box plots or density plots to visual group differences.

## To Practice
This interactive example allows you to practice the Wilcoxon Signed Rank test with R.
