# Chesapeake Bay Run Chimeras Issue
Author: Jacob Cram
Email: jcram at umces dot edu

This is a smaller reproducable version of the DADA2 pipeline that was behaving in two strange ways. (1) many many sequences in the sequence table and (2) a very high proportion of chimeras for some, but not all samples.

To see what the pipeline is doing see the file `RunAll.sh`, which includes comments describing what I did.


The raw data are in the `RenamedSamples` directory.

Empty folders are for intermediate files. `renv` should have tracked all dependencies in R, cutadapt was installed through conda.

