#
# Script two for Assignment One in the Exploratory Data Analysis Coursera Class
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

# Ensure that the power vector is numeric
power.use.data$Global_active_power <- as.numeric(power.use.data$Global_active_power)

# Create the PNG Device
png(file="plot2.png", width=480, height=480, bg="transparent")

# Generate the Plot
plot(power.use.data$datetime,power.use.data$Global_active_power, type="l", ylab="", xlab="Global Active Power (kilowatts)")

# Save the plot
dev.off()