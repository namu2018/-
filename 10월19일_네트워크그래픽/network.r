##관계도 그리기
library(igraph)

g1 <- graph(c(1,2,2,3,2,4,1,4,5,5,3,6,3,5))
plot(g1)
str(g1)

g3 <- graph(c(22,25,23,65,77,23))
plot(g3)
g3

g2 <- graph(c(1,9,13,12))
plot(g2)

df <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월19일_네트워크그래픽/clustering.csv")
df
graph <- data.frame(학생=df$학생, 교수=df$교수)
library(stringr)
df <- graph.data.frame(graph, directed=TRUE)
is(df)
names(graph)
names(df)
df
##vertical의 이름
V(df)
e(df)
gubun1 <- V(df)$name
gubun <- str_sub(gubun1, start=1, end=1)
gubun
table(gubun)

###시각화 한 것을 사이즈를 줄여보자
plot(df, layout=layout.fruchterman.reingold, vertex.size=5, edge.arrow.size=0.3, vertex.color="green", vertex.label=NA)

colors <-c()
sizes <-c()
for (i in 1:length(gubun)){
  if(gubun[i]=='S'){
    colors <- c(colors,'springgreen2')
    sizes <-c(sizes,3)
  }else {
    colors <- c(colors,'violetred2')
    sizes <-c(sizes,6)
  }
  }
}

###시각화 한 것을 사이즈를 줄여보자
plot(df, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0.3, vertex.color=colors, vertex.label=NA)

colors()

