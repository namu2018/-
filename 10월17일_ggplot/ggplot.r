library(ggplot2)
dim(mtcars)

##데이터
mtcars$cyl <- factor(mtcars$cyl)
ggplot(mtcars, aes(wt,mpg))+
       geom_point(aes(color=am))+xlab("weight(1000 lbs)")

##점으로 표현해 보겠다 
p<-ggplot(mtcars, aes(wt,mpg))
q<- geom_point(aes(color=cyl))

p+geom_point(aes(color=cyl))

##모양을 표현해 보겠다
p+geom_point(aes(shape=cyl))

##크기로 표현해 보겠다
p+geom_point(aes(size=cyl))

p1<- ggplot(PlantGrowth, aes(group, weight))
p1+geom_boxplot()+ coord_flip()

##방향(색,)
library(MASS)
data("Cars93")
head(Cars93)
###x축:prince y축: Horsepower
str(Cars93)
par(mfrow=c(1,2))

p<-ggplot(Cars93, aes(Price,Horsepower ))
p+geom_point()
p+geom_point(aes(color=DriveTrain))
p+geom_jitter(aes(color=DriveTrain))
###title 정렬, 글씨체, 크기, 색상, 글씨모양(진하게)
B_plot <-p+geom_point(aes(color=DriveTrain))
B_plot + ggtitle("Plot for Cars93 \n 그림 ")+
    theme(plot.title=element_text(hjust=0.5, family="serif", size=15, 
                                  color="darkblue", face="bold"))

###xy축 타이틀 바꾸어 보기
B_plot + labs(x="최대 최소 가격 평균", y="최대마력") +
  ggtitle("Plot for Cars93 \n 그림 ")+
  theme(plot.title=element_text(hjust=0.5, family="serif", size=15, 
                                color="darkblue", face="bold"))+
                                ggsave("Cars93.jpg",dpi=300)

B_plot + lims(x=c(5,40)) 
B_plot + scale_x_continuous(breaks=seq(0,60, by=5))+
              scale_y_continuous(breaks=seq(0,320, by=50))+
                ggsave("Cars93.jpg", dpi=300)

###x축 라벨바꾸기
xlbl <-seq(0,60, by=5)
labels=paste("$",xlbl,seq="")
B_plot + scale_x_continuous(breaks=seq(0,60, by=5),
                            label=labels)+
        theme(axis.test.x=element_text(angle=90))

##범례위치 바꾸기
B_plot+theme(legend.position = "top")
B_plot+theme(legend.position=c(0.85,0.8))

###x축을 위로 옮기기
B_plot + scale_x_continuous(position = "top")

##그래프 안에 글자 넣기
##annotate(): 표시하다
B_plot + scale_x_continuous(position = "top")+
        annotate("text", x=48,y=290, label="Carnival")+
        annotate("rect", xmin=0, xmax=40, ymin=0, ymax=250, 
                 fill="skyblue", alpha=0.2)+
        annotate("text", x=10,y=240,label='***')+
        annotate("segment",x=10, xend=40,y=100,yend=250, color="black", size=1)
#X축 Y축 바꾸기
B_plot+ coord_flip()
####색이 
B_plot+scale_color_grey()

##색씌우기
B_plot+ scale_color_brewer(palette="Dark2")
B_plot+ scale_color_brewer(palette="Set2")

###직접 색깔 지정
B_plot + scale_color_manual(values=c("tan3","thistle2","violetred1"))
colors()

###테마적용 
##ggthemes
library(ggthemes)
B_plot+theme_economist()+scale_color_economist()
B_plot+theme_hc(bgcolor="darkunica")+scale_color_hc("darkunica")
