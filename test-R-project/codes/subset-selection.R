#' ---
#' title: "Sample of Subset Selection Procedure"
#' author: "Lester Cajegas"
#' date: "March 15, 2018"
#' output:
#'   pdf_document:
#'        latex_engine: xelatex
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
 
#+ echo=F
regfit.full = regsubsets(Salary~.,Hitters)
reg.summary = summary(regfit.full)
reg.summary$which
par(mfrow=c(2,2))
plot(reg.summary$rsq, type='l', ylab="R Square")
plot(reg.summary$rss, type='l', ylab="RSS")
plot(reg.summary$adjr2, type='l', ylab="Adj R Square")
plot(reg.summary$bic, type='l', ylab="BIC")