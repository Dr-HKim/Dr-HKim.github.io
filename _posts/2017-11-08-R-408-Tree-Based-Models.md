---
layout: post  
title: R 기초 408 Tree-Based Models  
date: 2017-11-08  
category: [R for Beginners]  
tag: [R, classification]    
author: hkim  
hidden: false  
image: https://upload.wikimedia.org/wikipedia/commons/f/fe/CART_tree_titanic_survivors_KOR.png  
headerImage: true  

---

***preface*** Tree-Based Models(Decision Tree, Random Forest 등)는 직관적이면서도 강력한 분석 방법입니다. 범주형 변수(categorical variable)를 대상으로 하는 classification 과 연속형 변수(continuous variable)를 대상으로 하는 regression 모두에 적용할 수 있습니다. 의사 결정 규칙을 쉽게 시각화하면서 데이터 구조를 탐색하는 데 도움이됩니다. 이번 포스트에서는 CART(Classificaiton and Regression Trees), Conditional Inference Trees, Random Forests 에 대해 간략하게 설명합니다.

**[그림: 타이타닉호 탑승객 생존여부 결정 트리]** (자료: 위키피디아)
{: .text-center }

![test_image](https://upload.wikimedia.org/wikipedia/commons/f/fe/CART_tree_titanic_survivors_KOR.png){: .image-center width="400"}

다음 자료를 참고하였습니다:  
- [https://www.statmethods.net/advstats/cart.html](https://www.statmethods.net/advstats/cart.html)
- [http://www.dodomira.com/2016/05/29/564/](http://www.dodomira.com/2016/05/29/564/)



## rpart 패키지를 이용한 CART Modeling

rpart 패키지를 이용하면 CART 분석을 실시할 수 있습니다. 일반적인 분석 과정은 다음과 같습니다.

### 1. Tree 생성하기 (Grow the Tree)

Tree 를 생성하기 위해서는 rpart 패키지의 rpart() 함수를 사용합니다.

`rpart(formula, data=, method=,control=)`

function | description
:--------|:---------------------------
formula  | is in the format
.        | outcome ~ predictor1+predictor2+predictor3+ect.
data=    | specifies the data frame
method=  | "class" 범주형 변수 (classification tree)
.        | "anova" 연속형 변수 (regression tree)
control= | optional parameters for controlling tree growth.
.        | For example, control=rpart.control(minsplit=30, cp=0.001) requires that the minimum number of observations in a node be 30 before attempting a split and that a split must decrease the overall lack of fit by a factor of 0.001 (cost complexity factor) before being attempted.


### 2. 결과 해석(Examine the results)

다음 함수를 이용하여 분석 결과를 해석할 수 있습니다.

function         | description
:----------------|:------------------------------
printcp(fit)     | display cp table
plotcp(fit)      | plot cross-validation results
rsq.rpart(fit)   | plot approximate R-squared and relative error for different splits (2 plots). labels are only appropriate for the "anova" method.
print(fit)       | print results
summary(fit)     | detailed results including surrogate splits
plot(fit)        | plot decision tree
text(fit)        | label the decision tree plot
post(fit, file=) | create postscript plot of decision tree

In trees created by `rpart( )`, move to the LEFT branch when the stated condition is true (see the graphs below).


### 3. 가지치기(prune tree)

Prune back the tree to avoid overfitting the data. Typically, you will want to select a tree size that minimizes the cross-validated error, the xerror column printed by `printcp( )`.

Prune the tree to the desired size using
`prune(fit, cp= )`

Specifically, use `printcp( )` to examine the cross-validated error results, select the complexity parameter associated with minimum error, and place it into the prune( ) function. Alternatively, you can use the code fragment

`fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"]`

to automatically select the complexity parameter associated with the smallest cross-validated error. Thanks to HSAUR for this idea.


### Example: Classification Tree

Let's use the data frame kyphosis to predict a type of deformation (kyphosis) after surgery, from age in months (Age), number of vertebrae involved (Number), and the highest vertebrae operated on (Start).

```r
# Classification Tree with rpart
library(rpart)

# grow tree
fit <- rpart(Kyphosis ~ Age + Number + Start,
  	method="class", data=kyphosis)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) # detailed summary of splits

# plot tree
plot(fit, uniform=TRUE,
  	main="Classification Tree for Kyphosis")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postscript plot of tree
post(fit, file = "c:/tree.ps",
  	title = "Classification Tree for Kyphosis")
```

cp Plot Classification Tree Classification Tree in Postscript click to view

```r
# prune the tree
pfit<- prune(fit, cp=   fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])

# plot the pruned tree
plot(pfit, uniform=TRUE,
  	main="Pruned Classification Tree for Kyphosis")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)
post(pfit, file = "c:/ptree.ps",
  	title = "Pruned Classification Tree for Kyphosis")
```

Pruned Classificaiton Tree Pruned Classification Tree in Postscript click to view


### Example: Regression Tree

In this example we will predict car mileage from price, country, reliability, and car type. The data frame is cu.summary.

```r
# Regression Tree Example
library(rpart)

# grow tree
fit <- rpart(Mileage ~ Price + Country + Reliability + Type,
   method="anova", data=cu.summary)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) # detailed summary of splits

# create additional plots
par(mfrow=c(1,2)) # two plots on one page
rsq.rpart(fit) # visualize cross-validation results  	

# plot tree
plot(fit, uniform=TRUE,
  	main="Regression Tree for Mileage ")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postcript plot of tree
post(fit, file = "c:/tree2.ps",
  	title = "Regression Tree for Mileage ")
```

cp plot for regression tree rsquare plot for regression treeregression tree Regressio Tree in Post Script click to view

```r
# prune the tree
pfit<- prune(fit, cp=0.01160389) # from cptable   

# plot the pruned tree
plot(pfit, uniform=TRUE,
  	main="Pruned Regression Tree for Mileage")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)
post(pfit, file = "c:/ptree2.ps",
  	title = "Pruned Regression Tree for Mileage")
```

It turns out that this produces the same tree as the original.


## Conditional inference trees via party

The party package provides nonparametric regression trees for nominal, ordinal, numeric, censored, and multivariate responses. party: A laboratory for recursive partitioning, provides details.

You can create a regression or classification tree via the function

`ctree(formula, data=)`

The type of tree created will depend on the outcome variable (nominal factor, ordered factor, numeric, etc.). Tree growth is based on statistical stopping rules, so pruning should not be required.

The previous two examples are re-analyzed below.

```r
# Conditional Inference Tree for Kyphosis
library(party)
fit <- ctree(Kyphosis ~ Age + Number + Start,
   data=kyphosis)
plot(fit, main="Conditional Inference Tree for Kyphosis")
```

Condiitional Inference Tree for Kyphosis click to view

```r
# Conditional Inference Tree for Mileage
library(party)
fit2 <- ctree(Mileage~Price + Country + Reliability + Type,
   data=na.omit(cu.summary))
```

Conditional Inference Tree for Mileage click to view


## Random Forests

Random forests improve predictive accuracy by generating a large number of bootstrapped trees (based on random samples of variables), classifying a case using each tree in this new "forest", and deciding a final predicted outcome by combining the results across all of the trees (an average in regression, a majority vote in classification). Breiman and Cutler's random forest approach is implimented via the randomForest package.

Here is an example.

```r
# Random Forest prediction of Kyphosis data
library(randomForest)
fit <- randomForest(Kyphosis ~ Age + Number + Start,   data=kyphosis)
print(fit) # view results
importance(fit) # importance of each predictor
```

For more details see the comprehensive Random Forest website.
