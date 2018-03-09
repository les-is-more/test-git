install.packages('MASS')
library(MASS)
install.packages('car')
# momentcontain the skewness and kurtosis measures 
install.packages('moments')
require(moments)
require(car)
require(arules)

# Linear Regression
str(Boston)
fix(Boston)
lm.fit = lm(medv~lstat, Boston)
summary(lm.fit)

attach(Boston)
# fix() allows editing of the entries in a data frame
fix(Boston)

# shows the confidence interval for the model estimates
confint(lm.fit)

# Predicts the possible values of new data
# using the weights from the model
predict(lm.fit,data.frame(lstat=(c(5,10,15))),
        interval='confidence')

par(mfrow=c(2,2))
plot(lm.fit)


plot(lstat,medv,col='royal blue', main='Plot of Median Value \n vs Economic Status', xlab='Median Value', ylab='Economic Status Index')
abline(lm.fit, lwd=3, col='red')

par(mfrow=c(1,1))

plot(hatvalues(lm.fit))
summary(hatvalues(lm.fit))


attach(Boston)
lm.fit = lm(log(medv)~.,data=Boston)


res = resid(lm.fit)
shapiro.test(res)
 plot(predict(lm.fit),medv)
par(mfrow=c(2,2))
plot(lm.fit)

par(mfrow=c(1,1))
hist(res)

meas_moment = c()

meas_moment = append(meas_moment,paste0('Skewness:',skewness(res)),meas_moment,paste0('Kurtosis:', kurtosis(res)))

jarque.test(res)['p.value']
agostino.test(res)
