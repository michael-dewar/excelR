excelTable(data = head(iris),
           columns = data.frame(title = names(iris),
                                type = c('numeric', 'numeric', 'numeric', 'numeric', 'text')))

excelTable(data = head(iris),
           columns = data.frame(title = names(iris),
                                type = c('numeric', 'numeric', 'numeric', 'numeric', 'text')),
           hideIndex = TRUE)

excelTable(data = head(iris),
           columns = data.frame(title = names(iris),
                                type = c('numeric', 'numeric', 'numeric', 'numeric', 'text')),
           hideIndex = FALSE)
