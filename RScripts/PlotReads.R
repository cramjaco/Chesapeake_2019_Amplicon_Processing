library(tidyverse)
library(dada2)
library(here)

load(here("RDataFiles/LearningErrorsResults.RData"))


plotErrors(err_forward, nominalQ=TRUE) -> forwardErrPlot
plotErrors(err_reverse, nominalQ=TRUE) -> reverseErrPlot

ggsave(here("Figures", "forwardErrPlot.png"), forwardErrPlot)
ggsave(here("Figures", "reverseErrPlot.png"), reverseErrPlot)