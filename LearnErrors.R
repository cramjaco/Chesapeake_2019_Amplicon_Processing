library(tidyverse)
library(dada2)
packageVersion("dada2")

key2 <- read_csv("SampleKey2.csv")

nb = 1e8
mt = TRUE

set.seed(10033)

err_forward = learnErrors(
  key2 %>% filter(ReadDir == 1) %>% pull(FilteredPaths),
  nbases = nb,
  randomize = TRUE,
  multithread = mt
  )

err_reverse = learnErrors(
  key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths),
  nbases = nb,
  randomize = TRUE,
  multithread = mt
  )

save(nb, err_forward, err_reverse, file = "LearningErrorsResults.RData")