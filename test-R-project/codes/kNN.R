require(class)

head(Boston)
nrow(Boston)

str(iris)

# produces a sampling frame, then used to filter obs for test and train datasets 
nTrain = sample.int(nrow(iris),size=nrow(Boston)*.1)
train = iris[nTrain,c(1:4)]
test = iris[-nTrain,c(1:4)]

# knn function requires both the train and test datasets at once
knn_result = knn(train = train,test = test, cl=iris[nTrain,]$Species)

# tables shows the cross tabulation of predicted test classifications versus it's real 
table(knn_result,iris[-nTrain,]$Species)

# gets the accuracy rate of the knn result versus the real classification
mean(knn_result == iris[-nTrain,]$Species)

