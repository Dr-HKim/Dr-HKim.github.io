---
layout: post  
comments: false  
title: R 기초 211 데이터 형식 변환하기 (Data Type Conversion)  
date: 2017-10-20  
category: [R for Beginners]  
tag: [R]  
author: hkim  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 데이터 형식(data type)을 변환하는 방법에 대하여 설명합니다.

# Data Type Conversion

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/management/typeconversion.html](http://www.statmethods.net/management/typeconversion.html)

R 에서는 데이터 형식을 사용합니다. 데이터프레임에서 하나의 column 은 하나의 데이터 형식을 가집니다. 예를 들어, 숫자 벡터가 들어간 column 에 문자를 입력하면 해당 colum 은 문자로 변환됩니다. is.foo() 함수는 데이터 형식이 foo 인지를 TRUE/FALSE 로 반환합니다. as.foo() 함수는 해당 데이터를 foo 형식으로 변환합니다.

```
is.numeric(), is.character(), is.vector(), is.matrix(), is.data.frame()
as.numeric(), as.character(), as.vector(), as.matrix(), as.data.frame()
```

## Examples

from`\`to      | to one long vector  | to matrix              | to data frame
---------------|---------------------|------------------------|----------------------
from vector    | c(x,y)              | cbind(x,y), rbind(x,y) | data.frame(x,y)
from matrix    | as.vector(mymatrix) | -                      | as.data.frame(mymatrix)   
from dataframe | -                   | as.matrix(myframe)     | -

## Dates

문자 혹은 숫자 데이터를 날짜 데이터로 변경할 수 있습니다. 날짜 형식의 데이터를 다루는 방법은 [여기](https://dr-hkim.github.io/R-110-Date-Values/)를 참고합시다.
