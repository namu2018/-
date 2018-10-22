##파일읽는 패키지
install.packages("tuneR", dep=TRUE)
##시간파를 분석 조작 편집 합성
install.packages("seewave")
library(tuneR)
library(seewave)

sObj1 <-readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/Cartoon_Slip.wav") 
sObj2 <-readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/dob_bark_nofree.wav") 
sObj3 <-readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/monkey01_free.wav")
b1 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/321179.wav")
b2 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/439535.wav")
b3 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/418876.wav")
b4 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/395919.wav")
b5 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/366935.wav")
b6 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/366692.wav")
b7 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/352367.wav")
b8 <- readWave("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월 22일_음성데이터 시각화/352366.wav")



play(sObj1)
play(sObj2)
plot(sObj1)
plot(sObj2)
plot(sObj3)
str(sObj1)
is(sObj1)
sObj1@left
sObj1@samp.rate
str(sObj2)
str(sObj3)
summary(sObj1)

###03.sound 그래프 표시
timeArray <- (0:(23708-1))/ sObj@samp.rate ##재생시가
s1 <- sObj1@left/2^(sObj1@bit -1)간 ##0과 1사이로 표현 

plot(timeArray, s1)

###########고속 푸리에 변환 알고리즘 -fft함수
####fft: 디지털 신호 처리에서 선미분 방정식 
####
fft(s1)
head(s1)
head(fft(s1))

n<- length(s1)
p <- fft(s1)

sampleLen = 5000
pm <- p[1:sampleLen]
pm <- abs(pm)

#fft함수에