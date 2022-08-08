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

**Docker image - build and run:**
- `docker build -t image-name:tag`
- `docker run --rm -p 3838:3838 image-name:tag`
