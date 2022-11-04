library(tidyverse)
library(dada2)
library(here)

source(here("JLibrary","MetaCrashLibrary.R"))

load(here("RDataFiles","Dada.RData"))
load(here("RDataFiles","DerepInfo.RData"))

merged_AH <- merge_16s18s(
  dada_forward_AH,
  derep_forward_AH,
  dada_reverse_AH,
  derep_reverse_AH
)

merged_LM <- merge_16s18s(
  dada_forward_LM,
  derep_forward_LM,
  dada_reverse_LM,
  derep_reverse_LM
)

save(merged_AH, merged_LM, file = here("RDataFiles","Merged.RData"))

