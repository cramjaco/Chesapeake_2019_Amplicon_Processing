library(tidyverse)
library(dada2)
library(here)

key2 <- read_csv(here("Keys/SampleKey2.csv"))

key2_AH <- key2 %>% filter(Run == "AH")
key2_LM <- key2 %>% filter(Run == "LM")

# will run similarly for "consistancy" whateve thats worth
filtered <- filterAndTrim(
  fwd = key2 %>% filter(ReadDir == 1) %>% pull(TrimmedPaths) %>% here(),
  filt = key2 %>% filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(),
  rev = key2 %>% filter(ReadDir == 2) %>% pull(TrimmedPaths) %>% here(),
  filt.rev = key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(),
  maxEE = c(3,5), # was 3,5, then 2,3 # 1,2 before Sep 2022, back to 3,5
  rm.phix = TRUE, minLen = 175, truncLen = c(230, 220)
)

# filtered_AH <- filterAndTrim(
#   fwd = key2_AH %>% filter(ReadDir == 1) %>% pull(TrimmedPaths) %>% here(),
#   filt = key2_AH %>% filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(),
#   rev = key2_AH %>% filter(ReadDir == 2) %>% pull(TrimmedPaths) %>% here(),
#   filt.rev = key2_AH %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(),
#   maxEE = c(3,5), # was 3,5, then 2,3 # 1,2 before Sep 2022, back to 3,5
#   rm.phix = TRUE, minLen = 175, truncLen = c(230, 220)
# )
# 
# filtered_LM <- filterAndTrim(
#   fwd = key2_LM %>% filter(ReadDir == 1) %>% pull(TrimmedPaths) %>% here(),
#   filt = key2_LM %>% filter(ReadDir == 1) %>% pull(FilteredPaths) %>% here(),
#   rev = key2_LM %>% filter(ReadDir == 2) %>% pull(TrimmedPaths) %>% here(),
#   key2_LM = key2 %>% filter(ReadDir == 2) %>% pull(FilteredPaths) %>% here(),
#   maxEE = c(1,2), # was 3,5, then 2,3 # 1,2 before Sep 2022, back to 3,5
#   rm.phix = TRUE, minLen = 175, truncLen = c(230, 220)
# )

save(filtered, file = here("RDataFiles/Filtered.RData"))
