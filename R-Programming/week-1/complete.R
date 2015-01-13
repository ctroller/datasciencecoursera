complete <- function(directory, id = 1:332) {
    completeData <- data.frame(id = 0, nobs = 0) # create a new data frame with col names `id` and `nobs`
    for(i in seq_along(id)) { # loop trough all ids
        zeroFilledId <- formatC(id[i], width = 3, format = "d", flag = "0") # zerofill the id (1 -> 001, ..., 99 -> 099, ...) to a length of 3
        zeroFilledIdFile <- paste(zeroFilledId, ".csv", sep="") # 001 -> 001.csv
        data <- read.csv(file.path(directory, zeroFilledIdFile)) # get a nice file path and read from the file
        subset <- subset(data, !is.na(nitrate) & !is.na(sulfate)) # create a subset where nitrate != NA and sulfate != NA
        completeData[i,] <- c(id[i], nrow(subset)) # store the id and number of rows
    }
    completeData # return our vector
}