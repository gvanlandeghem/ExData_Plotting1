source("prepareData.R")

data <- prepareSelectedData()


png(filename="plot2.png", width=480, height=480, units="px")
par(mfrow=c(1, 1))

plot(data$DateTime, data$Global_active_power,type="l", xlab= "", ylab="Global Active Power (kilowatts)")

dev.off()
