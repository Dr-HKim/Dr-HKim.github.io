---
layout: post  
title: "R 마크다운(R Markdown)으로 블로그하는 방법"  
date: 2018-11-18  
category: [blog]  
tag: [R, jekyll]  
author: hkim   
image: /assets/images/icon/iconmonstr-monitoring-6-240.png  
headerImage: true
comments: true

---

***preface*** (last update: 2018.11.24) 이번 포스트에서는 R 마크다운(R Markdown)을 이용하여 블로깅하는 방법을 알아보겠습니다. 


마크다운(Markdown)은 마크업 언어의 일종으로, 텍스트 안에서 헤더(header)나 코드블럭(codeblock)을 지정할 수 있는 등 작성자 입장에서 편리할 뿐만 아니라 읽기도 쉽다는 장점을 가지고 있습니다.

R 마크다운(R Markdown)은 마크다운 언어에 R 기능을 추가한 것으로, 코드블럭에 R 코드를 넣는 것 뿐만 아니라 실행(!)한 결과를 함께 보여줄 수 있습니다. R마크다운에 대한 더 자세한 설명은 [http://rmarkdown.rstudio.com](http://rmarkdown.rstudio.com) 을 참고하세요.


R 마크다운에서는 R 코드를 입력하면 아래와 같이 코드 실행 결과도 함께 표시할 수 있습니다.


{% highlight r %}
summary(cars)
{% endhighlight %}



{% highlight text %}
##      speed           dist       
##  Min.   : 4.0   Min.   :  2.00  
##  1st Qu.:12.0   1st Qu.: 26.00  
##  Median :15.0   Median : 36.00  
##  Mean   :15.4   Mean   : 42.98  
##  3rd Qu.:19.0   3rd Qu.: 56.00  
##  Max.   :25.0   Max.   :120.00
{% endhighlight %}

R 코드로 그린 그래프도 따로 그림으로 저장해서 불러오는 과정 없이 본문 중에 삽입할 수 있습니다. 아래 예시에서는 `echo=FALSE` 옵션을 사용해 그림을 그리는 R 코드를 표시하지 않았습니다.

![plot of chunk unnamed-chunk-2](/assets/article_images/FILES_2018-11-18-Blog-with-RMD/unnamed-chunk-2-1.png)


물론 일반적인 마크다운과 같이 그림을 삽입할 수도 있습니다. 

![test](/assets/article_images/FILES_2018-11-18-Blog-with-RMD/e49800898d2f9707b169a87227fef51e.jpg)

