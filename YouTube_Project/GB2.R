#코퍼스(말뭉치)생성->TDM(문서행렬)생성->문자처리(숫자,특수문자,조사제거)->문자열 변수 생성
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre-10.0.2/") 
library(rJava)
library(KoNLP)
library(tm)          #corpus,텍스트문서들 집합
library(SnowballC)   #어근 추출
library(RColorBrewer)#단어구름 만들기
library(wordcloud)   #color palettes

useSejongDic()#사전 준비
options(mc.cores=1)#멀티코어 사용x

GBdocs7=Corpus(VectorSource(GB_7_tt))

GBdocs7=tm_map(GBdocs7,tolower) 
#GBdocs1= tm_map(GBdocs1, stemDocument)
GBdocs7=tm_map(GBdocs7,removeWords,stopwords())

GBdtm7=TermDocumentMatrix(GBdocs7,
                          control = list(
                            removePunctuation=T,
                            removeNumbers=T,
                            wordLength=c(1,20)))

Encoding(GBdtm6$dimnames$Terms) = "UTF-8"
GBm7=as.matrix(GBdtm7)
GBv7=sort(rowSums(GBm7),decreasing = TRUE)
GBd7=data.frame(word=names(GBv7),freq=GBv7)
#View(GBd4)
#View(GBd3)
#View(GBd2)
#View(tail(GBd1,30))

wordcloud(words = GBd7$word,
          freq=GBd7$freq,
          min.freq = 1,max.words = 300,
          random.order = F,
          rot.per = 0,
          scale = c(3.5,0.5),
          colors = brewer.pal(8, "Dark2"))