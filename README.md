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
