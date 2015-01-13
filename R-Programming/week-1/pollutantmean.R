pollutantmean <- function(directory, pollutant, id = 1:332) {
    meanData <- numeric()
    for(i in id) { # loop trough all ids
        zeroFilledId <- formatC(i, width = 3, format = "d", flag = "0") # zerofill the id (1 -> 001, ..., 99 -> 099, ...) to a length of 3
        zeroFilledIdFile <- paste(zeroFilledId, ".csv", sep="") # 001 -> 001.csv
        data <- read.csv(file.path(directory, zeroFilledIdFile)) # get a nice file path and read from the file
        dataPollutant = data[[pollutant]] # subset our data frame to only get our pollutant values
        dataNoNA <- dataPollutant[!is.na(dataPollutant)] # remove NAs
        meanData <- c(meanData, dataNoNA) # return all data from our pollutant subset
    }
    mean(meanData) # return the mean of all pollutant means
}