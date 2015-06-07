setwd("~/econometrics/DataScienceSpecialist/4 Exploratory Data Analysis")
dataFile <- "household_power_consumption.txt"    
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")	
# str(data)
# subset 2 days in dataset
sub.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]	
# str(sub.data)	
# convert Data and Time variables
# adding to subset
datetime<-paste(sub.data$Date,sub.data$Time)
sub.data$datetime <-strptime(datetime, "%d/%m/%Y %H:%M:%S")
# define all variables at once
# and use them in the different plots
globalActivePower <- as.numeric(sub.data$Global_active_power)	
globalReactivePower <- as.numeric(sub.data$Global_reactive_power)
subMetering1 <- as.numeric(sub.data$Sub_metering_1)
subMetering2 <- as.numeric(sub.data$Sub_metering_2)
subMetering3 <- as.numeric(sub.data$Sub_metering_3)
voltage <- as.numeric(sub.data$Voltage)
#
#plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(sub.data$datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(sub.data$datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(sub.data$datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(sub.data$datetime, subMetering2, type="l", col="red")
lines(sub.data$datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
