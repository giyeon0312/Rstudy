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

USdocs7=Corpus(VectorSource(US_7_tt))

USdocs7=tm_map(USdocs7,tolower) 
#USdocs7= tm_map(USdocs7, stemDocument)
USdocs7=tm_map(USdocs7,removeWords,stopwords())

USdtm7=TermDocumentMatrix(USdocs7,
                          control = list(
                            removePunctuation=T,
                            removeNumbers=T,
                            wordLength=c(1,20)))

Encoding(USdtm7$dimnames$Terms) = "UTF-8"
USm7=as.matrix(USdtm7)
USv7=sort(rowSums(USm7),decreasing = TRUE)
USd7=data.frame(word=names(USv7),freq=USv7)
#View(USd1)
#View(USd2)
#View(USd3)
#View(tail(USd3,30))
#none지우기
class(USd7$word)
USd7$word=as.character(USd7$word)
USd7$word=ifelse(USd7$word=="none",NA,USd7$word)
USd7=USd7[!is.na(USd7$word),]

wordcloud(words = USd7$word,
          freq=USd7$freq,
          min.freq = 1,max.words = 200,
          random.order = F,
          rot.per = 0,
          scale = c(3.5,0.5),
          colors = brewer.pal(8, "Dark2"))