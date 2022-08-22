#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.script ="$baseDir"

// Define the process
process RShiny {

    input:
    path script

    script:
    """
    echo "${params.script}"
    #docker run --rm -v ${params.script}/data:/app/data suman20/suman-internship-biolizard
    docker run --rm -v ${params.script}/data:/app/data my-rshiny-app:rsconnect
    """
    //docker run --rm -v ${PWD}/data:/app/data suman20/suman-internship-biolizard
}

workflow{
    RShiny(params.script)
}

workflow.onComplete {
    //println "Pipeline completed at: $workflow.complete"
    println "Execution status: ${ workflow.success ? 'App deployed at https://suman-muralidharan.shinyapps.io/rshiny-in-nextflow' : 'Failed to deploy the application' }"
}