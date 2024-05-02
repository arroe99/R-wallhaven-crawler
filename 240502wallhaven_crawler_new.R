rm(list = ls())  # Remove all variables
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))  # Set the path to the current R script's directory
getwd()          # Check the path for saving and reading R language files

library(rvest)      # For web scraping
library(downloader) # For downloading files
library(tidyverse)  # For data manipulation

# Create the folder if it doesn't exist
filename <- "wallhaven_crawler"
if(! dir.exists(filename)){
  dir.create(filename)  
}

# Set up proxy
# install.packages("r.proxy")
r.proxy::proxy()

# Function to download pictures
downpic <- function(page) {
  baseurl <- 'https://wallhaven.cc/search?categories=111&purity=100&resolutions=1920x1080&topRange=1y&sorting=toplist&order=desc&ai_art_filter=1&page='
  url <- paste0(baseurl,page,sep='')
  # Extracting picture detail page URLs
  picture <- read_html(url) %>%
    html_nodes("a.preview") %>%
    html_attr("href") %>% print()
  
  for(i in 1:length(picture)){
    print(picture[i])
    # Extracting direct download URLs for pictures
    download_url <- read_html(picture[i]) %>%
      html_nodes('#wallpaper') %>%
      html_attr("src") %>% print()
    # Downloading pictures with appropriate file names
    download(download_url,paste(filename,"/",strsplit(download_url,'/')[[1]][6],sep = ""), mode = "wb")
    Sys.sleep(5) # Adding a delay to avoid overwhelming the server
  } 
}

page = 10  # Number of pages to scrape

# Loop through each page and download pictures
for(i in 1:page){
  downpic(i)
}
