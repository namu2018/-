##데이터 만들기
runif(10)
rnorm(100) ##정규분포 따르는 난수 100개 생성 ,평균과 표준편차 (default는 0 ,1)
x1=rnorm(100)
x1

###하나의 개체에 그래프를 여러개 표시하기 
### mar(여백) margine
## mar=c(아래, 왼, 위,오)
par(mar=c(0,5,3,3))
x1=rnorm(100)
density(x1)
plot(density(x1),ylim=c(0,1), las=1, lwd=4)

### 데이터 값 4000개 평균이 100, 표준편자 30인 난수 
lxos = rnorm(4000, mean=100, sd=30)
hist(lxos, xlim=c(0,300), col=rgb(1,0,0,0.5), breaks=30)
hist(lxos, xlim=c(0,300), col=rgb(126,0,0,max=126), breaks=30, yaxt='n')

#범례 - 위치, 크기, 기호(pch), 색, 종류 
legend("topright", pt.cex=2, pch=15, legend=c("lxos","primadur"), col=c(rgb(1,0,0,0.5),rgb(1,0,1,0.5)))


##Create data
names=c(rep("A",80), rep("B",50),rep("c",70))
a1=rnorm(80,mean=10,sd=9)
a2=rnorm(50,mean=2,sd=15)
a3=rnorm(70,mean=30, sd=10)
value=c(a1,a2,a3)
data=data.frame(names,value)

boxplot(data$value ~ data$names, col=terrain.colors(4))

seq(4,15,by=2)
seq(1,100,by=2)

###저수순 함수 중에 text(x위치, y위치, 글자및 내용)
text(1,20,"point")

###샘플 
sample=sample(1:100, 15, replace=T)

##회귀분석
abline(v=c(4.9,9.7),col="gray")

###글자와 글자를 붙여준다
paste('a','b',sep="")
paste('a','b')
paste0('a','b')

###RColorBrewer: 색지정 패키지
##행렬을 만들어 주는 함수
matrix(c(1,2,3,4,5,6), ncol=2, nrow=3)

###범주형 변수의 levles(..)
levels(iris$Species)
nlevels(iris$Species)