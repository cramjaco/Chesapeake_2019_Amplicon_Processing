#!/usr/bin/env Rscript --vanilla

library(tidyverse)
library(dada2)
library(here)

mt = TRUE

load(here("RDataFiles", "seqtab_nochim.RData"))

taxa <- assignTaxonomy(seqtab_nochim, "Reference/silva_nr_v132_train_set_spike.fa.gz", tryRC=T, multithread = mt)

save(taxa, file = here("RDataFiles", "taxa.RData"))

