library(tm) # for text mining
library(magrittr)
library(dplyr)
library(cowplot)

#---- loading and cleaning data ----

Data <- data.table::fread(
  ("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-04-23/week4_australian_salary.csv"), 
  stringsAsFactors = F, data.table = F
) %>% 
  as_tibble() %>% 
  mutate(occupation = iconv(occupation, from = "WINDOWS-1252", to = "UTF-8"), # solving encoding problems
         individuals = as.numeric(individuals), # avoiding integer overflow
         individuals = as.numeric(individuals)) # avoiding integer overflow

#---- Split Data ----

data_split <- split(Data, Data$gender) # split by gender
data_split$Total <- Data # adding a list component with all data

