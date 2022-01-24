library(tidyverse)
library(dada2)

source("MetaCrashLibrary.R")

load("Dada.RData")
load("DerepInfo.RData")

merged <- merge_16s18s(
  dada_forward,
  derep_forward,
  dada_reverse,
  derep_reverse
)

save(merged, file = "Merged.RData")

