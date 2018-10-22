
### 기본 사운드 분석
### 01. 파일 읽기
# install.packages('tuneR', dep=TRUE)
# 기타 패키지 
# signal : MATLAB와 같은 신호 처리 기능 
# seewave : 시간파(특히 소리)를 분석 조작, 표시, 편집 및 합성

library(tuneR)
sObj <- readWave("D:/dataset/voice_data/Cartoon_Slip.wav") # 파일 읽기
play(sObj)  ## 소리 들어보기

## 간단한 그래프 표시 10000~15000까지
plot(sObj@left[0:15000], type="l",
        main="Sound SObj", 
        xlab="Time", ylab="Frequency")

## 실습 
## 01. 5000~10000까지 표시해 보기
## 02. 전체적인 그래프에서 어떤 패턴이 있는가?
##     예) 전체에서 줄어든다 등. 

### 02. 탐색 
str(sObj)   ## 두개의 채널(left, right), 샘플 193108 
sObj
is(sObj)

### 02. 데이터 접근
sObj@left
s1 <- sObj@left

## Number of Samples    : 23708
## Duration (seconds)   : 0.54    (재생시간) 
## Samplingrate (Hertz) : 44100
## PCM (integer format) : TRUE
## Bit (8/16/24/32/64)  : 16

s1 <- s1 / 2^(sObj@bit -1)  # 전체 범위로 봤을때의 값 (0-1사이)
s1

### 03. 소리 그래프 표시
### 0~1 사이의 진폭으로 변환 후, 
timeArray <- (0:(23708-1)) / sObj@samp.rate
timeArray <- timeArray * 1000   # 범위 milliseconds

plot(timeArray, s1, type='l', col='black', xlab='Time(ms)', 
        ylab='Amplitude')

length(s1)  # 길이

# 고속 푸리에 변환 알고리즘을 구현하는 fft 함수
# FFT는 디지털 신호처리에서 편미분 방정식을 구하는 알고리즘까지 많은 분야에서 사용.
# 사운드의 주파수 스펙트럼
# https://goo.gl/EPiMXM : 고속 푸리에 변환 위키
# FFT : Fast Fourier transform
fft(s1)

n <- length(s1)  # 길이
p <- fft(s1) 
p

sampleLen = 5000
pm <- p[1:sampleLen]
pm <- abs(pm)

# fft함수에 의해 반환된 톤의 푸리에 변환은 크기 정보 및 위상 정보 모두 포함.
# 복소수 표현으로 주어진다.
# 푸리에 변환의 절대값을 취함으로써 주파수 성분의 크기에 대한 정보를 얻는다.
pm <- pm / n
pm <- pm^2

if (n %% 2 > 0){
  pm[2:length(pm)] <- pm[2:length(pm)]*2 # we've got odd number of points fft
} else {
  pm[2: (length(pm) -1)] <- pm[2: (length(pm) -1)]*2 # we've got even number of points fft
}

freqArray <- (0:(sampleLen-1)) * (sObj@samp.rate / n) #  create the frequency array 
plot(freqArray/1000, 10*log10(pm), type='l', 
     col='black', xlab='Frequency (kHz)', ylab='Power (dB)')

## REF
## https://goo.gl/HEJfSk : samcarcagno blog 
## The MathWorks support. Technical notes 1702, available: 
## https://web.archive.org/web/20120615002031/http://www.mathworks.com/support/tech-notes/1700/1702.html
