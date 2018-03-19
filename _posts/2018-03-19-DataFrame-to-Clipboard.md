---
layout: post  
title: R 데이터 클립보드에 붙이기 (DataFrame to Clipboard)  
date: 2018-03-19  
category: [Data Analysis]  
tag: [R]  
author: hkim  
hidden: false # don't count this post in blog pagination  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 R 데이터를 클립보드로 붙이는 방법에 대하여 알아봅니다.


```r
write.table(MYDATA, "clipboard", sep="\t", row.names=TRUE) # 데이터프레임을 엑셀에 붙여넣을 수 있게 클립보드로 복사
```
