#!/usr/bin/env rscript

# Part 3
# Subsets data files to use based on the number of complete cases (nobs),
# then computes a correlation between 'nitrate' and 'sulfate' for those
# observations.

# Sources the 'get_complete()' function from Part 2

source('r-code/2_complete.r')

corr <- function(threshold = 0) {
    con <- file('data_path.txt', open = 'r')
    dir <- readLines(con)
    close(con)
    active <- subset(get_complete(), nobs > threshold)
    head(active)
    cor_vect <- c()
    for (x in active[, 'id']) {
        set_x <- read.csv(
            file.path(dir, 'specdata', paste0(sprintf('%03d', x), '.csv'))
        )
        cor_set_x <- cor(
            set_x[, 'nitrate'], set_x[, 'sulfate'],
            use = 'complete.obs'
        )
        cor_vect <- c(cor_vect, cor_set_x)
    }
    cor_vect
}
