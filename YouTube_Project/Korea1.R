library(dplyr)
library(ggplot2)
Kr_rawdata=read.csv("KRvideos.csv",header = TRUE,sep=",",stringsAsFactors = FALSE)

class(Kr_rawdata$trending_date)
View(Kr_rawdata)

Kr_data=data.frame(trending_date=Kr_rawdata$trending_date,title=Kr_rawdata$title,tags=Kr_rawdata$tags)

View(Kr_data)

by_month=substr(Kr_data$trending_date,7,8)
Kr_data=mutate(Kr_data,by_month)


class(Kr_data$by_month)
Kr_data$by_month=as.integer(Kr_data$by_month)


Kr_1=Kr_data %>% filter(by_month==11) %>% select(title,tags)
Kr_2=Kr_data %>% filter(by_month==12) %>% select(title,tags)
Kr_3=Kr_data %>% filter(by_month==1)%>% select(title,tags)#10,11일이없음
Kr_4=Kr_data %>% filter(by_month==2)%>% select(title,tags)
Kr_5=Kr_data %>% filter(by_month==3)%>% select(title,tags)
Kr_6=Kr_data %>% filter(by_month==4)%>% select(title,tags)
Kr_7=Kr_data %>% filter(by_month==5)%>% select(title,tags)

#title과 tags합쳐서 tt변수 만들기
library(tidyr)

Kr_1_tt=unite(Kr_1,col = "tt",title,tags,sep = " ")
Kr_2_tt=unite(Kr_2,col = "tt",title,tags,sep = " ")
Kr_3_tt=unite(Kr_3,col = "tt",title,tags,sep = " ")
Kr_4_tt=unite(Kr_4,col = "tt",title,tags,sep = " ")
Kr_5_tt=unite(Kr_5,col = "tt",title,tags,sep = " ")
Kr_6_tt=unite(Kr_6,col = "tt",title,tags,sep = " ")
Kr_7_tt=unite(Kr_7,col = "tt",title,tags,sep = " ")