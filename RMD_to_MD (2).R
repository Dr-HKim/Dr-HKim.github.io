require(knitr)
library(readr)

## *.Rmd 파일 불러오기
FILELIST <- list.files(path= "./", pattern = ".*.Rmd") # subdirectory 에 있는 *.Rmd 파일 리스트 작성 

for (filename in FILELIST) {
  file <- paste0(filename)
  
  ## 그림파일 경로 설정 
  fig.path <- paste0("FILES_", sub(".Rmd$", "", basename(file)), "/")
  fig.path
  
  ## Rmd -> md 변환
  opts_chunk$set(fig.path = fig.path) # 그림파일 경로 설정
  render_jekyll(highlight = "pygments")
  # opts_knit$set(base.url="/")
  opts_knit$set(base.url="")
  opts_chunk$set(cache = F, warning = F, message = F, cache.path = "_cache/", tidy = F) # suppress messages
  
  ## 파일 변환 및 경로 지정
  out.file <- basename(knit(file))
}

MD_FILELIST <- sub(".Rmd$", ".md", FILELIST)

for (md_filename in MD_FILELIST) {
  
  lines_md_filename <- read_lines(md_filename)
  
  for (i in 1:length(lines_md_filename)){
    if (startsWith(lines_md_filename[i],"![")) {
      lines_md_filename[i] <- sub("FILES_", "/_posts/FILES_", lines_md_filename[i])
    }
  }
  
  write_lines(lines_md_filename, md_filename)
}
