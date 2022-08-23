# Visualization using R shiny

options(shiny.port=3838)

library(shiny)
library(DT)
library(shinyWidgets)


#data

tax_table <- read.csv("./data/tax_table.csv", header=T)
count_table <- read.csv("./data/count_table.csv", header=T)
metadata <- read.csv("./data/metadata.csv", header=T)

remove_bold <-"
#expr-container label {
  font-weight: 400;
}
"

ui <- fluidPage(
  navbarPage(
    "proBiome Analytics Suite",
    tags$style(HTML(
      ".navbar{
      background-color: Black;
      font-weight: bold;
      padding-left: 15px;}
      .navbar-default .navbar-nav > .active > a,
      .navbar-default .navbar-nav > .active > a:focus,
      .navbar-default .navbar-nav > .active > a:hover {color:white;background-color:black;}"
    )),
    tabPanel(
      "Data", icon=icon("table"),
      fluidPage(
        dataTableOutput("table1"),
        br(),
        dataTableOutput("table2"),
        br(),
        dataTableOutput("table3")
      )
    ),
    tabPanel(
      "Taxonomy assignments", icon=icon("chart-bar"),
      # HTML('<p> <style="font-size: 15pt; class="fa">&#xf080 Taxonomy assignments</p>'),
      mainPanel(
        tabsetPanel(type="tabs",
                    tabPanel("Taxa composition",
                             tags$style(remove_bold),
                             tags$div(id = "expr-container",
                             fluidRow(
                               column(3,sliderInput("topn", "Top N",
                                           min=0, max=292,
                                           value=20),
                                      tags$style({"font-weight: 400;"})),
                               column(2, tags$p("Compute absolute counts?"),
                                      switchInput("counts", "Choice",
                                                     value=,
                                                     onLabel = "Yes", offLabel = "No",
                                                     onStatus = "Yes",
                                                     offStatus = "No"),
                                      tags$head(tags$style(HTML('.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-Yes,
                                       .bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-Yes {
                                        background: green;
                                        color: white;
                                        }'))),
                                      tags$head(tags$style(HTML('.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-No,
                                       .bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-No {
                                        background: red;
                                        color: white;
                                        }')))),
                               column(3, selectInput("taxa", "Choose the taxa level",
                                                  c("Genus", "Family", "Species"))),
                               column(3, textInput("group",
                                                   label ="Choose the grouping level",
                                                   value = "1"))
                             ))),
                    tabPanel("Taxa abundance")
        )
      )
    ),
    tabPanel(
      "Diversity analysis", icon=icon("braille")
      # HTML('<p> <style="font-size: 15pt;" class="fa">&#xf2a1 Diversity analysis</p>')
    ),
    tabPanel(
      "Lefse analysis", icon=icon("delicious")
      # HTML('<p> <style="font-size: 15pt;" class="fab">&#xf1a5 Lefse analysis</p>')
    ),
    tabPanel(
      "TreeclimbR analysis", icon=icon("delicious")
      # HTML('<p> <style="font-size: 15pt;" class="fab">&#xf1a5 TreeclimbR analysis</p>')
    ),
    tabPanel(
      "Metabolite-taxon correlation analysis", icon=icon("delicious")
      # HTML('<p> <style="font-size: 15pt;" class="fab">&#xf1a5 Metabolite-taxon correlation analysis</p>')
    )
  )
)

server <- function (input,output){
  output$table1 <- renderDataTable(
    datatable(metadata, caption = htmltools::tags$caption(
      style = 'caption-side: bottom;',
      'table: Metadata'))
  )
  output$table2 <- renderDataTable(
    datatable(tax_table, caption = htmltools::tags$caption(
      style = 'caption-side: bottom;',
      'table: Taxonomy data'))
  )
  output$table3 <- renderDataTable(
    datatable(count_table, caption = htmltools::tags$caption(
      style = 'caption-side: bottom;',
      'table: Counts data'))
  )
}

shinyApp(ui = ui, server = server)
