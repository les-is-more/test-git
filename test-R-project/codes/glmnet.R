install.packages('data.table')
require(glmnet)
require(data.table)
set.seed(123)

str(Boston)
Boston[,!names(Boston) %in% c("crim")]

###reading data
setwd('D:/Sandbox/Git Project/Project_One/test-git/test-R-project')
housingData=read.csv('data/kc_house_data.csv')
##Removing non numeric var
housingData[,floors:=as.numeric(floors)][,c('zipcode','lat','long','id','date','sqft_basement'):=NULL]

###Splitting data
indexTrain=sample.int(nrow(housingData),nrow(housingData)*0.005)



lmNoReg=lm(price~.,b[indexTrain,])
summary(lmNoReg)
pred_no_reg=predict(lmNoReg,b[-indexTrain,])

sqrt(mean((pred_no_reg-b[-indexTrain,]$price)^2))


plotCoeffEvolution=function(penalizedGlm,type='L1')
{
  require(ggplot2)
  lambda=penalizedGlm$lambda
  coeff=as.matrix(penalizedGlm$beta)
  rowName=rownames(coeff)
  coeff=data.table(coeff)
  coeff[,name:=rowName]
  coeff=melt(coeff,id.vars = 'name')
  coeff[,variable:=rep(lambda,each=length(unique(name)))]
  ggplot(coeff,aes(x=variable,y=value,color=name))+geom_line()+xlab(paste0(type,' regularisation'))+ylab('Value of coefficient')+scale_x_log10()
}

##Different L1 regularisation
fit = glmnet(as.matrix(b[indexTrain,-c('price')]),as.matrix(b[indexTrain,]$price) , family="gaussian",alpha=1)
?glmnet

pred_L1_reg=data.table(predict(fit,as.matrix(housingData[-indexTrain,-c('price'),with=F])))
RMSE_L1=sqrt(apply(pred_L1_reg[,(.SD-housingData[-indexTrain]$price)^2,.SD=1:ncol(pred_L1_reg)],2,mean))
DF_plot=data.frame(lambda=fit$lambda,rmse=RMSE_L1)
ggplot(DF_plot,aes(x=lambda,y=rmse))+geom_line()+ggtitle("Evolution of test error vs lambda value")+scale_x_log10()
require(plotly)

## L2 regularisation
fit = glmnet(as.matrix(housingData[indexTrain,-c('price'),with=F]),as.matrix(housingData[indexTrain]$price) , family="gaussian",alpha=0)

pred_L2_reg=data.table(predict(fit,as.matrix(housingData[-indexTrain,-c('price'),with=F])))
RMSE_L2=sqrt(apply(pred_L2_reg[,(.SD-housingData[-indexTrain]$price)^2,.SD=1:ncol(pred_L2_reg)],2,mean))
DF_plot=data.frame(lambda=fit$lambda,rmse=RMSE_L2)
plotCoeffEvolution(fit,'L2')
require(ggplot2) 
ggplot(DF_plot,aes(x=lambda,y=rmse))+geom_line()+ggtitle("Evolution of test error vs lambda value")+scale_x_log10()


##Different L1L2 regularisation
fit = glmnet(as.matrix(housingData[indexTrain,-c('price'),with=F]),as.matrix(housingData[indexTrain]$price) , family="gaussian",alpha=0.03)

pred_L1L2_reg=data.table(predict(fit,as.matrix(housingData[-indexTrain,-c('price'),with=F])))
RMSE_L1L2=sqrt(apply(pred_L1L2_reg[,(.SD-housingData[-indexTrain]$price)^2,.SD=1:ncol(pred_L1L2_reg)],2,mean))
DF_plot=data.frame(lambda=fit$lambda,rmse=RMSE_L1L2)
plotCoeffEvolution(fit,'Elastic')
require(ggplot2)
ggplot(DF_plot,aes(x=lambda,y=rmse))+geom_line()+ggtitle("Evolution of test error vs lambda value")+scale_x_log10()