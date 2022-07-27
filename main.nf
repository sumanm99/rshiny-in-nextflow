#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.script ="$baseDir"

//params.input = "$launchDir/*.csv"

// Create channel
//reads_ch = Channel.from(params.input)

// Define the process
process RShiny {

    input:
    path script

    script:
    """
    echo "${params.script}"
    Rscript -e 'shiny::runApp("${params.script}",launch.browser=T)'

    """
    // Rscript -e "rmarkdown::render('${PWD}/app.Rmd')"
    //Rscript -e 'shiny::runApp(launch.browser=T)' ${read}
}

//cp -L ${PWD}/app.Rmd  app.Rmd

workflow{
    //RShiny(reads_ch)
    RShiny(params.script)
}