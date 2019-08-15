#!/usr/bin/Rscript

# 3
# Reads a series of files computes a correlation for two variables if the
# number of complete cases meets or exceeds a threshold
# Uses the complete() function from task 2

get_complete <- function(id = 1:332) {
    con <- file('r-code/data_path.txt', open = 'r')
    dir <- readLines(con)
    close(con)
    if (!dir.exists(file.path(dir, 'specdata'))) {
        unzip(file.path(dir, 'specdata.zip'), exdir = dir)
    }
    obs_table <- data.frame("id" = numeric(), "nobs" = numeric())
    for (x in id) {
        setx <- read.csv(
            file.path(directory, paste0(sprintf("%03d", x), ".csv")))
            obs_table[nrow(obs_table) + 1, ] <- c(x, sum(complete.cases(setx)))
        }
        obs_table
    }

corr <- function(directory, threshold = 0) {
    active <- subset(get_complete(directory), nobs > threshold)
    cor_vect <- c()
    for (x in active[, "id"]) {
        setx <- read.csv(
            file.path(directory, paste0(sprintf("%03d", x), ".csv")))
        cor_setx <- cor(
            setx[, "nitrate"], setx[, "sulfate"], use = "complete.obs"
        )
        cor_vect <- c(cor_vect, cor_setx)
    }
    cor_vect
}
