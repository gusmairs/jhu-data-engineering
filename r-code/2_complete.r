#!/usr/bin/env rscript

# 2
# Reads data from files as above and compiles a table of complete cases

get_complete <- function(directory, id = 1:332) {
    obs_table <- data.frame("id" = numeric(), "nobs" = numeric())
    for (x in id) {
        setx <- read.csv(
            file.path(directory, paste0(sprintf("%03d", x), ".csv")))
        obs_table[nrow(obs_table) + 1, ] <- c(x, sum(complete.cases(setx)))
    }
    obs_table
}
print(get_complete('specdata'))
