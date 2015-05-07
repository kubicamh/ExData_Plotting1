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


# Create Graph

with(SE, plot(datetime, Sub_metering_1, main="Energy Submetering", type="n",
     ylab="Energy Sub Metering", xlab="Day"))
with(SE, lines(datetime, Sub_metering_1, col = "red"))
with(SE, lines(datetime, Sub_metering_2, col = "blue"))
with(SE, lines(datetime, Sub_metering_3, col = "orange"))
legend("topright", lty=1, col=c("red", "blue", "orange"), 
            legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))



# Create Image
png(file = "plot3.png")

with(SE, plot(datetime, Sub_metering_1, main="Energy Submetering", type="n",
              ylab="Energy Sub Metering", xlab="Day"))
with(SE, lines(datetime, Sub_metering_1, col = "red"))
with(SE, lines(datetime, Sub_metering_2, col = "blue"))
with(SE, lines(datetime, Sub_metering_3, col = "orange"))
legend("topright", lty=1, col=c("red", "blue", "orange"), 
       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

dev.off()