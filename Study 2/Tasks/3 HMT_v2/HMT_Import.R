library(tidyverse)
library(data.table)
library(here)


# Set Path and Options
path <- here()

# Import HMT Data

HMT <- list.files(paste0(path, "/data"), ".csv", full.names = T) %>% 
  map(read.csv) %>% 
  rbindlist(fill=TRUE) %>% 
  group_by(participant) %>%
  summarise(HMT_sum_correct = sum(correct, na.rm=TRUE))  %>%
  rename(Subject=participant) %>% drop_na()


