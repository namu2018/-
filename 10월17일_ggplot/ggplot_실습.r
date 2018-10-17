dust <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월17일_ggplot/microdust.csv")
dust
str(dust)
names(dust) <- c("date", "data", "result")
dust$month <- as.factor(substring(dust$date,6,7))
str(dust)
g1<-ggplot(dust,aes(month,data))
  g1+geom_jitter(aes(color=result))+
  ggtitle("미세먼지농도 \n 광주 소방서(2017")+
    theme(plot.title=element_text(hjust=0.5, family="serif", size=15, 
                                  color="darkblue", face="bold"))+
                                       ggsave("Cars93.jpg", dpi=300)
head(dust)
    

acc <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월17일_ggplot/trafficaccident.csv")
head(acc) 
str(acc)
names(acc)<- c("road","car","acctiedt")
names(acc)
head(acc)
names(acc)<-c("road","car","accident")
names(acc)<-c("road","car","accident","die")
acc$ratio <- acc$die/acc$accident*100
names(acc)

a1 <- ggplot(acc, aes(road, accident))

a2 <- a1+geom_point(aes(size=car,color=car))+ylim(0,1000)+ggtitle("장소별 교통사고 횟수")+
  theme(plot.title=element_text(hjust=0.5, family="serif", size=15, 
                                color="darkblue", face="bold"))
a2+coord_flip()
c1 <- a1+geom_boxplot()+ylim(0,1000)+geom_jitter(aes(color=car))
c1+coord_flip()

b1 <-ggplot(acc, aes(car, accident, color=ratio))+ geom_boxplot()
b1  

