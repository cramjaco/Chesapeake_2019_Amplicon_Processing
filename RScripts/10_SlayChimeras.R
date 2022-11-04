library(dada2)
library(here)

load(file = here("RDataFiles","seqtab.RData"))

seqtab_nochim <- removeBimeraDenovo(seqtab, verbose = TRUE, method = "pooled", multithread = TRUE)

save(seqtab_nochim, file = here("RDataFiles", "seqtab_nochim.RData"))

sum(seqtab_nochim)/sum(seqtab)