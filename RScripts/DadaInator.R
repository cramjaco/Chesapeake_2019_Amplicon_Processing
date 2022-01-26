library(tidyverse)
library(dada2)
library(here)

load(here("RDataFiles","LearningErrorsResults.RData"))
load(here("RDataFiles","DerepInfo.RData"))

mt = TRUE

dada_forward <- dada(derep = derep_forward, err = err_forward, pool = "pseudo", multithread = mt)
dada_reverse <- dada(derep = derep_reverse, err = err_reverse, pool = "pseudo", multithread = mt)

save(dada_forward, dada_reverse, file = here("RDataFiles","Dada.RData"))