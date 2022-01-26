library(tidyverse)
library(dada2)
library(here)

source(here("JLibrary","MetaCrashLibrary.R"))

load(here("RDataFiles","Dada.RData"))
load(here("RDataFiles","DerepInfo.RData"))

merged <- merge_16s18s(
  dada_forward,
  derep_forward,
  dada_reverse,
  derep_reverse
)

save(merged, file = here("RDataFiles","Merged.RData"))

