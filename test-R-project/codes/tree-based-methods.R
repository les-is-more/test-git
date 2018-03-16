#' ---
#' title: "Tree-Based Methods"
#' author: "Lester Cajegas"
#' date: "March 16, 2018"
#' output:
#'   pdf_document:
#'        latex_engine: pdflatex
#'        fig_caption: yes
#' ---
#' 
#' ##Regression Tree
#' 
#' The goal of regression tree is to find boxes/rectangles
#' $R_{1}$,...,$R_{j}$ that minimize the RSS, given by 
#' 
#' $$\sum_{j=1}^J \sum_{i\in R_{j}} (y_{i} - \hat{y}_{R_{j}})^2 $$
#' 
#' ## Tree Pruning
#' 
#' Training a regression tree may produce complex structures that
#' can overfit the training data, leading to a poor test set performance.
#' To overcome the said issue, one can build a tree so long as it decreases
#' in the RSS due to each split exceeding some (high) threshold.
#' 
#' 
#' ### Cost Complexity Pruning
#' 
#' Also known as *weakest link pruning*, the *cost complexity pruning* considers a 
#' sequence of trees indexed by a nonnegative tuning parameter $\alpha$ .
#' 
#' For each value of $\alpha$, there corresponds a subtree $T \subset T_{0}$, such that:
#' 
#' 
#' $$\sum_{m=1}^{|T|} \sum_{i: x_{i} \in R_{m}} (y_{i} - \hat{y}_{R_{m}})^2 + \alpha |T| $$