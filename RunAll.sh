#!/bin/bash



# The point of this script is to reproduce a problem that I am having
# with the DADA2 pipeline, on a few select samples.
# Goal is allowing someone else to reproduce my problem.

# I start with three samples, all located in `./RenamedSamples/`
# I also have metadata in `SampleKey1.csv` and `SampleKey2.csv`

#First I trim my sequences, with cutadapt
echo "Step 1 -- Trimming Primers"
sh Trim.sh
# Forgetting this step is the leading cause of chimeras, but I haven't
# forgotten, and there is evidence that the trimming (parada et al. primers)
# actually happened in the file

echo "Step 2 -- Plot Quality Profiles"
Rscript RScripts/PlotQualityProfiles.R

# In filter and trim, I'm being pretty liberal with what I keep maxEE = c(3,5)
# because otherwise, I throw away the bulk of the sequences.
echo "Step 3 -- Filtering Sequences"
Rscript RScripts/FilterAndTrim.R

echo "Step 4 -- Learning Errors"
Rscript RScripts/LearnErrors.R 

# These look uglyier than other amplicon runs.
echo "Step 5 -- Plotting Reads"
Rscript RScripts/PlotReads.R

# Dereplicate
echo "Step 6 -- Dereplicating"
Rscript RScripts/DerepInator.R 

# Run dada
echo "Step 7 -- Running Dada"
Rscript RScripts/DadaInator.R

# Merge the forward and reverse reads
# this involves a script to concatenate the 18s reads and join the 16s reads.
# which I pulled from I-dont-remember-where
# I think a dada2 help file or maybe an older version of a Mike Lee tutorial.
# Warning Duplicate sequencesin merged output, I think is resolved internally
# after the warning gets thrown.
echo "Step 8 -- Merging 16s and Concatinating 18s sequences"
Rscript RScripts/MergeOnly.R

# Make a table
echo "Step 9 -- Make sequence table"
Rscript RScripts/MakeTable.R

# Remove chimeras
echo "Step 10 -- Remove Chimeras"
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

echo "Step 11 -- Summarize Results"
Rscript RScripts/SummaryTable.R > Summary_Table.txt


