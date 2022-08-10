# Suman Internship - Microbiomics, proBiome Suite

This folder contains the scripts for the visualisation of the microbiome data. 
### app.R

An RShiny application for the visualisation of the input tables.

**Input:**
- .csv files - metadata, tax_table and count_table provided via CLI.

**Output:**
- An RShiny app that launches and displays the input tables.

**Running R shiny app from PowerShell:**
- cd to the folder containing "app.R"
- `Rscript -e 'shiny::runApp(launch.browser=T)' tax_table.csv count_table.csv metadata.csv`

### Dockerfile

This Dockerfile is used to build a docker image to run app.R.

**Requirements:**
- app.R
- The input csv files named "metadata", "count_table" and "tax_table" in a folder say "data"

**Docker image - build and run:**
- `docker build -t image-name:tag`
- `docker run --rm -v $(pwd)/data:/srv/shiny-server/data -p 3838:3838 image-name:tag`

**The image is published on docker hub and can be pulled as `docker pull suman20/suman-internship-biolizard`**
