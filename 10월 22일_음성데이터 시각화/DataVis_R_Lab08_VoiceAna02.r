
## 사운드 분석
## 
install.packages('Synth')
install.packages('seewave')


library(seewave)
library(tuneR)
data(tico)   # 새의 소리 불러오기
tico
play(tico)

plot(tico@left[0:length(tico)], type="l",
     main="Sound tico", 
     xlab="Time", ylab="Frequency")

## oscillogram plot
## spectro 함수를 이용하여 Frequency, Amplitude 표시 가능.
## 단기 푸리에 변환에 해당.
## f : samling frequency of wave
## ovlp : overlap between two successive windows (in %).
## plots an oscillogram beneath the spectrogram (by default FALSE).
## collevels : a set of levels which are used to partition 
##           the amplitude range of the spectrogram (in dB).
spectro(tico, 
         f=22000,    
         ovlp=30, 
         collevels = seq(-40,0,0.5),
         osc=TRUE)

## 기타 zp 
## url : https://www.rdocumentation.org/packages/seewave/versions/1.0/topics/spectro
## zp : zero-padding (even number of points), see Details.

## colour modifications
## 
## 
library(RColorBrewer)
display.brewer.all()
col1 = brewer.pal(1, "Set3")

tico
data(peewit)  # 댕기물떼새 
play(peewit)
is(temp.colors)

# palette : a color palette function
spectro(peewit, f=22050, 
        palette=temp.colors,
        collevels=seq(-100,0,1))

dev.off()

## 3D spectrogram(graph)
data(tico)
wf(tico, f=22050,
  ovlp=50, 
  hoff=2, 
  voff=9,
  border="#00000075")

data(tico)
# wf : Waterfall display
# 단기 푸리에 변환 또는 임의의 행렬의 폭포 표시를 반환
# 
'''
wf(wave, f, wl = 512, zp = 0, ovlp = 0, fftw= FALSE, dB = "max0",
dBref = NULL, wn = "hanning", x = NULL,
hoff = 1, voff = 1, col = heat.colors,
xlab = "Frequency (kHz)", ylab = "Amplitude (dB)",
xaxis = TRUE, yaxis = TRUE,
density = NULL, border = NULL, lines = FALSE, lwd=NULL, ...)
wf(tico, f=10000,
   ovlp=50, 
   hoff=0, 
   voff=2,
   border="#00000075")
'''
'''
wave : R의 object
ovlp : overlap between two successive windows ( in %)
hoff : vertical "offset" 흔적 구분
'''

## 실습 2
## hoff를 1,2,3,4,5로 변경해 보기
## voff를 1,2,3,4,5로 변경해 보기
## f를 변경해 보기
## ovlp를 변경해 보기 

### 03. peak detection
data(peewit)
spec(peewit, f=22050, 
      db=TRUE, 
      col='blue')

plot(tico@left[0:length(peewit)], type="l",
     main="Sound tico", 
     xlab="Time", ylab="Frequency")

# 두 파형의 비교 
# wave[(c - wl2):(c + wl2), ]
spec1 = spec(tico, f=22050, at=0.2, plot=FALSE)
spec2 = spec(tico, f=22050, at=1.1, plot=FALSE)

corspec(spec1, spec2, 
        main="cross-correlation between two spectra")
## REF 
## https://www.rdocumentation.org/packages/seewave/versions/1.0/topics/spectro
## 


