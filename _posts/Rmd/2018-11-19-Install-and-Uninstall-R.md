---
layout: post  
title: R 과 RStudio 설치하는 방법  
date: 2018-11-19  
category: [R for Beginners]  
tag: [R]  
author: hkim  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** (last update: 2018.11.22) 이번 포스트에서는 R 과 RStudio 를 설치하고 삭제하는 방법에 대하여 설명합니다.

## R 설치하기

먼저 R Project 홈페이지 [https://www.r-project.org/](https://www.r-project.org/) 에 접속합니다. 그리고 아래 그림과 같이 좌측에 있는 CRAN 을 클릭합니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_01.png)


CRAN Mirrors 사이트가 나옵니다. R 설치파일을 받을 수 있는 미러 사이트들입니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_02.png)

아래로 주욱 내려가 **Korea** 라고 적혀있는 곳을 찾습니다. 리스트에 나온 사이트 아무데나 들어가도 동일합니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_03.png)

우리는 윈도우에서 설치를 하는 것이니 Download R for Windows 를 클릭합니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_04.png)

base 를 클릭합니다. 처음 R을 설치할 때에는 이걸 누르라고 오른쪽 설명에도 친절하게 나와있습니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_05.png)

Download R 을 클릭해서 R 설치파일을 다운받습니다. 업데이트에 따라 R 버전이 달라질 수도 있습니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_06.png)

나중에 설명드리겠지만, 패키지에 따라서 지원하는 R 버전이 다를 수도 있습니다. 저는 다른 패키지와의 호환성을 위하여 R 3.4.4 를 사용하고 있습니다. 이전 버전의 R을 설치하려면 아래에 Previous releases 를 클릭합니다.

설치파일을 모두 다운받으면 더블클릭하여 설치합시다.


## RStudio 설치하기

R 은 그대로 사용하는 것보다 RStudio 라는 통합개발환경(Integrated Development Environment, IDE)을 많이 사용합니다. RStudio 를 설치하기 위해서는 우선 RStudio 홈페이지 [https://www.rstudio.com/](https://www.rstudio.com/) 로 갑니다. RStudio Download 를 클릭합니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_07.png)

우리가 사용할 것은 RStudio Desktop 입니다. DOWNLOAD 버튼을 클릭합니다.

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_08.png)

운영체제(OS) 별로 설치 파일 리스트가 나옵니다. 우리는 윈도우에서 R 을 설치하고 있으므로 Windows 버전을 클릭합니다. 

![ScreenClip](/assets/article_images/FILES_2018-11-19-Install-and-Uninstall-R/ScreenClip_09.png)

설치파일을 모두 다운받으면 더블클릭하여 설치합시다.


## RStudio 실행하기

RStudio 실행은 시작 > RStudio > RStudio 를 클릭하시면 됩니다.

축하합니다! R 과 RStudio 를 설치하고 RStudio 를 실행하는데 성공하셨습니다.
