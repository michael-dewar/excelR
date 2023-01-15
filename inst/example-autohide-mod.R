if(interactive()) {
  suppressPackageStartupMessages({
    library(shiny)
    library(excelR)
  })
  shinyApp(
    ui = fluidPage(
      uiOutput("table_wrapper"),

      actionButton('hideShowButton', 'Hide/Show Index Column')),

    server = function(input, output, session) {

      output$table_wrapper <- renderUI({
        on.exit({

          observeEvent(once = FALSE, reactiveValuesToList(session$input), {
            hideIndex("table")
          }, ignoreInit = FALSE, ignoreNULL = FALSE)
        })
        excelOutput("table", height = 175)
      })

      output$table <- renderExcel({
        excelTable(data = head(iris),
                   columns = data.frame(title = names(iris),
                                        type = c('numeric', 'numeric', 'numeric', 'numeric', 'text')))
      })

      observeEvent(input$hideShowButton,{
        browser()
        if(input$hideShowButton %% 2) # odd number of clicks
          hideIndex("table")
        else # even number of clicks
          showIndex("table")
      })


    }
  )
}

