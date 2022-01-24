library(tidyverse)
library(dada2)

load("LearningErrorsResults.RData")
load("DerepInfo.RData")

mt = TRUE

dada_forward <- dada(derep = derep_forward, err = err_forward, pool = "pseudo", multithread = mt)
dada_reverse <- dada(derep = derep_reverse, err = err_reverse, pool = "pseudo", multithread = mt)

save(dada_forward, dada_reverse, file = "Dada.RData")