library(ISLR)
library(boot)

boot.fn=function (data ,index )
  + return (coef(lm(mpg~horsepower ,data=data ,subset =index)))

set.seed (1)
boot(Auto,boot.fn,1000)