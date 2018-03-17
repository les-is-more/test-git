setwd('D:/Sandbox/Git Project/Project_One/test-git/test-R-project')
library(rmarkdown)
library(knitr)
# install.packages('tufte')

# rmarkdown::render('codes/princomp.r',output_file = 'princomp.html' ,output_dir = "output")

# rmarkdown::render('codes/princomp.r',output_file = 'princomp.pdf' ,output_dir = "output")

# rmarkdown::render('codes/subset-selection.R',output_file = 'subset.pdf' ,output_dir = "output")

rmarkdown::render('codes/tree-based-methods.R',output_file = 'tree.pdf' ,output_dir = "output")