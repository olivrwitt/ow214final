### Automate
Meets spec.

Oliver's code runs without issues.  
Cleaning up the data is automated and is easy to follow. I would say that in `1_clean_data.R`, the `select()` function in selecting columns with the ions would be redundant, as the ion concentration is being selected in `moving-average.R`. It would help reduce a few line in your code, with only the `mutate()` function being relevant to cleaning up your data before running the dataframe through `moving_average()`. This is not critical, just a suggestion to clean up your code :)  
I like how your lines in your plot show up, I was not familar with the `linetype` parameter, I will be using that in my own code.

### Organize
Meets Spec

All files and folders are clearly labeled. The R scripts are where they should be given their purpose.

### Document
Meets Spec

The README is easy to follow, all the folders are listed with a clear description of what the folder is for. Only folder that is not explicitly mentioned is the `paper` folder, however the Quarto file has a corresponding explanation.  
I like how you mentioned that the `output` folder has files generated from `1_clean_data.R`. I will be adding that to my own README.  

Suggestion for the Quarto code blocks:  
use
```
# | echo = FALSE
# | warnings = FALSE
```
to not have the outputs printed out