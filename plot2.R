setwd( "C:/Users/Jvandegevel/Documents/Coursera/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt",sep =";", header = TRUE, stringsAsFactors=FALSE)
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(date, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()