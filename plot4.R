setwd( "C:/Users/Jvandegevel/Documents/Coursera/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt",sep =";", header = TRUE, stringsAsFactors=FALSE)
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, subMetering2, type="l", col="red")
lines(date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()