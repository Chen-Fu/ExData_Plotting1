## Read the data into R
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactor = FALSE , na.strings = "?")

data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")



## Combime Date and Time (It's type will be char)
data$Date <- paste(data$Date, data$Time)


## Convert it to Posixlt
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")



## Saves data to file

png(filename = "plot4.png", width = 480, height = 480)
	par(mfrow = c(2,2))
    
	with(data, {plot(Date,Global_active_power,type = "l",ylab = "Global Active Power",xlab="")
                
		    plot(Date,Voltage,type = "l",ylab = "Voltage",xlab="datetime")
                
	    	    {plot(Date, Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")
                     
                     lines(Date, Sub_metering_2, col = "red")
                     
                     lines(Date, Sub_metering_3, col = "Blue")
	    	     legend("topright", col = c("black","red","blue"), legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)}
                
           	     plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")})

dev.off()