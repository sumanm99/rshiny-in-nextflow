#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.script ="$baseDir/app.Rmd"

// Define the process
process RShiny {

    input:
    path 'script.Rmd'

    script:
    """
    
    echo "${PWD}"
    Rscript -e "rmarkdown::render('${params.script}')"

    """
}

workflow{
    RShiny(params.script)
}