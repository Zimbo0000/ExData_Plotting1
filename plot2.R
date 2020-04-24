data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?") #read into the table
data.subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") #subsetting the data
datetime <- with(data.subset, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) #convert to datetime format
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime,data.subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()