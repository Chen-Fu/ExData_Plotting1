## Read the data into R
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactor = FALSE , na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")



## Combime Date and Time (It's type will be char)
data$Date <- paste(data$Date, data$Time)


## Convert it to Posixlt
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")




## Saves data to file

png(filename = "plot3.png", width = 480, height = 480)


	
	## plot the graph
	with(data, {plot(Date, Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")
            
	    lines(Date, Sub_metering_2, col = "red")
            
            lines(Date, Sub_metering_3, col = "Blue")})

	## Add the topright legend

	legend("topright", col = c("black","red","blue"), legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)



dev.off()
