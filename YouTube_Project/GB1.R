library(dplyr)
GB_rawdata=read.csv("GBvideos.csv",header = TRUE,sep=",",stringsAsFactors = FALSE)

class(GB_rawdata$trending_date)
View(GB_rawdata)

GB_data=data.frame(trending_date=GB_rawdata$trending_date,title=GB_rawdata$title,channel_title=GB_rawdata$channel_title,
                   category_id=GB_rawdata$category_id,tags=GB_rawdata$tags,description=GB_rawdata$description)
View(GB_data)

by_month=substr(GB_rawdata$trending_date,7,8)
GB_data=mutate(GB_data,by_month)


class(by_month)
GB_data$by_month=as.integer(GB_data$by_month)


GB_1=GB_data %>% filter(by_month==11) %>% select(title,tags)
GB_2=GB_data %>% filter(by_month==12) %>% select(title,tags)
GB_3=GB_data %>% filter(by_month==1)%>% select(title,tags)#10,11일이없음
GB_4=GB_data %>% filter(by_month==2)%>% select(title,tags)
GB_5=GB_data %>% filter(by_month==3)%>% select(title,tags)
GB_6=GB_data %>% filter(by_month==4)%>% select(title,tags)
GB_7=GB_data %>% filter(by_month==5)%>% select(title,tags)
rm(GB_7_td)

#title과 tags합쳐서 tt변수 만들기
library(tidyr)
View(GB_1)
GB_1_tt=unite(GB_1,col = "tt",title,tags,sep = " ")
GB_2_tt=unite(GB_2,col = "tt",title,tags,sep = " ")
GB_3_tt=unite(GB_3,col = "tt",title,tags,sep = " ")
GB_4_tt=unite(GB_4,col = "tt",title,tags,sep = " ")
GB_5_tt=unite(GB_5,col = "tt",title,tags,sep = " ")
GB_6_tt=unite(GB_6,col = "tt",title,tags,sep = " ")
GB_7_tt=unite(GB_7,col = "tt",title,tags,sep = " ")


