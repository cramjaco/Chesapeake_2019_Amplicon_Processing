# Load in all of the RData Files
library(tidyverse)
library(purrr)
library(here)
library(dada2)

AllFiles <- list.files(here("RDataFiles"))

AllPaths <- here("RDataFiles", AllFiles)

walk(AllPaths, load, .GlobalEnv)

# Get sample names
samples <- read_lines(here("samples.txt"))
samples <- samples[1:length(samples)-1] # there was a newline at the end of
# samples.txt

# Make the table of summary stats

# set a little function
getN <- function(x) sum(getUniques(x))

# making a little table
dada_summary_tab <- data.frame(row.names=samples, dada2_input=filtered[,1],
                          filtered=filtered[,2], dada_f=sapply(dada_forward, getN),
                          dada_r=sapply(dada_reverse, getN), merged=sapply(merged, getN),
                          nonchim=rowSums(seqtab_nochim),
                          non_chimeric_reads_pct = round(rowSums(seqtab_nochim)/sapply(merged, getN) * 100, 1),
                          final_perc_reads_retained=round(rowSums(seqtab_nochim)/filtered[,1]*100, 1))

dada_summary_tab
# woah, I'm only having chimeras on the large particle
# I wonder how this looks for all the sequences?

dim(seqtab)

dim(seqtab_nochim)
