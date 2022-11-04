# Load in all of the RData Files
library(tidyverse)
library(purrr)
library(here)
library(dada2)

AllFiles <- list.files(here("RDataFiles"))

AllPaths <- here("RDataFiles", AllFiles)

walk(AllPaths, load, .GlobalEnv)

# Get sample names
samples <- read_lines(here("Keys/samples.txt"))
#samples <- samples[1:length(samples)-1] # there was a newline at the end  samples.txt once

# Make the table of summary stats

# set a little function
getN <- function(x) sum(getUniques(x))

# making a little table
dada_summary_tab <- data.frame(row.names=samples, 
                               input_fwd=filtered[,1],
                               input_rev=filtered[,2],
                          dada_f=c(sapply(dada_forward_AH, getN),
                                   sapply(dada_forward_LM, getN)),
                          dada_r=c(sapply(dada_reverse_AH, getN),
                                   sapply(dada_reverse_LM, getN)),
                          merged=rowSums(seqtab),
                          nonchim=rowSums(seqtab_nochim),
                          non_chimeric_reads_pct = round(rowSums(seqtab_nochim)/rowSums(seqtab) * 100, 1),
                          final_perc_reads_retained=round(rowSums(seqtab_nochim)/filtered[,1]*100, 1))

dada_summary_tab

write.csv(dada_summary_tab, here("OutTables", "RunSummaryStatistics.csv"))
# woah, I'm only having chimeras on the large particle
# I wonder how this looks for all the sequences?

dim(seqtab)

dim(seqtab_nochim)
