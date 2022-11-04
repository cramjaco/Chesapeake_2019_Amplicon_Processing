#!/usr/bin/env Rscript --vanilla

library(tidyverse)
library(dada2)
library(here)

load(here("RDataFiles", "seqtab.RData"))
load(here("RDataFiles","seqtab_nochim.RData"))
load(here("RDataFiles","taxa.RData"))

## Making Useful Tables

 # giving our seq headers more manageable names (ASV_1, ASV_2...)
asv_seqs <- colnames(seqtab_nochim)
asv_headers <- vector(dim(seqtab_nochim)[2], mode="character")

for (i in 1:dim(seqtab_nochim)[2]) {
  asv_headers[i] <- paste(">ASV", i, sep="_")
}

  # making and writing out a fasta of our final ASV seqs:
asv_fasta <- c(rbind(asv_headers, asv_seqs))
write(asv_fasta, here("OutTables", "ASVs.fa"))

  # count table:
asv_tab <- t(seqtab_nochim)
row.names(asv_tab) <- sub(">", "", asv_headers)
write.table(asv_tab, here("OutTables", "ASVs_counts.tsv"), sep="\t", quote=F, col.names=NA)

  # tax table:
asv_tax <- taxa
row.names(asv_tax) <- sub(">", "", asv_headers)
write.table(asv_tax, here("OutTables", "ASVs_taxonomy.tsv"), sep="\t", quote=F, col.names=NA)
