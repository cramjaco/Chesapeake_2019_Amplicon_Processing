library(dada2)
load("Merged.RData")
seqtab <- makeSequenceTable(merged)
save(seqtab, file = "seqtab.RData")