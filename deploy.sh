#!/bin/bash

Rscript -e "rsconnect::setAccountInfo(name='suman-muralidharan',token='0E6E5A2B6B4DD6D77AF70CF69C43C7D8',secret='TKbXsT7srAfflr1ov6cubQkfQiejBhx5awDE56Bc')"
Rscript -e "rsconnect::deployApp(appDir='/app/',appName='rshiny-in-nextflow')"
