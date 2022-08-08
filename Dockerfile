FROM rocker/shiny:4.1.1

RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev

RUN R -e 'install.packages(c(\
              "shiny", \
              "DT" \
            ), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
          )'

EXPOSE 3838

COPY . /srv/shiny-server/

CMD ["/usr/bin/shiny-server"]
