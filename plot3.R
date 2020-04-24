data <- read.table("household_power_consumption.txt",header=T, sep=";", na.strings="?") #read into the table
data.subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") #subsetting the data
datetime <- with(data.subset, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) #convert to datetime format
png(filename = "plot3.png", width = 480, height = 480)
plot(datetime,data.subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, data.subset$Sub_metering_2, col="red", lty=1)
lines(datetime, data.subset$Sub_metering_3, col="blue", lty=1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1:1)
dev.off()