install.packages("igraph")
library(igraph)
install.packages("network")
library(network)
install.packages("sna")
library(sna)

par(bg="skyblue1")
plot(x=1:10, y=rep(5,10), pch=19, cex=3)
points(x=1:10, y=rep(4,10),pch=19,cex=3,col=rgb(.25,.5,.3))
points(x=1:10, y=rep(3,10), pch=19, cex=3, col=rgb(37,59,233, max=255))
points(x=1:5, y=rep(5,5), pch=19, cex=20, col=rgb(.25,.5,.3, alpha=.5))
colors()

grep("blue", colors(), value=T)

pal1 <- heat.colors(5, alpha=1)
pal2 <- rainbow(5,alpha=.5)
plot(x=1:10, y=1:10, pch=10, cex=5, col=pal1)

install.packages("RColorBrewer")
library(RColorBrewer)

display.brewer.all()
display.brewer.pal(9,"Set3")
display.brewer.pal(9, "Spectral")

season=brewer.pal(9,"Set3")
a=c(1,2,3,4,5,6,7,8,9)
plot(a, col=season)
plot(a, col=season, cex=3, pch=19)
