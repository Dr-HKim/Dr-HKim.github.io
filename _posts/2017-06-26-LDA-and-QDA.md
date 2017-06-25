---
layout: post  
title: LDA (Linear Discriminant Analysis) and QDA (Quadratic Discriminant Analysis)  
date: 2017-06-26  
tags: [supervised, classification, demension reduction]  
published: true  
---

이번 포스트에서는 분류classification 방법론 가운데 하나인 LDA (Linear Discriminant Analysis) 와 QDA (Quadratic Discriminant Analysis) 에 대하여 설명합니다. 분류classification란 A 그룹과 B 그룹으로 분류된 데이터가 있을 때, 새로 관측된 데이터가 어느 그룹에 속할지 추정하는 것을 말합니다.

# 알고리즘

다음 자료를 참고하였습니다:  
James, et. al. "An Introduction to Statistical Learning with Application in R" (이하 ISLR)

## LDA (Linear Discriminant Analysis)

LDA 란 Lable(Target 값)을 가지고 있는 데이터에 대하여 클래스들 사이의 차별적인 정보를 최대한 보존하면서 차원을 축소하는 기법을 말합니다.

*Bayes' theorem* 을 이용하여 $Pr \left( X = x | Y = k \right)$ 를 \\( Pr \left( X = x | Y = k \right) \\) 를 계산하는 것이 목적입니다.

$\pi_k$ : *prior* probability

$f_{k} \left( X \right)$ : the *density function* of $X$ given that $Y = k$

$f_{k} \left( X \right) \equiv \Pr \left( X = x | Y = k \right)$

*Bayes' theorem* 에 따라 사후확률(*posterior* probability)은 다음과 같이 정의됩니다.

(ISLR eq 4.10):

$$
\Pr \left( Y = k | X = x \right) = \frac{\pi_{k} f_{k} \left( x \right) }{ \Sigma _{l=1} ^{K} \pi_{l} f_{l} \left( x \right)}
$$

$p_{k} \left( x \right) = \Pr \left( Y = k | X = x \right)$ 를 찾는 것을 목적으로 합니다.

### p = 1 인 경우

$f_{k} \left( X \right)$ 가 *normal* 분포라고 가정한다면, 설명변수가 하나일 때($p=1$) 확률밀도함수는 다음과 같습니다.

(ISLR eq 4.11):

$$
f_{k} \left( x \right) = \frac{1}{ \sqrt{2\pi} \sigma_{k} } \exp \left( - \frac{1}{2\sigma_{k}^{2}} \left( x - \mu_{k} \right)^{2} \right)
$$

여기에 추가로 모든 클래스의 분산이 동일하다고 가정합시다. ($\sigma_1^2 = \ ... \ = \sigma_k^2$)

이렇게 정의된 $f_{k} \left( X \right)$ 를 (ISLR eq 4.10)에 대입하면 다음과 같습니다.

(ISLR eq 4.12):

$$
p_{k} \left( x \right) = \frac { \pi_{k} \frac{1}{ \sqrt{2\pi} \sigma } \exp \left( - \frac{1}{2\sigma^{2}} \left( x - \mu_{k} \right)^{2} \right) } { \Sigma_{l=1}^{K} \pi_{l} \frac{1}{ \sqrt{2\pi} \sigma } \exp \left( - \frac{1}{2\sigma^{2}} \left( x - \mu_{l} \right)^{2} \right) }
$$

(ISLR eq 4.12) 에 로그를 취하고 정리하면, 결국 다음 식에 따라 분류하는 것과 같아진다는 것을 확인할 수 있습니다.

(ISLR eq 4.13):

$$
\delta_{k} \left( x \right) = x \frac{\mu_k}{\sigma^2} - \frac{\mu_k^2}{2\sigma^2} + \log \left( \pi_k \right)
$$

