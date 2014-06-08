
prepareSelectedData <- function() {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    fileName <- "household_power_consumption.zip"
    selectedFile <- "selected_plot_data.csv"
    
    if(file.exists(selectedFile)) {
        selectedData <- read.csv(selectedFile)
        selectedData$DateTime <- strptime(selectedData$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    else {
        # download and unzip the file 
        if(!file.exists(fileName)) {
            download.file(fileURL, destfile=fileName, method="curl")
            unzip(fileName, overwrite=TRUE)
        }
        data <- read.table(file, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        selectedData <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
        selectedData$DateTime <- strptime(paste(selectedData$Date, selectedData$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(selectedData, selectedFile)
    }
    selectedData
}