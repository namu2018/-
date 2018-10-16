###treemap
##계층데이터를 중첩된 사각형 세트로 표시
##트리의 각 가지에는 사각형이 주어진다.
##하위 분기를 나타내는 작은 사각형으로 바둑판 식으로 배열
##Treemap은 Treemap라이브러리를 사용한다
install.packages("treemap")
library(treemap)
##데이터만들기
group=c("group-1", "group-2","group-3")
value=c(13,5,22)
data=data.frame(group, value)

##treemap
treemap(data, index="group", vSize="value", type="index")
