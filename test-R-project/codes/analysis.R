library(magrittr)
library(tidyverse)
library(lubridate)
require(xtable)
library(kableExtra)
library(knitr)
options(knitr.table.format = "latex")

options(xtable.floating = FALSE)
options(xtable.timestamp = "")
options(results='as.is')

setwd('D:/EBQ')

ebqall %>%  filter(is.na(conversion_quantity)) %>% group_by(user_id) %>% summarise(count=n()) %>%
  arrange(desc(count)) %>% head()

a = ebqall %>% 
  mutate(conv=ifelse(is.na(conversion_quantity),0,1)) %>%
  select(path_id, conv) %>%
  unique()

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, levels = c("4","6","8"),
                     labels = c("four","six","eight"))
tbl <- ftable(mtcars$cyl, mtcars$vs, mtcars$am, mtcars$gear,
              row.vars = c(2, 4),
              dnn = c("Cylinders", "V/S", "Transmission", "Gears"))


knitr::kable(
  head(mtcars[, 1:8], 10), booktabs = TRUE,
  caption = 'A table of the first 10 rows of the mtcars data.'
)

kable(tbl,format="latex",booktabs=TRUE)
