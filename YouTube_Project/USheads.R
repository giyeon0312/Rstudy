
UShead1=head(USd1,10)
UShead1$date="2017.11"
View(UShead3)
UShead2=head(USd2,10)
UShead2$date="2017.12"
UShead3=head(USd3,10)
UShead3$date="2018.1"
UShead4=head(USd4,10)
UShead4$date="2018.2"
UShead5=head(USd5,10)
UShead5$date="2018.3"
UShead6=head(USd6,10)
UShead6$date="2018.4"
UShead7=head(USd7,10)
UShead7$date="2018.5"
rm(UShead7)

USheads=rbind(UShead1,UShead2,UShead3,UShead4,UShead5,UShead6,UShead7)
View(USheads)

USheads %>% ggplot(aes(x=date,y=freq,label=word))+
  geom_text(aes(label=word,size=3,col=word),hjust=0.5,vjust=0,show.legend = F)+geom_line(aes(group=word,col=word),show.legend = F)


?geom_text
