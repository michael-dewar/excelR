test_that("'excelOutput' works", {

  actual_output <- excelOutput("table")

  expected_output <- list(
    list(
      name = "div",
      attribs = list(
        id = "table",
        style = "width:100%;height:400px;",
        class = "jexcel html-widget html-widget-output shiny-report-size html-fill-item-overflow-hidden",
        class = "html-fill-item"
      ),
      children = list()
    ) |>
      structure(class = "shiny.tag")
  ) |>
    structure(
      names = "",
      class = c("shiny.tag.list", "list"),
      html_dependencies = list(
        list(
          name = "htmlwidgets",
          version = "1.6.2",
          src = list(file = "www"),
          meta = NULL,
          script = "htmlwidgets.js",
          stylesheet = NULL,
          head = NULL,
          attachment = NULL,
          package = "htmlwidgets",
          all_files = TRUE
        ) |>
          structure(class = "html_dependency"),
        list(
          name = "jexcel",
          version = "3.9.1",
          src = list(file = "htmlwidgets/lib/jexcel"),
          meta = NULL,
          script = c("js/jexcel.min.js", "js/jsuites.js"),
          stylesheet = c(
            "css/jexcel.min.css", "css/jsuites.css", "css/materialicon/material-icons.css",
            "css/custom.css"
          ),
          head = NULL,
          attachment = NULL,
          package = "excelR",
          all_files = TRUE
        ) |>
          structure(class = "html_dependency"),
        list(
          name = "jexcel-binding",
          version = "0.4.0",
          src = list(file = "htmlwidgets"),
          meta = NULL,
          script = "jexcel.js",
          stylesheet = NULL,
          head = NULL,
          attachment = NULL,
          package = "excelR",
          all_files = FALSE
        ) |>
          structure(class = "html_dependency")
      )
    )

  testthat::expect_equal(actual_output, expected_output)
})

