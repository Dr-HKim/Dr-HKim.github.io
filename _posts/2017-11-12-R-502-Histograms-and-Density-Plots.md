---
layout: post  
title: Histograms and Density Plots
date: 2017-11-12  
category: [R for Beginners]  
tag: [R]  
author: hkim  
hidden: false # don't count this post in blog pagination  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/graphs/density.html](https://www.statmethods.net/graphs/density.html)

## Histograms

R 에서 숫자 벡터(numeric vector) x 에 대한 히스토그램을 그리려면 `hist(x)` 함수를 이용합니다. `freq=FALSE` 옵션을 사용하면 빈도수 대신 비율을 사용합니다. `breaks=` 옵션을 사용하여 구간을 몇개로 나눌 것인지 결정할 수 있습니다.

### Simple Histogram

```r
# Simple Histogram
hist(mtcars$mpg)
```

![simple histogram](https://www.statmethods.net/graphs/images/histogram1.jpg){: .image-center width="400"}

### Colored Histogram

```r
# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=12, col="red")
```

![colored histogram](https://www.statmethods.net/graphs/images/histogram2.jpg){: .image-center width="400"}

### Histogram with Normal Curve

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

![histogram with normal curve](https://www.statmethods.net/graphs/images/histogram3.jpg){: .image-center width="400"}




## Kernel Density Plots

히스토그램은 구간을 몇개로 나누느냐에 따라 그래프 모양이 결정되므로, 이것만으로 분포 형태를 결정하는 것은 좋은 방법이 아닙니다. Kernel Density Plots 를 사용하면 변수의 분포를 보다 효과적으로 살펴볼 수 있습니다. `plot(density(x))` 함수를 사용하면 그래프를 그릴 수 있습니다.

### Simple Density Plot

```r
# Kernel Density Plot
d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results
```
![simple density plot](https://www.statmethods.net/graphs/images/density1.jpg){: .image-center width="400"}

### Colored Density Plot

```r
# Filled Density Plot
d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
```
![colored density plot](https://www.statmethods.net/graphs/images/density2.jpg){: .image-center width="400"}


## Comparing Groups VIA Kernal Density

sm 패키지의 `sm.density.compare( )` 함수를 이용하면 그룹 별 kernal density plot 을 그릴 수 있습니다. `sm.density.compare(x, factor)` 형식으로 사용하며 x 는 숫자형 벡터(numeric vector), factor 는 grouping variale 입니다.

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
![comparing densities](https://www.statmethods.net/graphs/images/density3.png){: .image-center width="400"}
