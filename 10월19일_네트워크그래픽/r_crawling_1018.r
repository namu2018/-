getwd()

install.packages("rvest")
library(rvest)
rm(list=ls())
all.reviews <- c()

url_all = c()
for (i in 1:7) {
  test <- paste0('https://movie.daum.net/moviedb/grade?movieId=112415&type=netizen&page=',i)
  url_all = c(url_all,test)
}
url_all

all_reviews = c()
for (i in 1:7) {
  ### html 을 읽어옵니다.
  htxt = read_html(url_all[i])
  table = html_nodes(htxt, '.review_info')    # 리뷰 영역 가져오기 
  content = html_nodes(table, '.desc_review') # 리뷰 가져오기 
  reviews = html_text(content)                # 리뷰 안에 html 코드 제거 후, 텍스트만 
  reviews <- gsub('\n', '', reviews)          # 필요없은 부호 제거 
  reviews <- gsub('\t', '', reviews)          # 필요없은 부호 제거 
  all_reviews <- c(all_reviews, reviews) # 1 page review
}
all_reviews
