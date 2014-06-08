source("prepareData.R")

data <- prepareSelectedData()

png(filename="plot1.png", width=480, height=480, units="px")
par(mfrow=c(1, 1))

hist(data$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main="Global Active Power")

dev.off()

