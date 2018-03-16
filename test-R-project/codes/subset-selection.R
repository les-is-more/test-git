#' ---
#' title: "Sample of Subset Selection Procedure"
#' author: "Lester Cajegas"
#' date: "March 15, 2018"
#' output:
#'   pdf_document:
#'        latex_engine: pdflatex
#'        fig_caption: yes
#' ---

#' ###Subset Selection
#' 
#' Subset selection for the least squares regression is possible to do in R using the `regsubsets`
#' function in `leaps` package. The said function is akin to the `lm` procedure for the OLS method.

#+ include=F
library(leaps)
library(ISLR)
library(knitr)
library(kableExtra)

#+ include=F
attach(Hitters)
Hitters = na.omit(Hitters)

#' In the summary below, we can see the best model per number of included variables. Variables with
#' asterisk(\*) means they are included in the proposed model.


#+ echo=F, message=F
regfit.full = regsubsets(Salary~.,Hitters,nvmax = 10, method="forward")
reg.summary = summary(regfit.full)

par(mar=c(4,4,3,1))
par(mfrow=c(2,2))
plot(reg.summary$rsq, type='l', ylab="R Square", xlab="Model Size", main='R-Square vs Model Size')
plot(reg.summary$rss, type='l', ylab="RSS",xlab="Model Size", main='RSS vs Model Size')
plot(reg.summary$adjr2, type='l', ylab="Adj R Square",xlab="Model Size", main='Adj R Square vs Model Size')
plot(reg.summary$bic, type='l', ylab="BIC",xlab="Model Size", main='BIC vs Model Size')
points (6, reg.summary$bic[6], col ="red",cex =2, pch =20)
reg.summary$method

#' From the results of the `regsubsets` procedure, the model with the lowest BIC has `r which.min(reg.summary$bic)`
#' variables. The procedure used the `r reg.summary$obj$method` to get the best models.


#+ echo=F, message=F
coefs = as.data.frame(coef(regfit.full, which.min(reg.summary$bic)))
names(coefs) = c("Coefficients")
kable(coefs,caption="Coefficients of the Best Model")
