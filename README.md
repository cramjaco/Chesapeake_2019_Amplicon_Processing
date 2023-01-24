# Chesapeake Bay Amplicon Run 2019
Author: Jacob Cram
Email: jcram at umces dot edu
This project contains the scripts for the DADA2 pipeline used to analyze the particle size frction data from the Chesapeake Bay in 2019.
It does not contain the raw data files, which are too large for github. Similar files are available on Short Read Archive submission number SUB12252528.

To see what the pipeline is doing see the file `RunAll.sh`, which includes comments describing what I did.


The raw data are in the `RenamedSamples` directory.

Empty folders are for intermediate files. `renv` should have tracked all dependencies in R, cutadapt was installed through conda.


Also RunAll.job runs RunAll.sh on the Horn Point Laboratory HPCC

Note, on my computer I have a conda environment called `cutadaptenv` that
has cutadapt in it. This environment is called in the job file.
