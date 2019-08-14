# 1
# Reads a range of data from a large batch of csv files and calculates a mean
# The file.path() function creates a correct path based on the platform
# running R. Note rbind() ignores identical headers and is very very slow
# here due to memory management. Worth exploring making R work like Python
# in building a list of dataframes and then concatenating them.

pollutantmean <- function(directory, pollutant, id = 1:332) {
    temptable <- data.frame()
    for (x in id) {
        setx <- read.csv(
            file.path(directory, paste0(sprintf("%03d", x), ".csv"))
        )
        temptable <- rbind(temptable, setx)
    }
    round(mean(temptable[[pollutant]], na.rm = TRUE), 3)
}
pollutantmean('specdata', 'nitrate')
