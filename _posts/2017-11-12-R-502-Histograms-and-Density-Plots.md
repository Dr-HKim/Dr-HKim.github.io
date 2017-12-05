---
layout: post  
title: Histograms and Density Plots
date: 2017-11-12  
category:
- R for Beginners  
tag: [R]    
author: hkim  
hidden: true # don't count this post in blog pagination
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/graphs/density.html](https://www.statmethods.net/graphs/density.html)

# Histograms and Density Plots

## Histograms

You can create histograms with the function hist(x) where x is a numeric vector of values to be plotted. The option freq=FALSE plots probability densities instead of frequencies. The option breaks= controls the number of bins.

```r
# Simple Histogram
hist(mtcars$mpg)
```

simple histogram click to view

```r
# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=12, col="red")
```

colored histogram click to view

```r
# Add a Normal Curve (Thanks to Peter Dalgaard)
x <- mtcars$mpg
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
  	main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
```

histogram with normal curve click to view

Histograms can be a poor method for determining the shape of a distribution because it is so strongly affected by the number of bins used.

To practice making a density plot with the hist() function, try this exercise.


## Kernel Density Plots

Kernal density plots are usually a much more effective way to view the distribution of a variable. Create the plot using plot(density(x)) where x is a numeric vector.

```r
# Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results
```

simple density plot click to view

```r
# Filled Density Plot
d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
```

colored density plot click to view


## Comparing Groups VIA Kernal Density

The sm.density.compare( ) function in the sm package allows you to superimpose the kernal density plots of two or more groups. The format is sm.density.compare(x, factor) where x is a numeric vector and factor is the grouping variable.

```r
# Compare MPG distributions for cars with
# 4,6, or 8 cylinders
library(sm)
attach(mtcars)

# create value labels
cyl.f <- factor(cyl, levels= c(4,6,8),
  labels = c("4 cylinder", "6 cylinder", "8 cylinder"))

# plot densities
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# add legend via mouse click
colfill<-c(2:(2+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)
```

comparing densities click to view
