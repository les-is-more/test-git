library(dplyr)
library(magrittr)
library(ggplot2)

install.packages('ggplot2')
summary(iris$Species)
?ggplot2
y = 'setosa'
meni = function (y) {
  iris %>% filter(Species == y) %>% 
    select(Sepal.Length, Sepal.Width) %>% plot(main=paste('Plot of Sepal Length and Width of Species ',y), ylab='Sepal Length', xlab = 'Sepal Width')
}

attach(iris)
unique(Species)

par(mfrow=c(2,2))
meni('versicolor')
meni('setosa')
meni('virginica')
