library(tidyverse)
library(dada2)
library(here)
library(decontam)

key1 <- read_csv(here("Keys","SampleKey1.csv"))

keyF <- key1 %>% filter(ReadDir == 1)

load(here("RDataFiles","seqtab_nochim.RData"))
load(here("RDataFiles","taxa.RData"))

negatives <- str_detect(keyF$Type, "Control")

ic <- isContaminant(seqtab = seqtab_nochim, neg = negatives)
table(ic$contaminant)

seqtab_decontam <- seqtab_nochim[,!ic$contaminant]

save(seqtab_decontam, file = here("RDataFiles", "seqtab_decontam.RData"))

sessionInfo()

## I'm not going to use this decontaminated data. Its only a few ASVs
## and they may contain my spikes. I don't expect an overall
## difference.