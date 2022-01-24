library(tidyverse)
library(dada2)

key2 <- read_csv("SampleKey2.csv")

filtered <- filterAndTrim(
  fwd = key2 %>% filter(ReadDir == 1) %>% pull(TrimmedPaths),
  filt = key2 %>% filter(ReadDir == 1) %>% pull(FilteredPaths),
  rev = key2 %>% filter(ReadDir == 2) %>% pull(TrimmedPaths),
  filt.rev = key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths),
  maxEE = c(3,5),
  rm.phix = TRUE, minLen = 175, truncLen = c(230, 220)
)