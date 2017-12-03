---
layout: post  
title: R 기초 208 데이터 합치기 (Aggregating Data)  
date: 2017-10-18  
category:
- R for Beginners
tag: [R]  
author: hkim  
---

***preface*** 이번 포스트에서는 데이터를 합치는 방법에 대하여 설명합니다.

# Aggregating Data

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/aggregate.html](http://www.statmethods.net/management/aggregate.html)

It is relatively easy to collapse data in R using one or more BY variables and a defined function.

```r
# aggregate data frame mtcars by cyl and vs, returning means
# for numeric variables
attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,vs), FUN=mean, na.rm=TRUE)
print(aggdata)
detach(mtcars)
```

When using the aggregate() function, the by variables must be in a list (even if there is only one). The function can be built-in or user provided.

See also:
- summarize() in the Hmisc package
- summaryBy() in the doBy package

## Going Further

To practice aggregate() and other functions, try the exercises  in this manipulating data tutorial.
