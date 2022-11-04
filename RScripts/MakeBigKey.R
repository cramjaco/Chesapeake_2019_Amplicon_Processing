library(tidyverse)
library(here)

#key0 <- read_csv("SampleKey.csv")
filenames_AH <- list.files(here("Raw_AH"))
filenames_LM <- list.files(here("Raw_LM"))

fileDf_AH <- tibble(Run = "AH", Files = filenames_AH)
fileDf_LM <- tibble(Run = "LM", Files = filenames_LM)

fileDf <- bind_rows(fileDf_AH, fileDf_LM)

#fileDf$ID <- str_extract(fileDf$Files, "[^_]+")
fileDf$ID <- str_extract(fileDf$Files, "^.*(?=_S)")
fileDf$ReadDir <- str_extract(fileDf$Files, "_R.")
fileDf$ReadDir <- str_match(fileDf$ReadDir, "[12]")
fileDf$ReadDir <- as.numeric(fileDf$ReadDir)


#key1 <- left_join(fileDf, key0, by = "ID")
key1 <- fileDf %>% mutate(Sample = ID) %>%
  mutate(Station = str_extract(Sample, '^\\d-\\d'),
         Station = str_replace(Station, "-", ".")) %>%
  mutate(Station = if_else(str_detect(Sample, "C_5P1B"), "5.1", Station)) %>% # LM
  mutate(Depth = str_extract(Sample, "(?<=(^\\d-\\d-))\\w")) %>%
  mutate(Depth = if_else(str_detect(Sample, "C_5P1B"), "B", Depth)) %>% # LM
  mutate(Size = str_extract(Sample, "(?<=(^\\d-\\d-\\w-))\\d*(-\\d)?")) %>%
  mutate(Size = if_else(Run == "LM", str_extract(Sample, "(?<=_)[\\dP]+$"), Size)) %>% # LM # str_extract(Size, "(?<=_)[^_]$") # [^_]
  mutate(Size = str_replace(Size, "[-P]", ".")) %>%
  mutate(Type = case_when(
    str_detect(Sample, "PCR-control|H_NC") ~ "PControl",
    str_detect(Sample, "DNA-control|C\\d") ~ "EControl",
    str_detect(Sample, "Mock|H_E|H_S") ~ "Mock",
    str_detect(Sample, "generous-donor|H_GD") ~ "GD",
    TRUE ~ "Sample"
  )
  ) %>%
  mutate(Depth = case_when(
    Type != "Sample" ~ NA_character_,
    TRUE ~ Depth
  )) %>%
  mutate(Size = case_when(
    Type != "Sample" ~ NA_character_,
    TRUE ~ Size
  ))
  
key2 <- key1 %>% 
  # Names of where things are going in guture analyses
  # Paths
  mutate(Paths = paste0("Raw_", Run, "/", Files)) %>%
  # For renaming step
  mutate(RenFiles = paste0(Sample, "_R", ReadDir, "_ren.fastq.gz")) %>%
  mutate(RenPaths = paste0("RenamedSamples/", RenFiles)) %>%
  # For trimming step
  mutate(TrimmedFiles = paste0(Sample, "_R", ReadDir, "_trim.fastq.gz")) %>%
  mutate(TrimmedPaths = paste0("TrimmedSamples/", TrimmedFiles)) %>%
  # For filtering step
  mutate(FilteredFiles = paste0(Sample, "_R", ReadDir, "_filt.fastq.gz")) %>%
  mutate(FilteredPaths = paste0("FilteredSamples/", FilteredFiles)) %>%
  # For dereplicaton step
  mutate(DereplicatedFiles = paste0(Sample, "_R", ReadDir, "_derep.fastq.gz")) %>%
  mutate(DereplicatedFiles = paste0("DereplicatedSamples/", DereplicatedFiles))

Samples <- key1$Sample[seq(from = 1, to = dim(key1)[1], by = 2)]
  

write_csv(key1, here("Keys","SampleKey1.csv"))
write_csv(key2, here("Keys","SampleKey2.csv"))
write_lines(Samples, here("Keys","samples.txt"))

# Minimal key for debugging, only select samples
samples_for_example <- c("4-3-S-0-2", "4-3-S-180", "generous-donor", "H_GD")

key1_minimal <- key1 %>% 
  filter(Sample %in% samples_for_example)

key2_minimal <- key2 %>% 
  filter(Sample %in% samples_for_example)

Samples_minimal <- key1_minimal$Sample[seq(from = 1, to = dim(key1)[1], by = 2)]

write_csv(key1_minimal, here("minimalKeys","SampleKey1.csv"))
write_csv(key2_minimal, here("minimalKeys","SampleKey2.csv"))
write_lines(Samples_minimal, here("minimalKeys","samples.txt"))
