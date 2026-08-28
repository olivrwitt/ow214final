library(tidyverse)

source("R/moving-average.R")

bisley1 <- read_csv("data/bisley1.csv")
bisley2 <- read_csv("data/bisley2.csv")
bisley3 <- read_csv("data/bisley3.csv")
prm <- read_csv("data/prm.csv")

#clean datasets (select relevant columns)
cleaned_bis_1 <- bisley1 |>
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |>
  mutate(Site = "BQ1")
cleaned_bis_2 <- bisley2 |>
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |>
  mutate(Site = "BQ2")
cleaned_bis_3 <- bisley3 |>
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |>
  mutate(Site = "BQ3")
cleaned_prm <- prm |>
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |>
  mutate(Site = "PRM")

#call moving average function to take window averages
bq1_window <- moving_average(cleaned_bis_1)
bq2_window <- moving_average(cleaned_bis_2)
bq3_window <- moving_average(cleaned_bis_3)
prmwindow <- moving_average(cleaned_prm)

#combine datasets and pivot
complete <- bind_rows(bq1_window, bq2_window, bq3_window, prmwindow)
complete_and_longer <- complete |>
  pivot_longer(
    cols = c(`NH4-N`, `NO3-N`, K, Ca, Mg),
    names_to = "nutrient",
    values_to = "concentration"
  )

# write output to output folder
write_csv(complete_and_longer, "output/clean_combine_pivot.csv")
