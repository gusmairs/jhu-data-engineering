#!/usr/bin/env rscript

# Part 1
# Reads a range of data from a large batch of csv files and calculates a mean
# The file.path() function creates a correct path based on the platform
# running R. Note rbind() ignores identical headers and is very very slow
# here due to memory management. Worth exploring making R work like Python
# in building a list of dataframes and then concatenating them.

# Production use:
# In R, source this file, set a 'dir' variable to the dataset path
# and call the pollutant_mean function with parameters. Current version
# unzips the data file, runs the script, then deletes the unzipped directory.

pollutant_mean <- function(directory, pollutant, id = 1:332) {
    cat('Unpacking data files..\n')
    unzip(file.path(directory, 'specdata.zip'), exdir = directory)
    temp_table <- data.frame()
    for (x in id) {
        set_x <- read.csv(
            file.path(directory, 'specdata', paste0(sprintf('%03d', x), '.csv'))
        )
        temp_table <- rbind(temp_table, set_x)
    }
    unlink(file.path(directory, 'specdata'), recursive = TRUE)
    p_mean <- round(mean(temp_table[[pollutant]], na.rm = TRUE), 3)
    cat(paste0(
        ' ..The mean for ', pollutant,
        ' for that range of sensors is ', p_mean, '.\n'
    ))
}
