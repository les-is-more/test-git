require(ggplot2)
set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster$cluster

table(irisCluster$cluster, iris$Species)

not.error <- unclass(iris$Species) == irisCluster$cluster
iris$noerror <- not.error

#See errors 
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) +
  geom_point(size = 3, alpha = 0.5,aes(shape = iris$noerror))

