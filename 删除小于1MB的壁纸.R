rm(list = ls())  #删除所有变量
getwd()          #查看R语言文件的保存和读取的路径
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))  #设置路径为当前R脚本所在路径
setwd('wallhaven爬虫多页')

filelist <- dir()

for(i in 1:length(filelist)){
  pic_size <- file.size(filelist[i])/1024/1024
  if (pic_size<1)
    file.remove(filelist[i])
}