# Visualization using R shiny

library(shiny)
library(DT)

#data

args = commandArgs(trailingOnly=TRUE)
tax_table <- read.csv(paste("./",args[1],sep=""), header=T)
count_table <- read.csv(paste("./",args[2],sep=""), header=T)
metadata <- read.csv(paste("./",args[3],sep=""), header=T)

ui <- tagList(
  titlePanel(
    HTML('<p style="background-color: Black;
                color: white;
                padding-left: 15px;">proBiome Suite 
                <span style="font-size: 10pt;">&#8862 Data</span></p>')
  ),
  fluidPage(
    mainPanel(
      dataTableOutput("table1"),
      br(),
      dataTableOutput("table2"),
      br(),
      dataTableOutput("table3")
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

