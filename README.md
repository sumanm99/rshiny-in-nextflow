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

This Dockerfile is used to build a docker image to deploy app.R onto the shiny server https://www.shinyapps.io/.

**Requirements:**
- app.R
- deploy.sh
- The input csv files named "metadata", "count_table" and "tax_table" in a folder say "data"

**Docker image - build and run:**
- `docker build -t image-name:tag`
- `docker run --rm -v $(pwd)/data:/app/data image-name:tag`

**The image is published on docker hub and can be pulled as `docker pull suman20/suman-internship-biolizard`**

### main.nf

A nextflow pipeline to run the docker image that deploys app.R onto the shiny server.

**Requirements:**
- nextflow.config
- The input csv files named "metadata", "count_table" and "tax_table" in a folder named "data"
- Create scm file in ./nextflow folder of the linux home directory  
```	
providers {  
	   github {  
	       user = 'username'  
	       platform = 'github'  
	       password = 'password/PAT'  
	   }  
	}
```  

**Running main.nf from CLI:**
- `nextflow run https://github.com/lizard-bio/rshiny-in-nextflow -r master`
