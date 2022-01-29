#!/bin/bash

## Use cut-adapt to trim the primers off of everything
# First activate relevant condas environment, if cutadapt isn't live.

rm -f cutadapt_primer_trimming_stats.txt
rm -f TrimmedSamples/*

for sample in $(cat Keys/samples.txt)
do

    echo "On sample: $sample"
    
    cutadapt -a ^GTGYCAGCMGCCGCGGTAA...AAACTYAAAKRAATTGRCGG \
-A ^CCGYCAATTYMTTTRAGTTT...TTACCGCGGCKGCTGRCAC \
 -m 200 --discard-untrimmed \
    -o TrimmedSamples/${sample}_R1_trim.fastq.gz -p TrimmedSamples/${sample}_R2_trim.fastq.gz \
    RenamedSamples/${sample}_R1_ren.fastq.gz RenamedSamples/${sample}_R2_ren.fastq.gz \
    >> cutadapt_primer_trimming_stats.txt 2>&1
done