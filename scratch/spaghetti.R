library(tidyverse)
bisley1 <- read_csv("data/bisley1.csv")
bisley2 <- read_csv("data/bisley2.csv")
bisley3 <- read_csv("data/bisley3.csv")
prm <- read_csv("data/prm.csv")

#keep columns: 
# - Sample_Date
# - NH4-N
# - NO3-N
# - K
# - Ca
# - Mg

#select relevant columns and label by site
cleaned_bis_1 <- bisley1 |> 
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |> 
  mutate(Site = "bis1")
cleaned_bis_2 <- bisley2 |> 
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |> 
  mutate(Site = "bis2")
cleaned_bis_3 <- bisley3 |> 
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |> 
  mutate(Site = "bis3")
cleaned_prm <- prm |> 
  select(`NH4-N`, `NO3-N`, Sample_Date, K, Ca, Mg) |> 
  mutate(Site = "prm")




# new tables for 9 week moving averages for each site
bis_window_1 <- tibble (
  window_start = seq(ymd("1986-05-20"), ymd("1994-12-30"), by = "9 weeks"),
  Site = "bis1",
  `NH4-N` = NA,
  `NO3-N` = NA,
  K = NA,
  Ca = NA,
  Mg = NA
)
bis_window_2 <- tibble (
  window_start = seq(ymd("1986-05-20"), ymd("1994-12-30"), by = "9 weeks"),
  Site = "bis2",
  `NH4-N` = NA,
  `NO3-N` = NA,
  K = NA,
  Ca = NA,
  Mg = NA
)
bis_window_3 <- tibble (
  window_start = seq(ymd("1986-05-20"), ymd("1994-12-30"), by = "9 weeks"),
  Site = "bis3",
  `NH4-N` = NA,
  `NO3-N` = NA,
  K = NA,
  Ca = NA,
  Mg = NA
)
prm_window <- tibble (
  window_start = seq(ymd("1986-05-20"), ymd("1994-12-30"), by = "9 weeks"),
  Site = "prm",
  `NH4-N` = NA,
  `NO3-N` = NA,
  K = NA,
  Ca = NA,
  Mg = NA
)


## create a moving window average for each dataset
# Bis 1:
for(i in 1:nrow(bis_window_1)){
  w1 <- bis_window_1$window_start[i]
  w2 <- w1 + 9

  `NH4-N` <- cleaned_bis_1$`NH4-N`[cleaned_bis_1$Sample_Date >= w1 & cleaned_bis_1$Sample_Date < w2]
  `NO3-N` <- cleaned_bis_1$`NO3-N`[cleaned_bis_1$Sample_Date >= w1 & cleaned_bis_1$Sample_Date < w2]
  K <- cleaned_bis_1$K[cleaned_bis_1$Sample_Date >= w1 & cleaned_bis_1$Sample_Date < w2]
  Ca <- cleaned_bis_1$Ca[cleaned_bis_1$Sample_Date >= w1 & cleaned_bis_1$Sample_Date < w2]
  Mg <- cleaned_bis_1$Mg[cleaned_bis_1$Sample_Date >= w1 & cleaned_bis_1$Sample_Date < w2]
  Site <- cleaned_bis_1$Site[w1]

  bis_window_1$`NH4-N`[i] <- mean(`NH4-N`, na.rm = TRUE)
  bis_window_1$`NO3-N`[i] <- mean(`NO3-N`, na.rm = TRUE)
  bis_window_1$K[i] <- mean(K, na.rm = TRUE)
  bis_window_1$Ca[i] <- mean(Ca, na.rm = TRUE)
  bis_window_1$Mg[i] <- mean(Mg, na.rm = TRUE)
  
}

