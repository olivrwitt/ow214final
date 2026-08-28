moving_average <- function(cleaned_data) {
  result <- tibble(
    #set up 9 week windows and empty data frame
    window_start = seq(ymd("1988-01-01"), ymd("1994-12-30"), by = "9 weeks"),
    Site = NA,
    `NH4-N` = NA,
    `NO3-N` = NA,
    K = NA,
    Ca = NA,
    Mg = NA
  )
  for (i in 1:nrow(result)) {
    #iterate through cleaned data
    w1 <- result$window_start[i]
    w2 <- w1 + weeks(9)
    in_window <- cleaned_data$Sample_Date >= w1 & cleaned_data$Sample_Date < w2
    # take all values that fall in the window
    k_window <- cleaned_data$K[in_window]
    Ca_window <- cleaned_data$Ca[in_window]
    Mg_window <- cleaned_data$Mg[in_window]
    NH4N_window <- cleaned_data$`NH4-N`[in_window]
    NO3N_window <- cleaned_data$`NO3-N`[in_window]
    #means of values in window
    result$K[i] <- mean(k_window, na.rm = TRUE)
    result$Ca[i] <- mean(Ca_window, na.rm = TRUE)
    result$Mg[i] <- mean(Mg_window, na.rm = TRUE)
    result$`NH4-N`[i] <- mean(NH4N_window, na.rm = TRUE)
    result$`NO3-N`[i] <- mean(NO3N_window, na.rm = TRUE)
    result$Site[i] <- cleaned_data$Site
  }
  return(result)
}
