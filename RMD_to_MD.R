## R Markdown 으로 Github Pages 블로깅을 하기 위해 Rmd -> md 변환하는 코드
## 참고: http://otzslayer.github.io/r/jekyll-with-R-markdown/

## jekyll 블로그 디렉토리 설정
base <- "C:/Clouds/GitHub/Dr-HKim.github.io"

## Rmd 파일이 저장된 디렉토리 지정
rmds <- "_Rmd"
setwd(base)

## Subfolder 에 있는 Rmd 파일 읽어오기
FILELIST <- list.files(path= "./_Rmd", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성 

## 폴더 경로 설정
figs.path <- "assets/article_images/"
posts.path <- "_posts/R/"
require(knitr)

for (filename in FILELIST) {
  # Rmd -> md 변환
  render_jekyll(highlight = "pygments")
  opts_knit$set(base.url="/")
  file <- paste0(rmds, "/", filename)
  
  # 파일 경로 설정
  fig.path <- paste0(figs.path, sub(".Rmd$", "", basename(file)), "/")
  opts_chunk$set(fig.path = fig.path)
  
  # suppress messages
  opts_chunk$set(cache = F, warning = F, message = F, cache.path = "_cache/", tidy = F)
  
  # 파일 변환 및 경로 지정
  out.file <- basename(knit(file))
  file.rename(out.file, paste0(posts.path, out.file))
}