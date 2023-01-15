if(interactive()) {
  suppressPackageStartupMessages({
    library(shiny)
    library(excelR)
    })
  shinyApp(
    ui = fluidPage(
      excelOutput("table", height = 175),
      actionButton('hideShowButton', 'Hide/Show Index Column'),
      ),

    server = function(input, output, session) {

      output$table <- renderExcel({


        excelTable(data = head(iris),
                   columns = data.frame(title = names(iris),
                                        type = c('numeric', 'numeric', 'numeric', 'numeric', 'text'))
                   )
        })

      observeEvent(input$hideShowButton,{

        if(input$hideShowButton %% 2) # odd number of clicks
          hideIndex("table")
        else # even number of clicks
          showIndex("table")
      })


    }
  )
}

