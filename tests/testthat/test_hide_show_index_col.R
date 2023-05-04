test_that("'hideIndex' does not work outside shiny", {
  testthat::expect_error(hideIndex("table"))
})

test_that("'showIndex' does not work outside shiny", {
  testthat::expect_error(showIndex("table"))
})
