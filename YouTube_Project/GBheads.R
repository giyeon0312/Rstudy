
GBhead1=head(GBd1,10)
GBhead1$date="2017.11"
View(GBhead3)
GBhead2=head(GBd2,10)
GBhead2$date="2017.12"
GBhead3=head(GBd3,10)
GBhead3$date="2018.1"
GBhead4=head(GBd4,10)
GBhead4$date="2018.2"
GBhead5=head(GBd5,10)
GBhead5$date="2018.3"
GBhead6=head(GBd6,10)
GBhead6$date="2018.4"
GBhead7=head(GBd7,10)
GBhead7$date="2018.5"
rm(GBhead7)

GBheads=rbind(GBhead1,GBhead2,GBhead3,GBhead4,GBhead5,GBhead6,GBhead7)
View(GBheads)

GBheads %>% ggplot(aes(x=date,y=freq,label=word))+
  geom_text(aes(label=word,size=3,col=word),hjust=0.5,vjust=0,show.legend = F)+
  geom_line(aes(group=word,col=word),show.legend = F)
?geom_text
