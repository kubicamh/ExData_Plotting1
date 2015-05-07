## plot2 for Assignment 1 for R Peng's Exploritory Data Analysis Course

## Read in Data for specified dates Feb 1 and 2 2007

electric <- read.table("household_power_consumption.txt", TRUE, ";")
electric$Date2 <- as.Date(as.character(electric$Date), "%d/%m/%Y")
SE <- subset(electric, Date2 == as.Date("2007-02-01")|Date2 == as.Date("2007-02-02"))

#Create Date time Reference
SE$datetime <- as.POSIXct(paste(SE$Date2, SE$Time), format="%Y-%m-%d %H:%M:%S")

# Optimize other variables
SE$Global_active_power <- as.numeric(SE$Global_active_power)
SE$Global_reactive_power <- as.numeric(SE$Global_reactive_power)
SE$Voltage <- as.numeric(SE$Voltage)
SE$Global_intensity <- as.numeric(SE$Global_intensity)
SE$Sub_metering_1 <- as.numeric(SE$Sub_metering_1)
SE$Sub_metering_2 <- as.numeric(SE$Sub_metering_2)
SE$Sub_metering_3 <- as.numeric(SE$Sub_metering_3)


# Create Graph and Create Image

png(file = "plot4.png")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(SE, {
        plot(datetime, Global_active_power,  
             ylab="Global Active Power (kilowatts)", type="l", xlab="Day")
        
        plot(datetime, Voltage, ylab="Voltage", type="l", xlab="datetime")
        
        plot(datetime, Sub_metering_1, type="n",
             ylab="Energy Sub Metering", xlab="Day")
        lines(datetime, Sub_metering_1, col = "red")
        lines(datetime, Sub_metering_2, col = "blue")
        lines(datetime, Sub_metering_3, col = "orange")
        legend("topright", lty=1, col=c("red", "blue", "orange"), 
               legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
        
        plot(datetime, Global_reactive_power, type="l", xlab="datetime")
        
})

dev.off()