library(tidyverse)
library(dada2)
library(here)

key2 <- read_csv(here("Keys/SampleKey2.csv"))

filtered <- filterAndTrim(
  fwd = key2 %>% filter(ReadDir == 1) %>% pull(TrimmedPaths) %>% here(),
  filt = key2 %>% filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(),
  rev = key2 %>% filter(ReadDir == 2) %>% pull(TrimmedPaths) %>% here(),
  filt.rev = key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(),
  maxEE = c(2,3), # was 3,5
  rm.phix = TRUE, minLen = 175, truncLen = c(230, 220)
)

save(filtered, file = here("RDataFiles/Filtered.RData"))
