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


# Create Graph

plot(SE$datetime, SE$Global_active_power, main="Global Active Power", 
     ylab="Global Active Power (kilowatts)", type="l", xlab="Day")

# Create Image
png(file = "plot2.png")
with(SE, plot(SE$datetime, SE$Global_active_power, main="Global Active Power",
           ylab="Global Active Power (kilowatts)", type="l", xlab="Day"))
dev.off()