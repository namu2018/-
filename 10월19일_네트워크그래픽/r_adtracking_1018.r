library(ggplot2)
library(data.table)
library(dplyr)

rm(list=ls())

setwd("E:/BigData3/dataset/adtracking")
tr = read.csv("TDAT_train_sample.csv")
dim(tr)
names(tr)
table(tr$is_attributed)

df_sel <- tr %>% select(ip, app, device, os, channel, is_attributed)
head(df_sel, 20)

## 상위 10개 ip 확인해보자.
ip_is_attr <- df_sel %>% 
              filter( !is.na(is_attributed)) %>%
              group_by(ip) %>%
              summarise(sum_is_attr1=sum(is_attributed) , cnt=n())

ip_is_attr

library(RColorBrewer)
### 
top10 <-  ip_is_attr %>%
           arrange(desc(cnt)) %>%
            head(10)

top10$ip = as.factor(top10$ip)
# pl1 : 클릭수가 많은 ip 주소와 클릭한 수
# pl2 : 클릭수가 많은 ip 주소와 실제 다운로드 수 
p1 = ggplot(data=top10, aes(x=reorder(ip, cnt), y= cnt, fill=ip)) + 
         geom_bar(stat="identity" )

pl1 = p1 +  coord_flip()


p2 = ggplot(data=top10, aes(x=reorder(ip, cnt), y= sum_is_attr1 )) + 
  geom_bar(stat="identity")
pl2 = p2 +  coord_flip()
#install.packages("gridExtra")
library(gridExtra)

grid.arrange(pl1, pl2, ncol=2, nrow=1)

