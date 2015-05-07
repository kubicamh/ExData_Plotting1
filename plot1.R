## plot1 for Assignment 1 for R Peng's Exploritory Data Analysis Course

## Read in Data for specified dates Feb 1 and 2 2007

electric <- read.table("household_power_consumption.txt", TRUE, ";")
electric$Date2 <- as.Date(as.character(electric$Date), "%d/%m/%Y")
SE <- subset(electric, Date2 == as.Date("2007-02-01")|Date2 == as.Date("2007-02-02"))

#Create Date time Reference
SE$datetime <- as.POSIXct(paste(SE$Date2, SE$Time), format="%Y-%m-%d %H:%M:%S")

# Optimize other variables
SE$Global_active_power <- as.numeric(SE$Global_active_power)

# Create Graph

hist(SE$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Create Image
png(file = "plot1.png")
with(SE, hist(SE$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()