$K=2$ 이고 $\pi_1=\pi_2$ 일 때, $2x \left( \mu_1 - \mu_2 \right) > \mu_1^2 - \mu_2^2$ 이면 1로 분류하고 그 외의 경우 2로 분류합니다. 따라서 Bayes decision boundary 는 다음과 같이 결정됩니다.

(ISLR eq 4.14):

$$
x = \frac{\mu_1^2 - \mu_2^2}{2\left( \mu_1 - \mu_2 \right)} = \frac{\mu_1+\mu_2}{2}
$$

하지만 실제로는 $\pi_k$ , $\mu_k$ , $\sigma^2$ 를 모르므로 다음과 같이 계산합니다.

(ISLR eq 4.15):

$$
\hat{\mu}_k = \frac{1}{n_k} \Sigma_{i:y_i=k} x_i
$$

$$
\hat{\sigma}^2 = \frac{1}{n-K} \Sigma_{k=1}^{K} \Sigma_{i:y_i=k} \left( x_i - \hat{\mu}_k \right) ^2
$$

(ISLR eq 4.16):

$$
\hat{\pi}_k = \frac{n_k}{n}
$$

(ISLR eq 4.17):

$$
\hat{\delta}_k \left( x \right) = x \cdot \frac{\hat{\mu}_k}{\hat{\sigma}^2} - \frac{\hat{\mu}_k^2}{2 \hat{\sigma}^2} + \log \left( \hat{\pi}_k \right)
$$

### p > 1 인 경우

설명변수가 2개 이상($p>1$)인 경우입니다. 즉, $X = \left( X_1, X_2, ... , X_p \right)$ 가 multivariate normal distribution 을 따르는 경우를 말합니다.

(ISLR eq 4.18):

$$
f \left( x \right) = \frac{1}{\left( 2\pi \right) ^{p/2} \left| \Sigma \right| ^ {1/2}} \exp \left( - \frac{1}{2} \left( x - \mu \right)^T \Sigma^{-1} \left( x - \mu \right)  \right)
$$

(ISLR eq 4.19):

$$
\delta_k \left( x \right) = x^T \Sigma^{-1} \mu_k - \frac{1}{2} \mu_k^T \Sigma^{-1} \mu_k + \log \pi_k
$$

Bayes decision boundaries 는 다음과 같이 $\delta_k \left( x \right) = \delta_l \left( x \right)$ 을 만족하는 지점입니다.

(ISLR eq 4.20):

$$
x^T \Sigma^{-1} \mu_k - \frac{1}{2} \mu_k^T \Sigma^{-1} \mu_k =
x^T \Sigma^{-1} \mu_l - \frac{1}{2} \mu_l^T \Sigma^{-1} \mu_l
$$

## QDA (Quadratic Discriminant Analysis)

(ISLR eq 4.23):

$$\begin{eqnarray*}
\delta_k \left( x \right)
& = & - \frac{1}{2} \left( x - \mu_k \right) ^T \Sigma^{-1} \left( x - \mu_k \right) + \log \pi_k \\
& = & - \frac{1}{2} x^T \Sigma_k^{-1} x + x^T \Sigma_k^{-1} \mu_k - \frac{1}{2} \mu_k^T \Sigma_k^{-1} \mu_k + \log \pi_k
\end{eqnarray*}$$


---
$$
S_{W}=\sum_{Class \ C} \sum P_{c}\left( x_{i}-\mu _{c}\right) \left( x_{i}-\mu _{c}\right) ^{T}
$$

$$
S_{B}=\sum_{Class \ C} \left( \mu_{c} - \mu \right) \left( \mu_{c} - \mu \right)^{T}
$$

$$
max \frac{S_{B}}{S_{W}}
$$

S_B: cluster 간의 거리는 최대로
S_W: 그룹 내에서의 거리는 최소로

u: 전체 평균
u_c: 그룹(class)의 평균
P_c: Class 가 나타날 최대 확률
W: Transition Matrix

import sklearn 을 쓰지 않고 굳이
from sklearn import datasets 라고 쓰는 이유가 있나?
---
