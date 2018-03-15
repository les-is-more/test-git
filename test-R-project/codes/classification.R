#' ---
#' title: "Comparison of Classification algorithms"
#' author: "Lester Cajegas"
#' output: 
#'   pdf_document:
#'      fig_caption: yes
#' ---
#' 
#' ##Logistic Regression
#' 
#+ include=F
require(ISLR)
require(knitr)

attach(Smarket)
plot(Volume)

#+ echo=F, message=F
glm.fit=glm(Direction ~ . -Year - Today, data=Smarket,family='binomial')
kable(summary(glm.fit)['coefficients'])
