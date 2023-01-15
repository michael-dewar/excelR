library(shiny)
library(excelR)
library(shinyjs)

jsCode <- "shinyjs.hideindex = function(params) {document.getElementById('table').jexcel.hideIndex();}"

ui <- fluidPage(
  useShinyjs(),
  extendShinyjs(text = jsCode, functions = "hideindex"),
  excelOutput("table", height = 175),
  actionButton('hide_button', 'Hide Index Column')
)

server <- function(input, output, session){
  output$table <- renderExcel({
    excelTable(data = head(iris),
               columns = data.frame(title = names(iris),
                                    type = c('numeric', 'numeric', 'numeric', 'numeric', 'text')))
    })

  onclick("hide_button", js$hideindex())

}

shinyApp(ui, server)
