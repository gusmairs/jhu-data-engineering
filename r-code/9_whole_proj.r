## Nice examples of batch processing files from disk and working with them
## These use source(), functional structure, path formation
## Note how slow they can be, third one really gets bogged down
## Speed up options: vectorize, set up specific length empty dataframes, use read.table


## 1
## Reads a range of data from a large batch of csv files and calculates a mean
## The file.path() function creates a correct path based on the platform running R
## Note rbind() ignores identical headers
## 
pollutantmean <- function(directory, pollutant, id = 1:332) {
    temptable <- data.frame()
    for(x in id) {
        setx <- read.csv(file.path(directory, paste0(sprintf("%03d", x), ".csv")))
        temptable <- rbind(temptable, setx)
    }
    mean(temptable[[pollutant]], na.rm = TRUE)
}

## 2
## Reads data from files as above and compiles a table of complete cases
## 
complete <- function(directory, id = 1:332) {
	obs_table <- data.frame("id" = numeric(), "nobs" = numeric())
	for(x in id) {
		setx <- read.csv(file.path(directory, paste0(sprintf("%03d", x), ".csv")))
		obs_table[nrow(obs_table) + 1, ] <- c(x, sum(complete.cases(setx)))
	}
	obs_table
}

## 3
## Reads a series of files computes a correlation for two variables if the
## number of complete cases meets or esceeds a threshold
## Uses the complete() function from task 2
## 
corr <- function(directory, threshold = 0) {
	active <- subset(complete(directory), nobs > threshold)
	cor_vect <- c()
	for(x in active[ ,"id"]) {
		setx <- read.csv(file.path(directory, paste0(sprintf("%03d", x), ".csv")))
		cor_setx <- cor(setx[ , "nitrate"], setx[ , "sulfate"], use = "complete.obs")
		cor_vect <- c(cor_vect, cor_setx)
	}
	cor_vect
}	
