# 1
# Reads a range of data from a large batch of csv files and calculates a mean
# The file.path() function creates a correct path based on the platform
# running R. Note rbind() ignores identical headers and is very very slow
# here due to memory management. Worth exploring making R work like Python
# in building a list of dataframes and then concatenating them.

dir <- "~/OneDrive/DS_Study/hopkins/02-R-Programming/proj-1/data"

pollutant_mean <- function(directory, pollutant, id = 1:332) {
    temp_table <- data.frame()
    for (x in id) {
        set_x <- read.csv(
            file.path(directory, paste0(sprintf('%03d', x), '.csv'))
        )
        temp_table <- rbind(temp_table, set_x)
    }
    round(mean(temp_table[[pollutant]], na.rm = TRUE), 3)
}

pollutant_mean(file.path(dir, 'specdata'), 'nitrate', id = 200:300)
