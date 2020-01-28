Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre-10.0.2/") 
library(rJava)
library(KoNLP)
#library(memoise)
library(tm)          #corpus,텍스트문서들 집합
library(SnowballC)   #어근 추출
library(wordcloud)
library(RColorBrewer)
library(stringr)

useSejongDic()

class(Kr_7_tt)
#View(Kr_7_tt)
Krdocs7=Corpus(VectorSource(Kr_7_tt))

Krdtm7=TermDocumentMatrix(Krdocs7,
                          control = list(
                            removePunctuation=T,
                            removeNumbers=T,
                            wordLength=c(1,20)))

Encoding(Krdtm7$dimnames$Terms) = "ANSI"
Krm7=as.matrix(Krdtm7)
Krv7=sort(rowSums(Krm7),decreasing = TRUE)
Krd7=data.frame(word=names(Krv7),freq=Krv7)
#View(Krd7)
#none지우기
class(Krd7$word)
Krd7$word=as.character(Krd7$word)
Krd7$word=ifelse(Krd7$word=="none",NA,Krd7$word)
Krd7=Krd7[!is.na(Krd7$word),]

#단어구름름
wordcloud(words = Krd7$word,
          freq=Krd7$freq,
          min.freq = 1,max.words = 200,
          random.order = F,
          rot.per = 0,
          scale = c(3.5,0.5),
          colors = brewer.pal(8, "Dark2"))
#
rm(Krdtm2)
