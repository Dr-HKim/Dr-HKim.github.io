---
layout: post  
title: R 기초 105 데이터 출력하기 (Exporting Data)  
date: 2017-10-01  
category:
- R for Beginners
tag: [R]  
author: hkim  
---

***preface*** 이번 포스트에서는 R에서 작성한 데이터를 출력하는 방법에 대하여 설명합니다.

# Keyboard Input

다음 자료를 참고하였습니다:  
- [http://www.statmethods.net/input/exportingdata.html](http://www.statmethods.net/input/exportingdata.html)


# Exporting Data

R 데이터를 다른 형식으로 내보내는 데는 여러 가지 방법이 있습니다. SPSS, SAS 및 Stata의 경우 [foreign](https://cran.r-project.org/web/packages/foreign/index.html) 패키지가 필요합니다. Excel의 경우 [xlsReadWrite](https://cran.r-project.org/web/packages/xlsReadWrite/index.html) 패키지가 필요합니다.


## To A Tab Delimited Text File

```r
write.table(mydata, "c:/mydata.txt", sep="\t")
```

## To an Excel Spreadsheet

```r
library(xlsx)
write.xlsx(mydata, "c:/mydata.xlsx")
```

## To SPSS

```r
# write out text datafile and
# an SPSS program to read it
library(foreign)
write.foreign(mydata, "c:/mydata.txt", "c:/mydata.sps",   package="SPSS")
```


## To SAS

```r
# write out text datafile and
# an SAS program to read it
library(foreign)
write.foreign(mydata, "c:/mydata.txt", "c:/mydata.sas", package="SAS")
```

## To Stata

```r
# export data frame to Stata binary format
library(foreign)
write.dta(mydata, "c:/mydata.dta")
```
