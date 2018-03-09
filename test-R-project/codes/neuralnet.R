# install.packages('neuralnet')
library(neuralnet)


setwd('D:/Sandbox/Git Project/Project_One/test-git/test-R-project')
cereal = read.table('data/cereals.txt',header=TRUE)

set.seed(1)
nTrain = sample.int(nrow(cereal),size=nrow(cereal)*.2)
train = cereal[nTrain,]
test = cereal[-nTrain,]

set.seed(2)

# numeric data need to scaled as it will have a great impact to the neuralnet procedure
max = apply(cereal , 2 , max)
min = apply(cereal, 2 , min)


scaled = as.data.frame(scale(cereal, center = min, scale = max - min))


# fitting the neural net procedure to the train data
NN = neuralnet(rating ~ calories + protein + fat + sodium + fiber, train, hidden = 3 , linear.output = T )

plot(NN)

