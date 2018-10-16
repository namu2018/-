## Distribution
##수치 변수의 분포를 보여준다
x1=rnorm(100)
x2=rnorm(100, mean=2)
par(mfrow=c(2,1))
par(mar=c(0,5,3,3))
plot(density(x1), main="", xlab="",ylim=c(0,1), las=1, col="slateblue1", lwd=4, xaxt='n')

par(mar=c(5,5,0,3))
plot(density(x2), main="", xlab="변수명",ylim=c(1,0), las=1, col="tomato3", lwd=4)


#####히스토그램 
###하나의 값만 변수값으로 들어옴
###높이는 데이터 갯수를 나타냄
###여려분포를 비교할때, violinplots 추가하기도 함.
#set.seed(0)
lxos1=rnorm(4000, 100, 30)
lxos2=rnorm(4000,200,30)
par(mfrow=c(1,2))
hist(lxos1, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="높이", ylab="개수", main="")
hist(lxos2, breaks=30, xlim=c(0,300), col=rgb(1,0,0,1), xlab="높이", ylab="개수", main="")

legend("topright", pt.cex=2, pch=15, legend=c("lxos1","lxos2"), col=c(rgb(1,0,0,0.5),rgb(1,0,1,0.5)))

###초기화
par(mfrow=c(1,1))
hist(lxos1, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="높이", ylab="개수", main="")
hist(lxos2, breaks=30, xlim=c(0,300), col=rgb(1,0,0,1), add=T)
legend("topright", pt.cex=2, pch=17, legend=c("lxos1","lxos2"), col=c(rgb(1,0,0,0.5),rgb(1,0,1,0.5)))


##boxplot
##상자그림을 그려준다
##중앙값, 이상치, 사분위수(25,50,75)
###관측치가 많을경우 jitter,violinplot

names=c(rep("A",80), rep("B",50), rep("C",70))
a1=rnorm(80,mean=10,sd=9)
a2=rnorm(50,mean=2,sd=15)
a3=rnorm(70,mean=30, sd=10)
value=c(a1,a2,a3)
dim(data)
###basic boxplot
mylevels <- levels(data$names)
levelProp <- summary(data$names)/nrow(data)
data$names
data
for (i in 1:length(mylevels)) {
  thislevel=mylevels[1]
  thisvalues=data[data$names==thislevel,"value"] ##각각의 데이터 확인
  ival=rep(i, length(thisvalues))##A의 개수만큼  반복(i=1)
  myjitter<- jitter(ival, amount=levelProp[i]/2)
  points(myjitter, thisvalues,pch=20, col=rgb(0,0,0,0.2))
}

?jitter
