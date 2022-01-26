library(tidyverse)
library(dada2)
library(here)

key2 <- read_csv(here("SampleKey2.csv"))

derep_forward <- derepFastq(
  key2 %>% filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(), verbose = TRUE
  )

derep_reverse <- derepFastq(
  key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(), verbose = TRUE
  )

save(file = here("RDataFiles", "DerepInfo.RData"), derep_forward, derep_reverse)
