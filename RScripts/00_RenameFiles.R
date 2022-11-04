library(tidyverse)
library(here)

## Bring in Sample Key
key2 <- read_csv(here("Keys", "SampleKey2.csv"))
attach(key2)

## Clear out RenamedSamples
do.call(file.remove, list(list.files("RenamedSamples", full.names = TRUE)))

## Give files better names and put in RenamedSamples folder
file.copy(from = here(Paths), to = here(RenPaths))
