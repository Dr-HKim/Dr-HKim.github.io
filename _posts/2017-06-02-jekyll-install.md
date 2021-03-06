---
layout: post  
title: "Jekyll 및 GitHub Pages 로 블로그하기"  
date: 2017-06-02  
category: [blog]  
tag: [jekyll]  
author: hkim   
image: https://jekyllrb-ko.github.io/img/logo-2x.png  
headerImage: true

---


***preface***  이번 포스트에서는 윈도우 환경에서 Jekyll을 설치하는 방법을 다룹니다. 지킬(Jekyll)은 마크다운 문서로 본문 작성이 가능한 설치형 블로그로, GitHub을 이용하면 별 다른 호스팅 없이 쉽게 블로그를 개설할 수 있는 장점이 있습니다.


## Ruby 설치

우선 Ruby 를 설치해야 합니다. 아래 링크에서 시스템에 맞는 파일을 다운받아 설치합니다.

[http://rubyinstaller.org/downloads/](http://rubyinstaller.org/downloads/)


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


## Jekyll 설치 및 실행

이제 지킬을 설치하고 시험적으로 실행해보겠습니다. Ruby의 gem 패키지 인스톨러를 이용해서 다음과 같이 CMD에서 jekyll 과 bundle 을 설치합니다. 설치가 모두 끝나면 jekyll 을 실시합니다.

```
C:\> gem install jekyll # jekyll 설치
C:\> gem install bundle # bundle 설치

C:\> jekyll new BLOGNAME # BLOGNAME 에 새로운 블로그 설치
C:\> cd BLOGNAME
C:\BLOGNAME\> jekyll server # jekyll 실행
```

이제 웹브라우저에서 [http://127.0.0.1:4000](http://127.0.0.1:4000) 를 입력하면 블로그가 설치된 것을 확인할 수 있습니다. 블로그 서버 종료는 `ctrl-c` 입니다.

이 블로그에서는 Jacman 테마를 사용하였습니다. 따라서 추가적인 설치 작업이 필요합니다.

```
C:\> gem install github-pages x64-mingw32 # 추가 설치
C:\BLOGNAME\> bundle exec jekyll server # 서버 실행
```

## GitHub Pages 로 Jekyll 블로그 실행

[GitHub Pages](https://pages.github.com/) 로 블로그를 발행하면 다른 호스팅 서비스 없이도 블로그 개설이 가능합니다.

GitHub 에서 새로운 repository 를 만듭니다.
이때 repository name 은 `USERNAME.github.io`로 합니다.

[GitHub Desktop](https://desktop.github.com/) 을 이용하여 새로운 repository 를 동기화하고 설치된 블로그 폴더 내용을 이곳으로 옮깁니다.

GitHub 와 연동한 후 웹브라우저에서 `USERNAME.github.io` 로 들어가면 블로그가 뜨는 것을 확인할 수 있습니다.

GitHub 과 연동하는 보다 친절하고 다양한 방법들에 대해서는, 다른 블로그(...)를 참고합시다.



## 검색 기능을 추가는 방법

다음 링크를 참고합시다:  
- [http://www.halryang.net/simple-jekyll-search/](http://www.halryang.net/simple-jekyll-search/)
- [https://imyeonn.github.io/blog/blog/30/](https://imyeonn.github.io/blog/blog/30/)
- [https://github.com/kakao/kakao.github.io](https://github.com/kakao/kakao.github.io)

1. 블로그의 `root` 폴더에 `search2.json` 과 `Simple-Jekyll-Search.sublime-project` 파일을 추가합니다.  
2. 루트 폴더 아래에 `dest` 폴더를 만들고 `jekyll-search.js` 과 `jekyll-search.min.js` 파일을 추가합니다.  
3. 루트 폴더 아래에 `_plugins` 폴더를 만들고 `simple_search_filter.rb` 파일을 추가합니다.  
4. 루트 폴더에 `search.html` 만들고 `_layout` 폴더 `default.html` 에 관련 링크를 추가합니다.  




## 포스트를 자르고 Read more... 를 추가하는 방법

`index.html` 에 다음 코드를 추가합니다:

```
{{ post.content }} # 를
{{ post.excerpt }} <a href="{{ post.url }}">Read more...</a> # 로 변경
```



## MathJax 를 이용하여 수식 표현을 가능하게 하는 방법

`post.html` 혹은 `default.html` 에 다음을 추가합니다:

```html
  <!--Enable MathJax-->
  <script type="text/x-mathjax-config">
    MathJax.Hub.Config({
      tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"] ],
        processEscapes: true
      }
    });
  </script>

  <script type="text/javascript"
      src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
  </script>
  <!--Enable MathJax-->
```

## 카테고리와 태그 기능을 사용하는 방법

다음 링크를 참고합시다:
- [https://codinfox.github.io/dev/2015/03/06/use-tags-and-categories-in-your-jekyll-based-github-pages/](https://codinfox.github.io/dev/2015/03/06/use-tags-and-categories-in-your-jekyll-based-github-pages/)
