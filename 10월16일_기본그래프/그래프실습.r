use <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월16일_기본그래프/hospital_visualization.csv")

dim(use)
names(use)
use <- use[,-4]
names(use)
head(use)
use <- use[,-1]
head(use)

use_nursing <- use %>% filter(use$instkind=="nursing_hospital")
library(dplyr)
use_general <- use %>% filter(use$instkind=="general_hospital")
use_hostpial <- use %>% filter(use$instkind=="hospital")
table(use$instkind)
use_clinic <- use %>% filter(use$instkind=="clinic")
use_traditiona_ho <- use %>% filter(use$instkind=="traditiona_hospital")
use_traditional_cl <- use %>% filter(use$instkind=="traditional_clinic")
###boxplot
names(use)
mylevels <- levels(use$instkind)
levelProp <- summary(use$instkind)/nrow(use)
par(mar=c(8,6,5,2))
boxplot(use$interest1 ~use$instkind,col=terrain.colors(4), las=2, main="병원종류와 침상수")
options("scipen"=100)
for (i in 1:length(mylevels)) {
  thislevel=mylevels[i]
  thisvalues=use[use$instkind==thislevel,"interest1"] ##각각의 데이터 확인
  ival=rep(i, length(thisvalues))##A의 개수만큼  반복(i=1)
  myjitter<- jitter(ival, amount=levelProp[i]/2)
  points(myjitter, thisvalues,pch=20, col=rgb(0,0,0,0.2))
}

which(use$interest==max(use$interest))
useall <- use
use <- use[-20,]
head(use, 20)

##산점도
plot(use_nursing$interest1, type='l', col=terrain.colors(4))
lines(use_hostpial$interest1, type='l')
lines(use_clinic$interest1, typpe='l',col=rgb(0.2,0.4,0.8,1) )
