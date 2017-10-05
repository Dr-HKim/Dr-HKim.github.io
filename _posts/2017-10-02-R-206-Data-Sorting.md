---
layout: post  
title: R Basic 201 Creating New Variables  
date: 2017-10-02  
category:
- Data Analysis  

tags: [R]  
published: false  
---

# Sorting Data

다음 자료를 참고하였습니다:  
- http://www.statmethods.net/management/sorting.html

# Sorting Data

To sort a data frame in R, use the order( ) function. By default, sorting is ASCENDING. Prepend the sorting variable by a minus sign to indicate DESCENDING order. Here are some examples.

```r
# sorting examples using the mtcars dataset
attach(mtcars)

# sort by mpg
newdata <- mtcars[order(mpg),]

# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),]

detach(mtcars)
```

To practice, try this sorting exercise  with the order() function.
