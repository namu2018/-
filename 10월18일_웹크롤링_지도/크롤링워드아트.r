library(rvest)
rm(list=ls())
all.reviews <-c()
all_url <-c()
for (i in 1:5 ){
  miss <- paste0('https://movie.daum.net/moviedb/grade?movieId=106812&type=netizen&page=',1)
  all_url <- c(all_url,miss)
  htxt1=read_html(all_url[i])
  table1=html_nodes(htxt1,'.review_info')
  content1=html_nodes(table1,'.desc_review')
  reviews1 = html_text(content1)
  reviews1 <-gsub('\n','',reviews1)
  reviews1 <-gsub('\t','',reviews1)
  all.reviews  <-c(all.reviews , reviews1)
}



install.packages("devtools")
install.packages("wordcloud2")
library(wordcloud2)
####명사추출

# 명사추출
nouns <- sapply(all.reviews, extractNoun, USE.NAMES=F)  # nouns : 리스트
nouns <- unlist(nouns)
nouns
### 쓸데없는 단어 삭제 및 빈도 확인 
nouns <- gsub("\\d+","", nouns)
nouns <- gsub("\t","", nouns)
nouns <- gsub("[a-zA-Z]","", nouns)
nouns <- gsub("영화","", nouns)
nouns <- nouns[nchar(nouns)>=2]
nouns

wordFreq <- table(nouns)
wordFreq <- sort(wordFreq, decreasing=T)


len = length(wordFreq)
wdFreq1 <- wordFreq[1:len] 

#wdFreq50 <- wordFreq[1:30]



#### 10. 색 지정(brewer.pal(6, "Dark2")
#### 11. 폰트 지정
#### 12. set.seed(1000)
#### 13. wordcloud( )

pal <- brewer.pal(8,"Dark2")

#windowsFonts(malgun=windowsFont("맑은 고딕"))

set.seed(1000)
wc2<-wordcloud2(data=wdFreq1, size = 0.5, color = "random-light", backgroundColor = "grey",rotateRatio = 0.75)
wc2
