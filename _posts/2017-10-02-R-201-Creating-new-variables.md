---
layout: post  
title: R Basic 201 Creating New Variables  
date: 2017-10-02  
category:
- Data Analysis  

tags: [R]  
published: false  
---

# Creating new variables

다음 자료를 참고하였습니다:  
- http://www.statmethods.net/management/variables.html

# Creating new variables

Use the assignment operator <- to create new variables. A wide array of operators and functions are available here.

```r
# Three examples for doing the same computations

mydata$sum <- mydata$x1 + mydata$x2
mydata$mean <- (mydata$x1 + mydata$x2)/2

attach(mydata)
mydata$sum <- x1 + x2
mydata$mean <- (x1 + x2)/2
detach(mydata)

mydata <- transform( mydata,
sum = x1 + x2,
mean = (x1 + x2)/2
)
```

## Recoding variables

In order to recode data, you will probably use one or more of R's control structures.

```r
# create 2 age categories
mydata$agecat <- ifelse(mydata$age > 70,
c("older"), c("younger"))

# another example: create 3 age categories
attach(mydata)
mydata$agecat[age > 75] <- "Elder"
mydata$agecat[age > 45 & age <= 75] <- "Middle Aged"
mydata$agecat[age <= 45] <- "Young"
detach(mydata)
```

## Renaming variables

You can rename variables programmatically or interactively.

```r
# rename interactively
fix(mydata) # results are saved on close

# rename programmatically
library(reshape)
mydata <- rename(mydata, c(oldname="newname"))

# you can re-enter all the variable names in order
# changing the ones you need to change.the limitation
# is that you need to enter all of them!
names(mydata) <- c("x1","age","y", "ses")
```