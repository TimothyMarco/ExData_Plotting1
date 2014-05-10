#
# Script Four for Assignment One in the Exploratory Data Analysis Coursera Class
# Created by Tim Marco
# tim@timmarco.com
# May 10, 2014
#



# Read the power consumption data
power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

# Subset out only the interesting dates
power.use.data <- subset(power.data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the date & time to a usable datetime
power.use.data$datetime <- strptime(paste(power.use.data$Date, power.use.data$Time),"%d/%m/%Y %H:%M:%S")

# Create the png with correct attributes
png <- png(filename="plot4.png", width = 480, height = 480)


# Set parameters to allow for multiple subplots
par(mfrow = c(2,2))

# Global Active Power Over Time
plot(power.use.data$datetime,power.use.data$Global_active_power, type="l", ylab="Global Active Power", xlab="") 


# Voltage Over Time
plot(power.use.data$datetime,power.use.data$Voltage, type="l", xlab="datetime", ylab="Voltage") 


# Energy Sub Metering (code taken from plot3.R)
plot(power.use.data$datetime,power.use.data$Sub_metering_1,type="l", xlab="", ylab="Energy Sub Metering")
lines(power.use.data$datetime,power.use.data$Sub_metering_2, type="l", col="red")
lines(power.use.data$datetime,power.use.data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1))


# Global Active Power
plot(power.use.data$datetime,power.use.data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l") 



# Store the plot as a .png
dev.off()