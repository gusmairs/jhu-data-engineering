#!/usr/bin/env rscript

# Part 2
# Reads data from files as above and compiles a table of complete cases

get_complete <- function(id = 1:332) {
    con <- file('r-code/data_path.txt', open = 'r')
    dir <- readLines(con)
    close(con)
    if (!dir.exists(file.path(dir, 'specdata'))) {
        unzip(file.path(dir, 'specdata.zip'), exdir = dir)
    }
    obs_table <- data.frame('id' = numeric(), 'nobs' = numeric())
    for (x in id) {
        set_x <- read.csv(
            file.path(
                dir, 'specdata', paste0(sprintf('%03d', x), '.csv')
            )
        )
        obs_table[nrow(obs_table) + 1, ] <- c(x, sum(complete.cases(set_x)))
    }
    obs_table
}
