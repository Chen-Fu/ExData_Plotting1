data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactor = FALSE , na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


data$Date <- paste(data$Date, data$Time)

data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")



## Saves data to file

png(filename = "plot2.png", width = 480, height = 480)


plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")


dev.off()
