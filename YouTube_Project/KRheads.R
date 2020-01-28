library(ggplot2)
library(dplyr)
khead1=head(Krd1,10)
khead1$date="2017.11"
View(khead3)
khead2=head(Krd2,10)
khead2$date="2017.12"
khead3=head(Krd3,10)
khead3$date="2018.1"
khead4=head(Krd4,10)
khead4$date="2018.2"
khead5=head(Krd5,10)
khead5$date="2018.3"
khead6=head(Krd6,10)
khead6$date="2018.4"
khead7=head(Krd7,10)
khead7$date="2018.5"
rm(khead7)

Kheads=rbind(khead1,khead2,khead3,khead4,khead5,khead6,khead7)
View(Kheads)

Kheads %>% ggplot(aes(x=date,y=freq))+
  geom_text(aes(label=word,col=word),size=4,hjust=0.5,vjust=0,show.legend = F)+
  geom_line(aes(group=word,col=word),show.legend = F)

?geom_text
