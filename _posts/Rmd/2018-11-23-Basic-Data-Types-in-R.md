---
layout: post  
title: R 에서 사용하는 데이터의 종류들  
date: 2018-11-23  
category: [Getting Started with R]  
tag: [R]  
author: hkim  
hidden: false  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true
comments: true

---

***preface*** (last update: 2018.11.24) 이번 포스트에서는 R에서 사용하는 데이터의 종류들에 대하여 설명합니다.

# Basic Data Types in R

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/datatypes.html](http://www.statmethods.net/input/datatypes.html)

R 은 스칼라, 벡터 (숫자, 문자, 논리), 행렬, 데이터 프레임 및 리스트를 포함하여 다양한 데이터 유형을 사용합니다.


## Vectors

벡터는 숫자의 나열로 구성된 데이터를 말합니다. 벡터의 원소를 직접 입력할 수 있습니다. 숫자, 문자, 논리 벡터를 만들 수 있습니다.


{% highlight r %}
a <- c(1,2,5.3,6,-2,4) # numeric vector
b <- c("one","two","three") # character vector
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector

a
{% endhighlight %}



{% highlight text %}
## [1]  1.0  2.0  5.3  6.0 -2.0  4.0
{% endhighlight %}



{% highlight r %}
b
{% endhighlight %}



{% highlight text %}
## [1] "one"   "two"   "three"
{% endhighlight %}



{% highlight r %}
c
{% endhighlight %}



{% highlight text %}
## [1]  TRUE  TRUE  TRUE FALSE  TRUE FALSE
{% endhighlight %}

이미 입력된 벡터의 특정 원소를 다음과 같이 지정하여 반환할 수 있습니다.


{% highlight r %}
a[c(2,4)] # 2nd and 4th elements of vector
{% endhighlight %}



{% highlight text %}
## [1] 2 6
{% endhighlight %}

## Matrices

행렬은 숫자를 2차원으로 나열한 데이터를 말합니다. 행렬의 모든 열은 동일한 종류 (숫자, 문자 등) 및 동일한 길이를 가져야합니다. 일반적인 형식은 다음과 같습니다.


{% highlight r %}
vector <- 1:12
char_vector_rownames <- c("a","b","c")
char_vector_colnames <- c("A","B","C","D")
mymatrix <- matrix(vector, nrow=3, ncol=4, byrow=FALSE, dimnames=list(char_vector_rownames, char_vector_colnames))  

mymatrix
{% endhighlight %}



{% highlight text %}
##   A B C  D
## a 1 4 7 10
## b 2 5 8 11
## c 3 6 9 12
{% endhighlight %}

**byrow=TRUE** indicates that the matrix should be filled by rows.  
**byrow=FALSE** indicates that the matrix should be filled by columns (the default).  
**dimnames** provides optional labels for the columns and rows.  


{% highlight r %}
# generates 5 x 4 numeric matrix
y<-matrix(1:20, nrow=5,ncol=4)

y
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]    1    6   11   16
## [2,]    2    7   12   17
## [3,]    3    8   13   18
## [4,]    4    9   14   19
## [5,]    5   10   15   20
{% endhighlight %}


{% highlight r %}
# another example
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, dimnames=list(rnames, cnames))

mymatrix
{% endhighlight %}



{% highlight text %}
##    C1 C2
## R1  1 26
## R2 24 68
{% endhighlight %}

행렬의 특정 행 또는 열을 지정하여 반환할 수 있습니다.


{% highlight r %}
# generates 5 x 4 numeric matrix
x<-matrix(1:20, nrow=5,ncol=4)

x
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3] [,4]
## [1,]    1    6   11   16
## [2,]    2    7   12   17
## [3,]    3    8   13   18
## [4,]    4    9   14   19
## [5,]    5   10   15   20
{% endhighlight %}

{% highlight r %}
x[,4] # 4th column of matrix
{% endhighlight %}



{% highlight text %}
## [1] 16 17 18 19 20
{% endhighlight %}



{% highlight r %}
x[3,] # 3rd row of matrix
{% endhighlight %}



{% highlight text %}
## [1]  3  8 13 18
{% endhighlight %}



{% highlight r %}
x[2:4,1:3] # rows 2,3,4 of columns 1,2,3
{% endhighlight %}



