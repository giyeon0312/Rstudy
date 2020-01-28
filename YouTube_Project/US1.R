library(dplyr)
US_rawdata=read.csv("USvideos.csv",header = TRUE,sep=",",stringsAsFactors = FALSE)

class(US_rawdata$trending_date)
View(US_rawdata)

US_data=data.frame(trending_date=US_rawdata$trending_date,title=US_rawdata$title,tags=US_rawdata$tags)
View(US_data)

by_month=substr(US_rawdata$trending_date,7,8)
US_data=mutate(US_data,by_month)


class(by_month)
US_data$by_month=as.integer(US_data$by_month)


US_1=US_data %>% filter(by_month==11) %>% select(title,tags)
US_2=US_data %>% filter(by_month==12) %>% select(title,tags)
US_3=US_data %>% filter(by_month==1)%>% select(title,tags)#10,11일이없음
US_4=US_data %>% filter(by_month==2)%>% select(title,tags)
US_5=US_data %>% filter(by_month==3)%>% select(title,tags)
US_6=US_data %>% filter(by_month==4)%>% select(title,tags)
US_7=US_data %>% filter(by_month==5)%>% select(title,tags)
#rm(US_7_td)

#title과 tags합쳐서 tt변수 만들기
library(tidyr)

US_1_tt=unite(US_1,col = "tt",title,tags,sep = " ")
US_2_tt=unite(US_2,col = "tt",title,tags,sep = " ")
US_3_tt=unite(US_3,col = "tt",title,tags,sep = " ")
US_4_tt=unite(US_4,col = "tt",title,tags,sep = " ")
US_5_tt=unite(US_5,col = "tt",title,tags,sep = " ")
US_6_tt=unite(US_6,col = "tt",title,tags,sep = " ")
US_7_tt=unite(US_7,col = "tt",title,tags,sep = " ")
