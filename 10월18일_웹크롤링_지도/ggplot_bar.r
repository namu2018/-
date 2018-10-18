library(ggplot2)
library(data.table)
library(dplyr)
tr<-read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월18일_웹크롤링_지도/TDAT_train_sample.csv")


dim(tr)
str(tr)
table(tr$is_attributed)

df_sel <- tr %>% select(ip, app, device, os, channel, is_attributed)
head(df_sel)

ip_is_attr <- df_sel %>% filter(!is.na(is_attributed)) %>% 
              group_by(ip) %>% summarise(sum_is_attr1=sum(is_attributed),n=n())


top10 <- ip_is_attr %>% arrange(desc(n)) %>% head(10)
top10
###pl1: 클릭수가 많은 ip주소와 클릭한 후
###pl2: 클릭수가 많은 ip주소와 실제 다운로드 수 
install.packages("gridExtra")
library(gridExtra)
top10$ip <- as.factor(top10$ip)
ggplot(top10 , aes(x=reorder(ip,n), y=n, fill=ip)) +geom_bar(stat="identity")

pl2<-ggplot(top10 , aes(x=reorder(ip,n), y=sum_is_attr1)) +geom_bar(stat="identity")
grid.arrange(pl1, pl2,ncol=2,nrow=1)
pl1
