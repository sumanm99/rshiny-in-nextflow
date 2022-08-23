FROM rocker/shiny:4.1.1

RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev

RUN R -e 'install.packages(c(\
              "shiny", \
              "rsconnect", \
	      "shinyWidgets", \
              "DT" \
            ), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
          )'

RUN mkdir -p /app

COPY . /app/

CMD ["/bin/bash","-c","/app/deploy.sh"]
