library(ggplot2)
data(mpg)


ggplot(mpg, aes(x=class))+geom_bar()
