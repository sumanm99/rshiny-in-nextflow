# Visualization using R shiny

library(shiny)
library(DT)

#data

args = commandArgs(trailingOnly=TRUE)
tax_table <- read.csv(paste("./",args[1],sep=""), header=T)
count_table <- read.csv(paste("./",args[2],sep=""), header=T)
metadata <- read.csv(paste("./",args[3],sep=""), header=T)

# tax_table <- read.csv("./tax_table.csv", header=T)
# count_table <- read.csv("./count_table.csv", header=T)
# metadata <- read.csv("./metadata.csv", header=T)


ui <- fluidPage(
  titlePanel("proBiome Suite"),
  br(),
  mainPanel(
    dataTableOutput("table1"),
    br(),
    dataTableOutput("table2"),
    br(),
    dataTableOutput("table3")
  )
)

server <- function (input,output){
  output$table1 <- renderDataTable(
    datatable(metadata)
  )
  output$table2 <- renderDataTable(
    datatable(tax_table)
  )
  output$table3 <- renderDataTable(
    datatable(count_table)
  )
}

shinyApp(ui = ui, server = server)

