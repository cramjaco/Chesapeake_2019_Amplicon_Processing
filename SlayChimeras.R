library(dada2)
load(file = "seqtab.RData")

seqtab_nochim <- removeBimeraDenovo(seqtab, verbose = TRUE, method = "pooled", multithread = TRUE)

save(seqtab, seqtab_nochim, file = "seqtab_both.RData")

sum(seqtab_nochim)/sum(seqtab)
# 0.914