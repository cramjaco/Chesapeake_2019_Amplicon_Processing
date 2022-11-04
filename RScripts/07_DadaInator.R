library(tidyverse)
library(dada2)
library(here)

load(here("RDataFiles","LearningErrorsResults.RData"))
load(here("RDataFiles","DerepInfo.RData"))

mt = TRUE

dada_forward_AH <- dada(derep = derep_forward_AH, err = err_forward_AH, pool = "pseudo", multithread = mt)
dada_reverse_AH <- dada(derep = derep_reverse_AH, err = err_reverse_AH, pool = "pseudo", multithread = mt)

dada_forward_LM <- dada(derep = derep_forward_LM, err = err_forward_LM, pool = "pseudo", multithread = mt)
dada_reverse_LM <- dada(derep = derep_reverse_LM, err = err_reverse_LM, pool = "pseudo", multithread = mt)

save(dada_forward_AH, dada_reverse_AH, dada_forward_LM, dada_reverse_LM, file = here("RDataFiles","Dada.RData"))