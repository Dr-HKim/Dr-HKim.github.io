---
layout: post  
title: 윈도우에서 Jekyll 설치하는 방법  
date: 2017-06-25  
tags: [jekyll]  
published: true
---

이번 포스트에서는 윈도우 환경에서 Jekyll을 설치하는 방법을 다룹니다.

지킬(Jekyll)은 마크다운 문서로 본문 작성이 가능한 설치형 블로그로, GitHub을 이용하면 별 다른 호스팅 없이 쉽게 블로그를 개설할 수 있는 장점이 있습니다.


# Jekyll 설치 방법


## Ruby 설치

우선 Ruby 를 설치해야 합니다. 아래 링크에서 시스템에 맞는 파일을 다운받아 설치합니다.

http://rubyinstaller.org/downloads/


Ruby 를 설치하고 나면 CMD 창에 Ruby Installer 2 for Windows 가 뜨면서 다음을 설치하라고 합니다. 순차적으로 설치합니다.

```
1 - MSYS2 base installation
2 - MSYS2 repository update
3 - MSYS2 and MINGW development toolchain
```

모든 설치가 종료되어도 [] 라는 형태로 선택지가 뜨는 경우 엔터를 치면 종료됩니다.


CMD 에서 다음 명령어를 실행시켜 gem 버전이 나오면 바르게 설치된 것이다.

```
C:\Users\Username\gem -v
2.6.11
```


## Jekyll 설치

이제 지킬을 설치합니다. Ruby의 gem 패키지 인스톨러를 이용해서 다음과 같이 CMD에서 설치합시다.

```
gem install jekyll
```






Github 에서 새로운 repository 를 만들자.
이때 repository name 은 [username].github.io로 한다.


CMD 상에서 설치를 원하는 폴더를 가서 다음을 입력하면 설치가 진행된다.

jekyll new [username].github.io


... bundler 가 없다는 에러가 난다. 다음을 실행한다.

gem install bundler



설치가 되었다.

Github 와 연동한 후 username.github.io 로 들어가면 블로그가 뜬다.
