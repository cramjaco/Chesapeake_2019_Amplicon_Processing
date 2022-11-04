library(tidyverse)
library(dada2)
library(here)

key2 <- read_csv(here("Keys/SampleKey2.csv"))

forward_reads_to_plot <- key2 %>% filter(ReadDir == 1 & Type == "GD") %>% pull(TrimmedPaths)

FwdPlot <- plotQualityProfile(here(forward_reads_to_plot))

ggsave(here("Figures/FwdPlot.png"), plot = FwdPlot, width = 6, height = 4, units = "in")

reverse_reads_to_plot <- key2 %>% filter(ReadDir == 2 & Type == "GD") %>% pull(TrimmedPaths)

RevPlot <- plotQualityProfile(here(reverse_reads_to_plot))

ggsave(here("Figures/RevPlot.png"), plot = RevPlot, width = 6, height = 4, units = "in")

## BothDir

BothPlot <- plotQualityProfile(here(c(forward_reads_to_plot, reverse_reads_to_plot)))
ggsave(here("Figures/BothPlot.png"), plot = BothPlot, width = 6, height = 6, units = "in")
