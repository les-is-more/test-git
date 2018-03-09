#' ---
#' title: "Analysis of the Iris Data"
#' author: "Lester Cajegas"
#' output: html_document
#' ---
#' ###Objective
#' This paper presents the findings for the analysis of the Iris dataset. 

#+ include=FALSE
library(ggplot2)
attach(iris)

#+ echo=TRUE, warnings=F, message=F
plot(Sepal.Length,Sepal.Width, main='Sepal Length vs Sepal Width', xlab='Sepal Length', ylab='Sepal Width')
