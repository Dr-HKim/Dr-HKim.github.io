## R Markdown 으로 Github Pages 블로깅을 하기 위해 Rmd -> md 변환하는 코드
## 참고: http://otzslayer.github.io/r/jekyll-with-R-markdown/

## 라이브러리 불러오기
library(knitr)
library(readr)

## R Markdown 을 실행하다보면 아래와 같은 Warning message 가 뜰 때가 있다.
## Warning message:
##  In strsplit(code, "\n", fixed = TRUE) :
##  input string 1 is invalid in this locale
## 그럴 때는 아래 코드를 사용하자
# Sys.setlocale('LC_ALL','en_US.UTF-8')
Sys.setlocale('LC_ALL','C')


## jekyll 블로그 디렉토리 설정
base.dir <- "C:/Clouds/GitHub/Dr-HKim.github.io" # Windows
# base.dir <- "/Users/hkim/Documents/GitHub/Dr-HKim.github.io" # Mac

setwd(base.dir)

## Rmd 파일이 저장된 디렉토리(./_Rmd) 지정 
rmds <- "_Rmd"

## 파일 이름 지정
FILELIST <- list.files(path= "./_Rmd", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성
CONV_FILELIST <- FILELIST[1:6] # 한꺼번에 모두 하면 시간이 오래 걸리므로 변환할 파일을 따로 지정
CONV_FILELIST

for (filename in CONV_FILELIST){
  ## 폴더 경로들
  figs.path <- "assets/article_images/" # 그림이 저장될 경로
  posts.path <- "_posts/Rmd/"           # 변환된 md 파일이 저장될 경로
  
  ## Rmd -> md 변환
  render_jekyll(highlight = "pygments")
  opts_knit$set(base.url="/")
  
  file <- paste0(rmds, "/", filename)
  
  ## 파일 경로 설정
  fig.path <- paste0(figs.path, "FILES_", sub(".Rmd$", "", basename(file)), "/")
  opts_chunk$set(fig.path = fig.path)
  
  ## suppress messages
  opts_chunk$set(cache = F, warning = F, message = F, cache.path = "_cache/", tidy = F)
  
  ## 파일 변환 및 경로 지정
  out.file <- basename(knit(file)) # working directory (base.dir) 에 저장됨 
  file.rename(out.file, paste0(posts.path, out.file)) # 원하는 폴더로 이동
}

## Rmd 를 MD 로 변환한 파일에서 이미지 링크를 수정
## base 패키지에 있는 readLines() writeLines() 함수를 사용하면 한글이 깨지므로
## readr 패키지에 있는 read_lines() 와 write_lines() 함수를 사용 
MD_FILELIST <- list.files(path= "./_posts/Rmd", pattern = ".*.md") # subdirectory 에 있는 *.md 파일 리스트 작성

for (md_filename in MD_FILELIST) {
  file <- paste0("_posts/Rmd/", md_filename)
  lines_md_filename <- read_lines(file)
  
  for (i in 1:length(lines_md_filename)){
    if (startsWith(lines_md_filename[i],"![")) {
      lines_md_filename[i] <- sub("\\(FILES_", "\\(/assets/article_images/FILES_", lines_md_filename[i])
    }
  }
  write_lines(lines_md_filename, file)
}




# ## Rmd 파일을 읽고 ```r 을 ```{r} 로 변경
# Rmd_FILELIST <- list.files(path= "./_Rmd", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성
# 
# library(readr)
# for (Rmd_filename in Rmd_FILELIST[6:70]) {
#   file <- paste0("_Rmd/", Rmd_filename)
#   lines_Rmd_filename <- read_lines(file)
# 
#   for (i in 1:length(lines_Rmd_filename)){
#     if (startsWith(lines_Rmd_filename[i],"```\\{r\\}")) {
#       lines_Rmd_filename[i] <- sub("```\\{r\\}", "```\\{r, eval=FALSE\\}", lines_Rmd_filename[i])
#     }
#   }
#   write_lines(lines_Rmd_filename, file)
# }
# 
# ## Rmd 파일을 읽고 ```r 을 ```{r} 로 변경
# Rmd_FILELIST <- list.files(path= "./_Rmd", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성
# 
# library(readr)
# for (Rmd_filename in Rmd_FILELIST) {
#   file <- paste0("_Rmd/", Rmd_filename)
#   lines_Rmd_filename <- read_lines(file)
# 
#   for (i in 1:length(lines_Rmd_filename)){
#     if (startsWith(lines_Rmd_filename[i],"category:")) {
#       lines_Rmd_filename[i] <- sub("category: \\[R for Beginners\\]", "category: \\[Getting Started with R\\]", lines_Rmd_filename[i])
#     }
#   }
#   write_lines(lines_Rmd_filename, file)
# }

## Rmd 파일 이름을 수정할 때를 대비하여, 기존의 md 파일을 모두 지우는 코드 필요

## /_Rmd/ 하위폴더에 있는 그림 파일들을 /assets/article_images/ 로 복사하는 코드 필요