{% highlight text %}
##      [,1] [,2] [,3]
## [1,]    2    7   12
## [2,]    3    8   13
## [3,]    4    9   14
{% endhighlight %}

## Arrays

배열(Arrays)은 행렬(Matrix)과 유사하지만 둘 이상의 차원을 가질 수 있습니다. 자세한 내용은 help(array) 를 참조하십시오.


## Data Frames

데이터 프레임은 보다 일반적인 자료 형태입니다. 각 열은 서로 다른 종류의 변수(숫자, 문자, factor 등)를 가질 수 있습니다. 이는 SAS 및 SPSS 에서의 dataset 과 유사합니다.


{% highlight r %}
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)
names(mydata) <- c("ID","Color","Passed") # variable names

mydata
{% endhighlight %}



{% highlight text %}
##   ID Color Passed
## 1  1   red   TRUE
## 2  2 white   TRUE
## 3  3   red   TRUE
## 4  4  <NA>  FALSE
{% endhighlight %}

다양한 방법으로 데이터 프레임의 특정 요소를 반환할 수 있습니다.


{% highlight r %}
mydata[2:3] # columns 2, 3 of data frame
{% endhighlight %}



{% highlight text %}
##   Color Passed
## 1   red   TRUE
## 2 white   TRUE
## 3   red   TRUE
## 4  <NA>  FALSE
{% endhighlight %}



{% highlight r %}
mydata[c("ID","Color")] # columns ID and Age from data frame
{% endhighlight %}



{% highlight text %}
##   ID Color
## 1  1   red
## 2  2 white
## 3  3   red
## 4  4  <NA>
{% endhighlight %}



{% highlight r %}
mydata$Passed # variable "Passed"" in the data frame
{% endhighlight %}



{% highlight text %}
## [1]  TRUE  TRUE  TRUE FALSE
{% endhighlight %}

## Lists

list 는 여러 요소를 순서대로 저장합니다. 여러 형태의 자료를 하나의 변수로 저장할 수 있습니다.


{% highlight r %}
# example of a list with 4 components -
# a string, a numeric vector, a matrix, and a scaler
w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)

# example of a list containing two lists
v <- c(list1,list2)
{% endhighlight %}

[[]]를 이용하여 리스트의 특정 요소를 반환할 수 있습니다.


{% highlight r %}
mylist[[2]] # 2nd component of the list
mylist[["mynumbers"]] # component named mynumbers in list
{% endhighlight %}

## Factors

명목 변수(nominal variable)는 factor 로 지정하여 분석할 수 있습니다. factor 는 명목 변수를 정수 벡터 [1, ..., k] (where k is the number of unique values in the nominal variable) 로 저장합니다.


{% highlight r %}
# variable gender with 20 "male" entries and
# 30 "female" entries
gender <- c(rep("male",20), rep("female", 30))
gender <- factor(gender)

# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable
summary(gender)
{% endhighlight %}

ordinal variable 는 factor 에 `ordered( )`를 사용하여 표현할 수 있습니다.


{% highlight r %}
# variable rating coded as "large", "medium", "small'
rating <- ordered(rating)

# recodes rating to 1,2,3 and associates
# 1=large, 2=medium, 3=small internally
# R now treats rating as ordinal
{% endhighlight %}

앞으로 실시할 퉁계 분석과 그래프 작업에서 factor 는 nominal variable 로, ordered factors 는 ordinal variable 로 사용됩니다. `factor( )` 및 `ordered( )` 함수의 옵션을 이용하여 문자에 정수를 할당하는 방법을 변경할 수 있습니다.(default 는 alphabetical) 변수 레이블(value label)을 만들기 위해 factor 를 사용할 수 있습니다.


## Useful Functions


{% highlight r %}
length(object) # number of elements or components
str(object)    # structure of an object
class(object)  # class or type of an object
names(object)  # names

c(object,object,...)       # combine objects into a vector
cbind(object, object, ...) # combine objects as columns
rbind(object, object, ...) # combine objects as rows

object     # prints the object

ls()       # list current objects
rm(object) # delete an object

newobject <- edit(object) # edit copy and save as newobject
fix(object)               # edit in place
{% endhighlight %}
