library(tidyverse)
library(here)
library(dada2)
packageVersion("dada2")

key2 <- read_csv(here("Keys/SampleKey2.csv"))

nb = 1e8
mt = TRUE

set.seed(10033)

err_forward_AH = learnErrors(
  key2 %>% filter(Run == "AH") %>% filter(ReadDir == 1) %>% pull(FilteredPaths),
  nbases = nb,
  randomize = TRUE,
  multithread = mt
  )

err_reverse_AH = learnErrors(
  key2 %>% filter(Run == "AH") %>% filter(ReadDir == 2)  %>% pull(FilteredPaths),
  nbases = nb,
  randomize = TRUE,
  multithread = mt
  )

err_forward_LM = learnErrors(
  key2 %>% filter(Run == "LM") %>% filter(ReadDir == 1) %>% pull(FilteredPaths),
  nbases = nb,
  randomize = TRUE,
  multithread = mt
)

err_reverse_LM = learnErrors(
  key2 %>%  filter(Run == "LM") %>% filter(ReadDir == 2) %>% pull(FilteredPaths),
  nbases = nb,
  randomize = TRUE,
  multithread = mt
)

save(nb, err_forward_AH, err_reverse_AH, err_forward_LM, err_reverse_LM, file = here("RDataFiles/LearningErrorsResults.RData"))