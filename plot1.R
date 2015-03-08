## Read the data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", stringsAsFactor = FALSE )

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")





## Save data to file
png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")



dev.off()