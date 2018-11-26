---
layout: post  
title: 오프라인 환경에서 R 패키지 설치하는 방법 
date: 2018-11-27  
category: [Getting Started with R]  
tag: [R]  
author: hkim  
hidden: false    
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true
comments: true

---

***preface*** (last update: 2018.11.27) 이번 포스트에서는 오프라인 환경에서 R 패키지를 설치하는 방법에 대하여 설명합니다.

많은 기업 및 기관들이 보안 강화를 위하여 업무전산망을 사용하는 업무용PC와 외부 인터넷을 사용하는 인터넷용PC를 분리하는 이른바 망분리 솔루션을 사용합니다. 업무용PC에 R 을 설치하기 위해서는 우선 인터넷용PC를 통해 R 과 RStudio 를 다운받고 설치해야 합니다.[참고](https://dr-hkim.github.io/Install-R-and-RStudio/) 

# Install Packages without Internet Connection

R 의 강력함은 수많은 패키지에서 나오지만, 오프라인에서 패키지를 설치하려면 여간 힘든 것이 아닙니다. 예를 들어, 데이터 시각화 패키지  `ggplot2`를 설치하기 위해서는 `digest`, `grid`, `gtable` 등의 관련 패키지 설치가 필요합니다. 이때 아래와 같은 코드를 실행하면 이 과정을 자동으로 진행할 수 있습니다.


## 인터넷용PC에서 

먼저 원하는 패키지의 설치를 위해 관련 패키지 정보를 얻습니다.


{% highlight r %}
## 관련 패키지에 대한 정보를 얻는 함수
getDependencies <- function(packs){
  dependencyNames <- unlist(
    tools::package_dependencies(packages = packs, db = available.packages(), 
                                which = c("Depends", "Imports"),
                                recursive = TRUE))
  packageNames <- union(packs, dependencyNames)
  packageNames
}

## 설치하고 싶은 패키지를 입력하면 관련 패키지를 모두 저장
packages <- getDependencies(c("ggplot2","dplyr"))
{% endhighlight %}

관련 패키지를 모두 다운받고 리스트를 `.csv` 파일로 저장합니다.


{% highlight r %}
## 패키지 파일을 저장할 위치를 working directory 로 설정
setwd("D:/MYFOLDER/")

## packages 에 리스트 된 패키지를 working directory 에 저장
pkgInfo <- download.packages(pkgs = packages, destdir = getwd(), type = "win.binary")

## package file 이름을 pkgFilenames.csv 파일에 저장 
write.csv(file = "pkgFilenames.csv", basename(pkgInfo[, 2]), row.names = FALSE)
{% endhighlight %}

그럼 usb나 망간자료전송 등을 이용하여 working drectory 에 저장된 패키지 설치 파일들과 이들의 리스트인 `pkgFilenames.csv` 파일을 업무용PC(오프라인)로 옮깁니다.


## 업무용PC(오프라인)에서 

R 과 RStudio 는 다운받은 설치파일을 usb 등으로 옮겨서 설치합니다.[참고](https://dr-hkim.github.io/Install-R-and-RStudio/) 

RStudio 에서 다음 코드를 실행하면 관련된 모든 패키지를 설치할 수 있습니다.


{% highlight r %}
## 패키지 파일이 있는 폴더의 위치를 working directory 로 설정
setwd("D:/MYFOLDER/")

## `pkgFilenames.csv` 로부터 패키지 리스트를 읽고 설치
pkgFilenames <- read.csv("pkgFilenames.csv", stringsAsFactors = FALSE)[, 1]
install.packages(pkgFilenames, repos = NULL, type = "win.binary")
{% endhighlight %}

