library(tidyverse)
library(dada2)
library(here)

key2 <- read_csv(here("Keys/SampleKey2.csv"))

derep_forward_AH <- derepFastq(
  key2 %>% filter(Run == "AH") %>%filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(), verbose = TRUE
  )

derep_reverse_AH <- derepFastq(
  key2 %>% filter(Run == "AH") %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(), verbose = TRUE
  )

derep_forward_LM <- derepFastq(
  key2 %>% filter(Run == "LM") %>%filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(), verbose = TRUE
)

derep_reverse_LM <- derepFastq(
  key2 %>% filter(Run == "LM") %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(), verbose = TRUE
)

save(file = here("RDataFiles", "DerepInfo.RData"), derep_forward_AH, derep_reverse_AH,
     derep_forward_LM, derep_reverse_LM)
