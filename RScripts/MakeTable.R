library(dada2)
library(here)
load(here("RDataFiles","Merged.RData"))
seqtab <- makeSequenceTable(merged)
save(seqtab, file = here("RDataFiles","seqtab.RData"))