setwd( "C:/Users/Jvandegevel/Documents/Coursera/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt",sep =";", header = TRUE, stringsAsFactors=FALSE)
data <- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)

subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, subMetering2, type="l", col="red")
lines(date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()