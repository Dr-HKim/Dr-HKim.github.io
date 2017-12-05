---
layout:
title: Frequencies and Crosstabs
date: 2017-10-22  
category:
- R for Beginners
tag: [R]  
author: hkim  
---

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/stats/frequencies.html](https://www.statmethods.net/stats/frequencies.html)

# Frequencies and Crosstabs
This section describes the creation of frequency and contingency tables from categorical variables, along with tests of independence, measures of association, and methods for graphically displaying results.

## Generating Frequency Tables
R provides many methods for creating frequency and contingency tables. Three are described below. In the following examples, assume that A, B, and C represent categorical variables.

## table
You can generate frequency tables using the table( ) function, tables of proportions using the prop.table( ) function, and marginal frequencies using margin.table( ).

```r
# 2-Way Frequency Table
attach(mydata)
mytable <- table(A,B) # A will be rows, B will be columns
mytable # print table

margin.table(mytable, 1) # A frequencies (summed over B)
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable) # cell percentages
prop.table(mytable, 1) # row percentages
prop.table(mytable, 2) # column percentages
```

table( ) can also generate multidimensional tables based on 3 or more categorical variables. In this case, use the ftable( ) function to print the results more attractively.

```r
# 3-Way Frequency Table
mytable <- table(A, B, C)
ftable(mytable)
```

Table ignores missing values. To include NA as a category in counts, include the table option exclude=NULL if the variable is a vector. If the variable is a factor you have to create a new factor using `newfactor <- factor(oldfactor, exclude=NULL)`.

## xtabs

The `xtabs( )` function allows you to create crosstabulations using formula style input.

```r
# 3-Way Frequency Table
mytable <- xtabs(~A+B+c, data=mydata)
ftable(mytable) # print table
summary(mytable) # chi-square test of indepedence
```

If a variable is included on the left side of the formula, it is assumed to be a vector of frequencies (useful if the data have already been tabulated).

## Crosstable

The `CrossTable( )` function in the gmodels package produces crosstabulations modeled after `PROC FREQ`in SAS or `CROSSTABS` in SPSS. It has a wealth of options.

```r
# 2-Way Cross Tabulation
library(gmodels)
CrossTable(mydata$myrowvar, mydata$mycolvar)
```

There are options to report percentages (row, column, cell), specify decimal places, produce Chi-square, Fisher, and McNemar tests of independence, report expected and residual values (pearson, standardized, adjusted standardized), include missing values as valid, annotate with row and column titles, and format as SAS or SPSS style output!
See help(CrossTable) for details.


# Tests of Independence

## Chi-Square Test

For 2-way tables you can use `chisq.test(mytable)` to test independence of the row and column variable. By default, the p-value is calculated from the asymptotic chi-squared distribution of the test statistic. Optionally, the p-value can be derived via Monte Carlo simultation.

## Fisher Exact Test
`fisher.test(x)` provides an exact test of independence. x is a two dimensional contingency table in matrix form.

## Mantel-Haenszel test
Use the `mantelhaen.test(x)` function to perform a Cochran-Mantel-Haenszel chi-squared test of the null hypothesis that two nominal variables are conditionally independent in each stratum, assuming that there is no three-way interaction. x is a 3 dimensional contingency table, where the last dimension refers to the strata.

# Loglinear Models
You can use the `loglm( )` function in the MASS package to produce log-linear models. For example, let's assume we have a 3-way contingency table based on variables A, B, and C.

```r
library(MASS)
mytable <- xtabs(~A+B+C, data=mydata)
```

We can perform the following tests:

Mutual Independence: A, B, and C are pairwise independent.

```r
loglm(~A+B+C, mytable)
```

Partial Independence: A is partially independent of B and C (i.e., A is independent of the composite variable BC).

```r
loglin(~A+B+C+B*C, mytable)
```

Conditional Independence: A is independent of B, given C.

```r
loglm(~A+B+C+A*C+B*C, mytable)
```

No Three-Way Interaction

```r
loglm(~A+B+C+A*B+A*C+B*C, mytable)
```

Martin Theus and Stephan Lauer have written an excellent article on Visualizing Loglinear Models, using mosaic plots.

# Measures of Association
The `assocstats(mytable)` function in the vcd package calculates the phi coefficient, contingency coefficient, and Cramer's V for an rxc table. The `kappa(mytable)` function in the vcd package calculates Cohen's kappa and weighted kappa for a confusion matrix. See Richard Darlington's article on Measures of Association in Crosstab Tables for an excellent review of these statistics.

# Visualizing results
Use bar and pie charts for visualizing frequencies in one dimension.

Use the vcd package for visualizing relationships among categorical data (e.g. mosaic and association plots).

Use the ca package for correspondence analysis (visually exploring relationships between rows and columns in contingency tables).

To practice making these charts, try the data visualization course at DataCamp.

# Converting Frequency Tables to an "Original" Flat file
Finally, there may be times that you wil need the original "flat file" data frame rather than the frequency table. Marc Schwartz has provided code on the Rhelp mailing list for converting a table back into a data frame.
