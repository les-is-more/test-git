setwd('D:/Sandbox/Git Project/Project_One/test-git/test-R-project')
library(rmarkdown)

rmarkdown::render('codes/test-rmd.R',output_file = 'iris.html' ,output_dir = "output")
