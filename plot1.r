#
# Script One for Assignment One in the Exploratory Data Analysis Coursera Class
# Created by Tim Marco
# tim@timmarco.com
# May 10, 2014
#

# Read in the power consumption data
power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

# Convert the dates to a more usable format
power.data$Date <- as.Date(power.data$Date,"%d/%m/%Y")

# Subset out only the interesting / useful dates
power.use.data <- subset(power.data, Date == "2007-02-01" | Date == "2007-02-02")

# Create a .png device with correct 
png(file="plot1.png", width=480, height=480, bg="transparent")

# Generate the histogram with the correct parameters
hist(power.use.data$Global_active_power, main = "Global Active Power", col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# Output the PNG file
dev.off()