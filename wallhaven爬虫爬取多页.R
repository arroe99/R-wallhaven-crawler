rm(list = ls())  #删除所有变量
getwd()          #查看R语言文件的保存和读取的路径
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))  #设置路径为当前R脚本所在路径

library(rvest)
library(downloader)
library(tidyverse)
library(stringr)

filename <- "wallhaven爬虫多页"
if(! dir.exists(filename)){
  dir.create(filename)
}

downpic <- function(page) {
  baseurl <- 'https://wallhaven.cc/search?categories=010&purity=100&resolutions=1920x1080&topRange=1y&sorting=toplist&order=desc&page='
  url <- paste0(baseurl,page,sep='')
  #图片详情页网址
  picture <- read_html(url) %>%
    html_nodes("a.preview") %>%
    html_attr("href") %>% print()
  
  for(i in 1:length(picture)){
    print(picture[i])
    download_url <- read_html(picture[i]) %>%
      html_nodes('#wallpaper') %>%
      html_attr("src") %>% print()
    download(download_url,paste(filename,"/",strsplit(download_url,'/')[[1]][6],sep = ""), mode = "wb")
    Sys.sleep(5)
  } 
}

page=10
for(i in 1:page){
  downpic(i)
}