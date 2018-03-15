#' ---
#' title: "Principal Components Analysis"
#' author: "Lester Cajegas"
#' date: "March 10, 2018"
#' output:
#'   pdf_document:
#'        latex_engine: xelatex
#'        fig_caption: yes
#' ---
#' ### Principal Components Analysis
#' 
#' PCA is a technique for reducing the dimension of a *n* x *p* data matrix **X**. The *first principal
#' component* direction of the data is that along which the observations *vary the most*.
#' 
#'$$N(\mu,\sigma) = \frac{1}{\sqrt{2\pi\sigma}}e^{-(\frac{x-\mu}{\sigma})^{2}}$$
#'


#+ include=F
library(normtest)
library(knitr)
library(kableExtra)
library(dplyr)
log.ir <- log(iris[, 1:4])
ir.species <- iris[, 5]
ir.pca <- prcomp(log.ir,
                 center = TRUE,
                 scale. = TRUE) 



#+ echo=F, fig.height = 4, fig.margin= TRUE, fig.width = 6, fig.cap ="Eigenvalue plot" , fig.pos="absolute" , results='asis'
plot(ir.pca, type = "l")

#' ###Normality Test
#' The normality test is conducted to validate the assumption of normality in the residuals. The Jarque-Bera test (`jb.norm.test`)
#' in `normstest` package provide a good level of indication of the data's normality.

#+ echo=F
temp = jb.norm.test(iris$Sepal.Length)
a <- rbind(c("Method: ",temp$method), c("Statistic:",temp$statistic),c("p-value:", temp$p.value))
dimnames(a) <- NULL
kable(a,caption="Normality Test for the dataset")
rm(temp,a)


#' ### Plot
#' The values presented here reflects the shape of the native distribution of the data.

#+ echo=F, results ='asis'
kable(ir.pca$rotation, caption="Principal Components Loadings")
kable(head(ir.pca$x),caption = "Trial Table for caption")


