---
layout: post  
title: Jekyll 및 GitHub Pages 로 블로그하기
date: 2017-06-25  
tags: [jekyll]  
published: true
---

이번 포스트에서는 윈도우 환경에서 Jekyll을 설치하는 방법을 다룹니다. 지킬(Jekyll)은 마크다운 문서로 본문 작성이 가능한 설치형 블로그로, GitHub을 이용하면 별 다른 호스팅 없이 쉽게 블로그를 개설할 수 있는 장점이 있습니다.


# Ruby 설치

우선 Ruby 를 설치해야 합니다. 아래 링크에서 시스템에 맞는 파일을 다운받아 설치합니다.

http://rubyinstaller.org/downloads/


Ruby 를 설치하고 나면 CMD 창에 Ruby Installer 2 for Windows 가 뜨면서 다음을 설치하라고 합니다. 순차적으로 설치합니다.

```
1 - MSYS2 base installation
2 - MSYS2 repository update
3 - MSYS2 and MINGW development toolchain
```

모든 설치가 종료되어도 [] 라는 형태로 선택지가 뜨는 경우 엔터를 치면 종료됩니다.


CMD 에서 다음 명령어를 실행시켜 gem 버전이 나오면 바르게 설치된 것입니다.

```
C:\Users\Username\gem -v
2.6.11
```


# Jekyll 설치

이제 지킬을 설치합니다. Ruby의 gem 패키지 인스톨러를 이용해서 다음과 같이 CMD에서 설치합시다.

```
gem install jekyll
```


# GitHub Pages 로 Jekyll 블로그 설치 및 실행

Github 에서 새로운 repository 를 만듭니다.
이때 repository name 은 USERNAME.github.io로 합니다.

CMD 상에서 설치를 원하는 폴더를 가서 다음을 입력하면 설치가 진행됩니다.

```
jekyll new USERNAME.github.io
```

...작성자의 경우 bundler 가 없다는 에러가 났습니다. CMD에서 다음을 실행합니다.

```
gem install bundler
```

다시 실행하니 설치가 되었습니다.

GitHub 와 연동한 후 USERNAME.github.io 로 들어가면 블로그가 뜨는 것을 확인할 수 있습니다.

GitHub 과 연동하는 방법에 대해서는, 다른 블로그(...)를 참고합시다.

GitHub Desktop 을 사용하면 이를 보다 쉽게 실행할 수 있습니다.
