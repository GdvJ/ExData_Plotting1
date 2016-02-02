
setwd( "C:/Users/Jvandegevel/Documents/Coursera/Exploratory Data Analysis")

data <- read.table("household_power_consumption.txt",sep =";", header = TRUE, stringsAsFactors=FALSE)
data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

GlobalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()