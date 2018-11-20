# jekyll 블로그 디렉토리 설정
base.dir <- "C:/Clouds/GitHub/Dr-HKim.github.io"
setwd(base.dir)

# Rmd 파일이 저장된 디렉토리 지정
rmds <- "_Rmd"

# 파일 이름 지정
# filename <- "2016-01-17-test.Rmd"
FILELIST <- list.files(path= "./_Rmd", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성
# filename <- FILELIST[2]

for (filename in FILELIST){
  # 폴더 경로들
  figs.path <- "assets/article_images/"
  posts.path <- "_posts/Rmd/"
  
  # Rmd -> md 변환
  require(knitr)
  render_jekyll(highlight = "pygments")
  opts_knit$set(base.url="/")
  
  file <- paste0(rmds, "/", filename)
  file
  
  ### 파일 경로 설정
  fig.path <- paste0(figs.path, "FILES_", sub(".Rmd$", "", basename(file)), "/")
  opts_chunk$set(fig.path = fig.path)
  
  ### suppress messages
  opts_chunk$set(cache = F, warning = F, message = F, cache.path = "_cache/", tidy = F)
  
  ### 파일 변환 및 경로 지정
  out.file <- basename(knit(file)) # working directory (base.dir) 에 저장됨 
  file.rename(out.file, paste0(posts.path, out.file)) # 원하는 폴더로 이동
}

library(readr)
MD_FILELIST <- list.files(path= "./_posts/Rmd", pattern = ".*.md") # subdirectory 에 있는 *.Rmd 파일 리스트 작성

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
