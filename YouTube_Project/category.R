library(dplyr)
library(ggplot2)
library(RColorBrewer)

Kr_category=data.frame(category_id=Kr_rawdata$category_id,by_month)
by_month=substr(Kr_rawdata$trending_date,7,8)
ggplot(Kr_category,aes(x=category_id))+geom_bar()
class(Kr_category$category_id)

table(Kr_rawdata$category_id)


Kr_category=Kr_rawdata %>% group_by(category_id=Kr_rawdata$category_id) %>% count()
US_category=US_rawdata %>% group_by(category_id=US_rawdata$category_id) %>% count()
GB_category=GB_rawdata %>% group_by(category_id=GB_rawdata$category_id) %>% count()

View(GB_category)
Kr_category$per=Kr_category$n/sum(Kr_category$n)*100
US_category$per=US_category$n/sum(US_category$n)*100
GB_category$per=GB_category$n/sum(GB_category$n)*100

Kr_category$country="Korea, Rep."
US_category$country="US"
GB_category$country="GB"

categories=rbind(Kr_category,US_category,GB_category)
View(categories)

categories$category_id=as.character(categories$category_id)
class(categories$category_id)
categories2 %>% ggplot(aes(x=category_id,y=per)) + geom_col(position = "dodge",aes(fill=country))+coord_flip()

categories2=categories
categories2$category_id=ifelse(categories$category_id=="44", "Trailers",categories2$category_id)
View(categories2)
  
#Kr_category
      "Film & Animation"=1,"Autos & Vehicles"=2,"Music"=10,"Pets & Animals"=15,"Sports"=17,"Short Movies"=18,"Travel & Events"=19,
       "Gaming"=20,"Videoblogging"=21,"People & Blogs"=22,"Comedy"=23,"Entertainment"=24,"News & Politics"=25,"Howto & Style"=26,"Education"=27,"Science & Technology"=28,
        29="Nonprofits & Activism"
       "Movies"=30,"Anime/Animation"=31,"Action/Adventure"=32,"Classics"=33,"Comedy"=34,"Documentary"=35,"Drama"=36,"Family"=37,"Foreign"=38,"Horror"=39,
       "Sci-Fi/Fantasy"=40,"Thriller"=41,"Shorts"=42,"Shows"=43, "Trailers"=44)
