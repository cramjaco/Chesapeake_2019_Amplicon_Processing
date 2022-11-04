library(tidyverse)
library(dada2)
library(here)

load(here("RDataFiles/LearningErrorsResults.RData"))


plotErrors(err_forward_AH, nominalQ=TRUE) -> forwardErrPlot_AH
plotErrors(err_reverse_AH, nominalQ=TRUE) -> reverseErrPlot_AH

plotErrors(err_forward_LM, nominalQ=TRUE) -> forwardErrPlot_LM
plotErrors(err_reverse_LM, nominalQ=TRUE) -> reverseErrPlot_LM

ggsave(here("Figures", "forwardErrPlot_AH.png"), forwardErrPlot_AH)
ggsave(here("Figures", "reverseErrPlot_AH.png"), reverseErrPlot_AH)

ggsave(here("Figures", "forwardErrPlot_LM.png"), forwardErrPlot_LM)
ggsave(here("Figures", "reverseErrPlot_LM.png"), reverseErrPlot_LM)
