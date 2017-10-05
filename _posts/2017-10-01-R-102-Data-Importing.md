---
layout: post  
title: R 기초 102 데이터 불러오기 (Data Importing)  
date: 2017-10-01  
category:
- Data Analysis  

tags: [R]  
published: true  
---

***preface*** 이번 포스트에서는 R에서 데이터를 불러오는 방법들에 대하여 설명합니다.

# R Cheatsheet Data Importing

다음 자료를 참고하였습니다:  
- http://www.statmethods.net/input/importingdata.html

# Importing Data

Importing data into R is fairly simple. For Stata and Systat, use the foreign package. For SPSS and SAS I would recommend the Hmisc package for ease and functionality. See the Quick-R section on packages, for information on obtaining and installing the these packages. Example of importing data are provided below.

## From A Comma Delimited Text File (CSV)

```r
# first row contains variable names, comma is separator
# assign the variable id to row names
# note the / instead of \ on mswindows systems

mydata <- read.table("c:/mydata.csv", header=TRUE, sep=",", row.names="id")

# Error: EOF within quoted string
# ";" seperated

mydata <- read.table("c:/mydata.csv", header=TRUE, sep=";", row.names=NULL, quote="", stringsAsFactors=FALSE, nrows=1000)
```

## From Excel

One of the best ways to read an Excel file is to export it to a comma delimited file and import it using the method above. Alternatively you can use the xlsx package to access Excel files. The first row should contain variable/column names.

```r
# read in the first worksheet from the workbook myexcel.xlsx
# first row contains variable names
library(xlsx)
mydata <- read.xlsx("c:/myexcel.xlsx", 1)

# read in the worksheet named mysheet
mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")
```


## From SPSS

```r
# save SPSS dataset in trasport format
get file='c:\mydata.sav'.
export outfile='c:\mydata.por'.

# in R
library(Hmisc)
mydata <- spss.get("c:/mydata.por", use.value.labels=TRUE)
# last option converts value labels to R factors
```

## From SAS

```SAS
# save SAS dataset in trasport format
libname out xport 'c:/mydata.xpt';
data out.mydata;
set sasuser.mydata;
run;
```

```r
# in R
library(Hmisc)
mydata <- sasxport.get("c:/mydata.xpt")
# character variables are converted to R factors
```

## From Stata

```r
# input Stata file
library(foreign)
mydata <- read.dta("c:/mydata.dta")
```

## From systat

```r
# input Systat file
library(foreign)
mydata <- read.systat("c:/mydata.dta")
```
