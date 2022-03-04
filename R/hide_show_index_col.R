#' Hide/Show Index Column
#'
#' These functions are used to hide or show the index column
#' (row numbers on far left) in the table.
#' @name hideShowIndex
#' @param tableId the id of the table for which the index column is to be hid/shown
#' @examples
#' if(interactive()) {
#'  library(shiny)
#'  library(excelR)
#'  shinyApp(
#'    ui = fluidPage(
#'      excelOutput("table", height = 175),
#'      actionButton('hideShowButton', 'Hide/Show Index Column')),
#'    server = function(input, output, session) {
#'      output$table <- renderExcel(excelTable(data = head(iris)))
#'
#'      observeEvent(input$hideShowButton,{
#'        if(input$hideShowButton %% 2) # odd number of clicks
#'          hideIndex("table")
#'        else # even number of clicks
#'          showIndex("table")
#'      })
#'    }
#'  )
#'  }
NULL

#' @rdname hideShowIndex
#' @export
#'
hideIndex <- function(tableId){
  session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage("excelR:hideIndex", message=list(tableId))
}

#' @rdname hideShowIndex
#' @export
#'
showIndex <- function(tableId){
  session <- shiny::getDefaultReactiveDomain()
  session$sendCustomMessage("excelR:showIndex", message=list(tableId))
}
