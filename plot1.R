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
# plot1
png("plot1.png", width=480, height=480)	
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")	
dev.off()	