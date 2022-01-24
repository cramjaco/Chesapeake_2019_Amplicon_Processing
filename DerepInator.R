library(tidyverse)
library(dada2)

key2 <- read_csv("SampleKey2.csv")

derep_forward <- derepFastq(
  key2 %>% filter(ReadDir == 1) %>% pull(FilteredPaths), verbose = TRUE
  )

derep_reverse <- derepFastq(
  key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths), verbose = TRUE
  )

save(file = "DerepInfo.RData", derep_forward, derep_reverse)
