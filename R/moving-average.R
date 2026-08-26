# The input to this function should be a data frame containing stream chemistry data
moving_average <- function(cleaned_data) {
  # Initialize a tibble to contain the results
  result <- tibble(
    window_start = seq(ymd("1986-05-20"), ymd("1994-12-30"), by = "9 weeks"),
    Site = NA,
    `NH4-N` = NA,
    `NO3-N` = NA,
    K = NA,
    Ca = NA,
    Mg = NA
  )

  # Fill in the iterator and sequence
  for (i in 1:nrow(result)) {
    # Create variables for the start and end of the current window
    w1 <- result$window_start[i]
    w2 <- w1 + weeks(9)

    # Create a logical vector, called "in_window", that says which samples are inside the window
    # Hint: you'll compare sample dates to the start and end of the window
    in_window <- cleaned_data$Sample_Date >= w1 & cleaned_data$Sample_Date < w2

    # Use indexing to pull out the ion concentrations that fall inside the window
    k_window <- cleaned_data$K[in_window]
    Ca_window <- cleaned_data$Ca[in_window]
    Mg_window <- cleaned_data$Mg[in_window]
    NH4N_window <- cleaned_data$`NH4-N`[in_window]
    NO3N_window <- cleaned_data$`NO3-N`[in_window]

    # Calculate the mean of each ion concentration and fill in the result
    result$K[i] <- mean(k_window, na.rm = TRUE)
    result$Ca[i] <- mean(Ca_window, na.rm = TRUE)
    result$Mg[i] <- mean(Mg_window, na.rm = TRUE)
    result$`NH4-N`[i] <- mean(NH4N_window, na.rm = TRUE)
    result$`NO3-N`[i] <- mean(NO3N_window, na.rm = TRUE)
    result$Site[i] <- cleaned_data$Site
  }
  
  # Return the result
  return(result)
}

