source("complete.R") # include our complete function
corr <- function(directory, threshold = 0) {
    vReturn <- numeric(0) # create our return value with an empty numeric vector
    files <- list.files(directory, full.names=T, pattern=".csv") # get all csv files in the directory
    for(i in seq_along(files)) { # loop over all files
        if(complete(directory, i)[2] >= threshold) { # get our complete cases and compare it to the threshold
            data <- read.csv(files[i]) # read data from the file
            vReturn <- c(vReturn, cor(x = data$sulfate, y = data$nitrate, use="pairwise.complete.obs")) # store the correlation in our return value
        }
    }
    
    vReturn
}