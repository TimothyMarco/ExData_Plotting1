#
# Script Three for Assignment One in the Exploratory Data Analysis Coursera Class
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
png <- png(filename="plot3.png", width = 480, height = 480)

# Allow for plotting of additional lines
par(mfcol=c(1,1))



plot(power.use.data$datetime,power.use.data$Sub_metering_1,type="l", xlab="", ylab="Energy Sub Metering")
lines(power.use.data$datetime,power.use.data$Sub_metering_2, type="l", col="red")
lines(power.use.data$datetime,power.use.data$Sub_metering_3, type="l", col="blue")


# Create the legend for the image
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1))


# Store the png to disk
dev.off()