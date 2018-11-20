## R Markdown 으로 Github Pages 블로깅을 하기 위해 Rmd -> md 변환하는 코드
## 참고: http://otzslayer.github.io/r/jekyll-with-R-markdown/

## jekyll 블로그 디렉토리 설정
# base <- "C:/Clouds/GitHub/Dr-HKim.github.io"
base<- "C:/DataAnalysis/MY181118_RMarkdown/RMD_to_MD"

## Rmd 파일이 저장된 디렉토리 지정
rmds <- "_Rmd"
setwd(base)

# getwd()

## Subfolder 에 있는 Rmd 파일 읽어오기
# FILELIST <- list.files(path= "./_Rmd", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성 
FILELIST <- list.files(path= "./", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성 
FILELIST

filename <- FILELIST[1]
filename

## 폴더 경로 설정
posts.path <- "_posts/R/"



# for (filename in FILELIST) {

# Rmd -> md 변환
require(knitr)
render_jekyll(highlight = "pygments")
opts_knit$set(base.url="/")

# file <- paste0("_posts/", filename)
file <- paste0(filename)
file

knit(filename)

basename(file)

file0 <- paste0(rmds, "/", filename)
file0

# 파일 경로 설정
# figs.path <- "assets/article_images/"
# fig.path <- paste0(figs.path, sub(".Rmd$", "", basename(file)), "/")
fig.path <- paste0(sub(".Rmd$", "", basename(file)), "_files", "/")
fig.path
opts_chunk$set(fig.path = fig.path)

# suppress messages
opts_chunk$set(cache = F, warning = F, message = F, cache.path = "_cache/", tidy = F)

# 파일 변환 및 경로 지정
out.file <- basename(knit(file))
file.rename(out.file, paste0(posts.path, out.file))
paste0(posts.path, out.file)
# }