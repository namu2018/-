install.packages("network")
install.packages("sna")
install.packages("VisNetwork")
install.packages("threejs")
install.packages("ndtv")
install.packages("png")
install.packages("networkd3")
install.packages("networkD3")
install.packages("animation")
install.packages("maps")
install.packages("geosphere")

plot(x=1:10, y=rep(5,10), pch=19, cex=3, col="dark blue")
points(x=1:10, y=rep(4,10),pch=19,cex=3,col=rgb(.25,.5,.3))
points(x=1:10, y=rep(3,10), pch=19, cex=3, col=rgb(37,59,233, max=255))
points(x=1:5, y=rep(5,5), pch=19, cex=20, col=rgb(.25,.5,.3, alpha=.5))

colors()
grep("blue", colors(), value=T)
###투명도 , 배경ㅅ
points(x=1:5, y=rep(5,5), pch=19, cex=12, col=rgb(.1,.9,.7, alpha=.5))
par(bg='black')
search()
col.tr <- grDevices::adjustcolor("#557799", alpha=0.7)
plot(x=1:5, y=rep(5,5), pch=19, cex=20, col=col.tr, xlim=c(0,6))
dev.off()
##색을 넣기
pal1 <- heat.colors(5, alpha=1)
plot(x=1:10, y=rep(5,10), pch=19, cex=3, col=pal1 )

pal2 <- rainbow(5, alpha=1)
plot(x=1:10, y=rep(5,10), pch=19, cex=3, col=pal2 )

###colorRampPalette
palf <- colorRampPalette(c("gray70", "dark red"))
palf
palf(50)
plot(x=10:1, y=1:10, pch=19, cex=10, col=palf(10))

col1 <- rgb(1,1,1,0.2)
col2 <- rgb(0.8, 0,0,0.7)
palf <- colorRampPalette(c(col1, col2), alpha=TRUE)
plot(x=10:1, y=1:10, pch=19, cex=10, col=palf(10))

######ColorBrewer
library(RColorBrewer)
display.brewer.all()
display.brewer.pal(8,"Set3")

plot(x=1:20, y=1:20, pch=15, cex=10, col=palf(50))
points(x=1:20, y=20:1, pch=21, cex=10, col=palf(20))

brewer.pal.info
display.brewer.pal(9,"Purples")
pal3 <- brewer.pal(9,"PuBu")
display.pal3
detach("package:RColorBrewer")
search()
