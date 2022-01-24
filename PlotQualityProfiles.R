library(tidyverse)
library(dada2)

key2 <- read_csv("SampleKey2.csv")

forward_reads_to_plot <- key2 %>% filter(ReadDir == 1 & Sample %in% c("generous-donor", "4-3-S-0-2", "4-3-S-180")) %>% pull(TrimmedPaths)

FwdPlot <- plotQualityProfile(forward_reads_to_plot)

ggsave("FwdPlot.png", plot = FwdPlot, width = 6, height = 4, units = "in")

reverse_reads_to_plot <- key2 %>% filter(ReadDir == 2 & Sample %in% c("generous-donor", "4-3-S-0-2", "4-3-S-180")) %>% pull(TrimmedPaths)

RevPlot <- plotQualityProfile(reverse_reads_to_plot)

ggsave("RevPlot.png", plot = RevPlot, width = 6, height = 4, units = "in")

## Actually looks pretty ok.