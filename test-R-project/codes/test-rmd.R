#' ---
#' title: "Analysis of the Iris Data"
#' author: "Lester Cajegas"
#' output: 
#'   pdf_document:
#'      fig_caption: yes
#' ---
#' 
#' ###Objective
#' This paper discusses the findings and insights gleaned on the Iris dataset,
#' with emphasis on the use of statistical methodologies and its results.
#' 
#' This paper further delves into the actionable insights:
#' 
#'    * List down 3 wackiest stuff found on the web
#'    * Plot all the relevant graphs
#'      
#' The equation below shows the probability density function of the normal distribution [^1]:
#' [^1]: Wikipedia article
#'  > $N(\mu,\sigma) = \frac{1}{\sqrt{2\pi\sigma}}e^{-(\frac{x-\mu}{\sigma})^{2}}$ 
#' 
#' This analysis aims to uncover the trends in the genomics data.

#+ include=FALSE
library(ggplot2)
attach(iris)
library(knitr)

#+ echo=F, fig.lp ="Fig:", fig.cap ="Sepal Width vs Length"
plot(Sepal.Length,Sepal.Width, xlab='Sepal Length', ylab='Sepal Width')

update_packages("magrittr")


#' ##### Page Break

#+ echo=F, message=F, fig.lp ="Fig:", fig.cap='Distribution of Sepal Length across different Species'
boxplot(Sepal.Length~Species, main="Boxplot", xlab="Species", ylab="Sepal Length", subset=Sepal.Width,col=c("#2a52be","#990000","#228B22"))


#+ 