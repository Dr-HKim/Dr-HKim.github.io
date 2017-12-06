---
layout: post  
title: R 기초 202 내장 연산자들 (Built-in Operators)  
date: 2017-10-12  
category:
- R for Beginners  
tag: [R]  
author: hkim  
---

***preface*** 이번 포스트에서는 R에 내장된 연산자를 사용하는 방법에 대하여 설명합니다.

# Built-in Operators

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/operators.html](http://www.statmethods.net/management/operators.html)

R's binary and logical operators will look very familiar to programmers. Note that binary operators work on vectors and matrices as well as scalars.

## 산술연산자(Arithmetic Operators)

Operator   | Description
-----------|-------------
`+`	       | 더하기(addition)
`-`	       | 빼기(subtraction)
`*`	       | 곱하기(multiplication)
`/`	       | 나누기(division)
`^ or **`	 | 지수함수(exponentiation)
`x %% y`	 | 나눗셈의 나머지(modulus) (5%%2 is 1)
`x %/% y`  | 나눗셈의 몫(integer division) (5%/%2 is 2)


## 논리연산자(Logical Operators)

Operator    | Description
----------- |-------------
`<`	        | less than
`<=`	      | less than or equal to
`>`	        | greater than
`>=`	      | greater than or equal to
`==`	      | exactly equal to
`!=`	      | not equal to
`!x`        | Not x
`x | y` 	  | x OR y
`x & y`     | x AND y
`isTRUE(x)` | test if X is TRUE

## Examples

```r
# An example
x <- c(1:10)
x[(x>8) | (x<5)]
## 1 2 3 4 9 10

# How it works
x <- c(1:10)
x
## 1 2 3 4 5 6 7 8 9 10
x > 8
## F F F F F F F F T T
x < 5
## T T T T F F F F F F
x > 8 | x < 5
## T T T T F F F F T T
x[c(T,T,T,T,F,F,F,F,T,T)]
## 1 2 3 4 9 10
```
