---
layout: post  
comments: true  
title: R 기초 211 데이터 형식 변환하기 (Data Type Conversion)  
date: 2017-10-02  
category:
- R for Beginners  

tags: [R]  
published: true  
---

***preface*** 이번 포스트에서는 데이터 형식(data type)을 변환하는 방법에 대하여 설명합니다.

# Data Type Conversion

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/typeconversion.html](http://www.statmethods.net/management/typeconversion.html)

Type conversions in R work as you would expect. For example, adding a character string to a numeric vector converts all the elements in the vector to character.

Use is.foo to test for data type foo. Returns TRUE or FALSE
Use as.foo to explicitly convert it.

is.numeric(), is.character(), is.vector(), is.matrix(), is.data.frame()
as.numeric(), as.character(), as.vector(), as.matrix(), as.data.frame()

## Examples

from`\`to | to one long vector  | to matrix          | to data frame
----------|---------------------|--------------------|-----------------------
from      | c(x,y)              | cbind(x,y)         | data.frame(x,y)
vector    | -                   | rbind(x,y)         | -
from      | as.vector(mymatrix) | -                  | as.data.frame(mymatrix)
matrix    | -                   | -                  | -                        
from      | -                   | as.matrix(myframe) | -
dataframe | -                   | -                  | -

## Dates

You can convert dates to and from character or numeric data. See date values for more information.

## To Practice

To explore data types in R, try this free interactive introduction to R course.
