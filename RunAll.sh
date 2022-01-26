#!/bin/bash

# The point of this script is to reproduce a problem that I am having
# with the DADA2 pipeline, on a few select samples.
# Goal is allowing someone else to reproduce my problem.

# I start with three samples, all located in `./RenamedSamples/`
# I also have metadata in `SampleKey1.csv` and `SampleKey2.csv`

#First I trim my sequences, with cutadapt
sh Trim.sh
# Forgetting this step is the leading cause of chimeras, but I haven't
# forgotten, and there is evidence that the trimming (parada et al. primers)
# actually happened in the file

Rscript RScripts/PlotQualityProfiles.R

# In filter and trim, I'm being pretty liberal with what I keep maxEE = c(3,5)
# because otherwise, I throw away the bulk of the sequences.
Rscript RScripts/FilterAndTrim.R

Rscript RScripts/LearnErrors.R 

# These look uglyier than other amplicon runs.
Rscript RScripts/PlotReads.R

# Dereplicate
Rscript RScripts/DerepInator.R 

# Run dada
Rscript RScripts/DadaInator.R

# Merge the forward and reverse reads
# this involves a script to concatenate the 18s reads and join the 16s reads.
# which I pulled from I-dont-remember-where
# I think a dada2 help file or maybe an older version of a Mike Lee tutorial.
# Warning Duplicate sequencesin merged output, I think is resolved internally
# after the warning gets thrown.
Rscript RScripts/MergeOnly.R

# Make a table
Rscript RScripts/MakeTable.R

# Remove chimeras
Rscript RScripts/SlayChimeras.R 
# I'm concerned that there are too many chimeras 66% of all sequences in
# my analysis of all of my files.
# Of course, when you take a car to a mechanic, it works better
# and in this example, that number changes.
# Now I have 86% chimeras with just these two files, which is better
# but not great.
# Also there are a *lot* of unique reads.
#I will make a reproducable example on just the GD samples and try to get help from
#DADA2 developers. In the mean time, I"ve checked that I've trimmed the primers, so I'm 
#going to proceed.

# Make a table of statistics per Mike Lee's tutorial.
Rscript RScripts/SummaryTable.R > Summary_Table.txt


