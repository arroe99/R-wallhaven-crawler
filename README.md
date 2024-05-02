# R-wallhaven-crawler  

**Instructions:**

1.Download the script "240502wallhaven_crawler_new.R".  
2.Download the relevant packages used.  
3.Change the parameter "page = 10" to the desired number of pages to download.  
4.Run all to start the process.  

-----
20220913  
R语言爬虫从[壁纸网站](https://wallhaven.cc/)获取壁纸，初始网页限定了“Anime”和“1920*1080”   
先试着爬了一页     
然后封装成函数，设定page可以爬取任意页数   
最后删掉存储空间小于1MB的壁纸  

-----

20231113  
之前就用了rvest包解析网址，得到壁纸的url就很简单的download了。  
现在网站从静态变成了动态，这份代码已经用不了了。  
啥时候研究一下，更新一下代码。

----

2024.5.2 update  
最近很空，想换换壁纸，就研究了一下。  
原来网站没有变成动态，滚动条往下拉的话page参数还是会增加的，这样其实原本的脚本不需要修改。  
但是运行了一下，解析网址的时候报错timeout了，解决方法是在脚本中设置代理即可（首先要开着梯子） 
```r
# Set up proxy
# install.packages("r.proxy")
r.proxy::proxy()
```
