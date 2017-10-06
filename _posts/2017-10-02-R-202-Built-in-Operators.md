---
layout: post  
title: R 기초 202 내장 연산자들 (Built-in Operators)  
date: 2017-10-02  
category:
- R for Beginners  

tags: [R]  
published: true  
---

***preface*** 이번 포스트에서는 R에 내장된 연산자를 사용하는 방법에 대하여 설명합니다.

# Built-in Operators

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/operators.html](http://www.statmethods.net/management/operators.html)

R's binary and logical operators will look very familiar to programmers. Note that binary operators work on vectors and matrices as well as scalars.

## Arithmetic Operators

Operator | Description
---------|-------------
+	       | addition
-	       | subtraction
*	       | multiplication
/	       | division
^ or **	 | exponentiation
x %% y	 | modulus (x mod y) (5%%2 is 1)
x %/% y	 | integer division (5%/%2 is 2)


## Logical Operators

Operator  | Description
--------- |-------------
<	        |less than
<=	      |less than or equal to
>	        |greater than
>=	      |greater than or equal to
==	      |exactly equal to
!=	      |not equal to
!x	      |Not x
x `|` y	  |x OR y
x & y	    |x AND y
isTRUE(x)	|test if X is TRUE


```r
# An example
x <- c(1:10)
x[(x>8) | (x<5)]
# yields 1 2 3 4 9 10

# How it works
x <- c(1:10)
x
1 2 3 4 5 6 7 8 9 10
x > 8
F F F F F F F F T T
x < 5
T T T T F F F F F F
x > 8 | x < 5
T T T T F F F F T T
x[c(T,T,T,T,F,F,F,F,T,T)]
1 2 3 4 9 10
```
