rm(list=ls())
library(igraph)

links <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월19일_네트워크그래픽/Dataset1-Media-Example-EDGES.csv")
nodes <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월19일_네트워크그래픽/Dataset1-Media-Example-NODES.csv")
nodes

net <- graph_from_data_frame(d=links, vertices = nodes, directed = T)
E(net)
V(net)
E(net)$type
V(net)$media
plot(net)


links1 <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월19일_네트워크그래픽/Dataset2-Media-User-Example-EDGES.csv")
nodes1 <- read.csv("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월19일_네트워크그래픽/Dataset2-Media-User-Example-NODES.csv")

links1 <- as.matrix(links1)
##d: 네트워크상의 edge
##vertices: node IDs
net1 <- graph_from_incidence_matrix(links1)
E(net1)
V(net1)
net1
net1
plot(net1, edge.arrow.size=0.4, edge.curved=0.1)
plot(net1, edge.arrow.size=0.6, 
          edge.curved=0, 
          vertex.color="red", 
          vertex.label=V(net)$media,
          vertex.color="black",
          vertex.label.cex=0.9)

dev.off()

colors <-c("gray50", "tomato","gold")
V(net)$color <- colors[V(net)$media.type]

deg <- degree(net, mode='all')
V(net)$size <- deg*3
V(net)$size <- V(net)$audience.size * 0.7
V(net)$label.color <- "black"

E(net)$width <- E(net)$weight/6
E(net)$arrow.size <- 0.2
E(net)$edge.color <- "gray80"
graph_attr(net, "layout") <- layout_with_lgl
plot(net)

legend(x=1.1, y=-1.1, c("Newspaper","Television","Online News"),
       pch=21, col="#777777", pt.bg=colors, pt.cex=2.5, ncol=1)
