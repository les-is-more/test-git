library(dplyr)
library(magrittr)

summary(iris$Species)

y = 'setosa'
meni = function (y) {
  iris %>% filter(Species == y) %>% 
    select(Sepal.Length, Sepal.Width) %>% plot(main=paste('Plot of Sepal Length and Width of Species ',y), ylab='Sepal Length', xlab = 'Sepal Width')
}
