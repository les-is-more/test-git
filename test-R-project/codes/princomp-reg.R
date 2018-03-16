#' ---
#' title: "Principal Components Regression"
#' author: "Lester Cajegas"
#' date: "March 15, 2018"
#' output:
#'   pdf_document:g
#'        latex_engine: pdflatex
#'        fig_caption: yes
#' ---

#' ###Principal Components Regression 
#' 
#' PCR is a statistical method that uses the components of a Principal Components result as
#' predictors for our variable of interest. In R, the `pls` package houses the `pcr` function
#' that enables such procedure.

#+ include=F
library(pls)
pcr.fit = pcr(Salary~., data=Hitters, scale=TRUE, validation ="CV")

summary(pcr.fit)
summary(pcr.fit)
(pcr.fit$coefficients)[,,"1 comps"]

par(mfrow=c(1,1))
validationplot(pcr.fit ,val.type="MSEP")

plot(pcr.fit)

names(pcr.fit)
str(pcr.fit$residuals)