# Bis 2:
for(i in 1:nrow(bis_window_2)){
  w1 <- bis_window_2$window_start[i]
  w2 <- w1 + 9

  `NH4-N` <- cleaned_bis_2$`NH4-N`[cleaned_bis_2$Sample_Date >= w1 & cleaned_bis_2$Sample_Date < w2]
  `NO3-N` <- cleaned_bis_2$`NO3-N`[cleaned_bis_2$Sample_Date >= w1 & cleaned_bis_2$Sample_Date < w2]
  K <- cleaned_bis_2$K[cleaned_bis_2$Sample_Date >= w1 & cleaned_bis_2$Sample_Date < w2]
  Ca <- cleaned_bis_2$Ca[cleaned_bis_2$Sample_Date >= w1 & cleaned_bis_2$Sample_Date < w2]
  Mg <- cleaned_bis_2$Mg[cleaned_bis_2$Sample_Date >= w1 & cleaned_bis_2$Sample_Date < w2]
  Site <- cleaned_bis_2$Site[w1]

  bis_window_2$`NH4-N`[i] <- mean(`NH4-N`, na.rm = TRUE)
  bis_window_2$`NO3-N`[i] <- mean(`NO3-N`, na.rm = TRUE)
  bis_window_2$K[i] <- mean(K, na.rm = TRUE)
  bis_window_2$Ca[i] <- mean(Ca, na.rm = TRUE)
  bis_window_2$Mg[i] <- mean(Mg, na.rm = TRUE)
  
}


# Bis 3:
for(i in 1:nrow(bis_window_3)){
  w1 <- bis_window_3$window_start[i]
  w2 <- w1 + 9

  `NH4-N` <- cleaned_bis_3$`NH4-N`[cleaned_bis_3$Sample_Date >= w1 & cleaned_bis_3$Sample_Date < w2]
  `NO3-N` <- cleaned_bis_3$`NO3-N`[cleaned_bis_3$Sample_Date >= w1 & cleaned_bis_3$Sample_Date < w2]
  K <- cleaned_bis_3$K[cleaned_bis_3$Sample_Date >= w1 & cleaned_bis_3$Sample_Date < w2]
  Ca <- cleaned_bis_3$Ca[cleaned_bis_3$Sample_Date >= w1 & cleaned_bis_3$Sample_Date < w2]
  Mg <- cleaned_bis_3$Mg[cleaned_bis_3$Sample_Date >= w1 & cleaned_bis_3$Sample_Date < w2]
  Site <- cleaned_bis_3$Site[w1]

  bis_window_3$`NH4-N`[i] <- mean(`NH4-N`, na.rm = TRUE)
  bis_window_3$`NO3-N`[i] <- mean(`NO3-N`, na.rm = TRUE)
  bis_window_3$K[i] <- mean(K, na.rm = TRUE)
  bis_window_3$Ca[i] <- mean(Ca, na.rm = TRUE)
  bis_window_3$Mg[i] <- mean(Mg, na.rm = TRUE)
  
}

# PRM:
for(i in 1:nrow(prm_window)){
  w1 <- prm_window$window_start[i]
  w2 <- w1 + 9

  `NH4-N` <- cleaned_prm$`NH4-N`[cleaned_prm$Sample_Date >= w1 & cleaned_prm$Sample_Date < w2]
  `NO3-N` <- cleaned_prm$`NO3-N`[cleaned_prm$Sample_Date >= w1 & cleaned_prm$Sample_Date < w2]
  K <- cleaned_prm$K[cleaned_prm$Sample_Date >= w1 & cleaned_prm$Sample_Date < w2]
  Ca <- cleaned_prm$Ca[cleaned_prm$Sample_Date >= w1 & cleaned_prm$Sample_Date < w2]
  Mg <- cleaned_prm$Mg[cleaned_prm$Sample_Date >= w1 & cleaned_prm$Sample_Date < w2]
  Site <- cleaned_prm$Site[w1]

  prm_window$`NH4-N`[i] <- mean(`NH4-N`, na.rm = TRUE)
  prm_window$`NO3-N`[i] <- mean(`NO3-N`, na.rm = TRUE)
  prm_window$K[i] <- mean(K, na.rm = TRUE)
  prm_window$Ca[i] <- mean(Ca, na.rm = TRUE)
  prm_window$Mg[i] <- mean(Mg, na.rm = TRUE)
  
}



full_data <- bind_rows(bis_window_1, bis_window_2, bis_window_3, prm_window)

ggplot(
  
)
