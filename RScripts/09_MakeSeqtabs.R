# this file both makes sequence tables and combines the AH and LM
# tables into one with mergeSequenceTables
library(dada2)
library(here)
load(here("RDataFiles","Merged.RData"))
seqtab_AH <- makeSequenceTable(merged_AH)
seqtab_LM <- makeSequenceTable(merged_LM)
seqtab <- mergeSequenceTables(seqtab_AH, seqtab_LM)
save(seqtab_AH, seqtab_LM, seqtab, file = here("RDataFiles","seqtabS.RData"))
save(seqtab, file = here("RDataFiles","seqtab.RData"))