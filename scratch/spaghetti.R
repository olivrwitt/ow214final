library(tidyverse)

source("R/moving-average.R")

bisley1 <- read_csv("data/bisley1.csv")
bisley2 <- read_csv("data/bisley2.csv")
bisley3 <- read_csv("data/bisley3.csv")
prm <- read_csv("data/prm.csv")

#select relevant columns and label by site
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

bq1_window <- moving_average(cleaned_bis_1)
bq2_window <- moving_average(cleaned_bis_2)
bq3_window <- moving_average(cleaned_bis_3)
prmwindow <- moving_average(cleaned_prm)

complete <- bind_rows(bq1_window, bq2_window, bq3_window, prmwindow)
complete_and_longer <- complete |> 
  pivot_longer(
    cols = c(`NH4-N`, `NO3-N`, K, Ca, Mg),
    names_to = "nutrient", 
    values_to = "concentration"
    )

ggplot(
  data = complete_and_longer,
  mapping = aes(
    x = window_start,
    y = concentration,
    color = Site
  )
) + geom_line()+
  facet_wrap(
    vars(nutrient), 
    scales = "free", 
    ncol = 1
  )

### make a second graph that goes up to this year instead of 1994??