### Automate
Mets Spec.

Data reading and cleaning is handled in a standalone script that creates intermediate outputs. The Quarto document runs by itslef, reads intermediate outputs, and completes analysis. All scripts run without errors.

### Organize
Meets Spec

Data and code are organized in labeled separate folders.  Raw data is contained in the data folder, function R scripts are in the R folder, and "spaghetti" code is contained in the scratch folder.  The "moving average" function is defined in "R/", and then used elsewhere.  All code outside the scratch folder is used.

### Document
Meets Spec

The repository contains an effective README with a short but descriptive title and a brief explanation of the repository’s purpose
A concise description of what’s housed in the repository, details regarding data access, and references are all included.