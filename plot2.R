power <- read.table("household_power_consumption.txt", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                    sep = ";", skip = grep("31/1/2007;23:59", readLines("household_power_consumption.txt")), nrows = 2*24*60, na.strings = "?")

datetime <- paste(power[, 1], power[, 2], sep=" ")
datetime <- strptime(datetime, format= "%d/%m/%Y %H:%M:%S")
power$datetime <- datetime
png("plot2.png")
with(power, plot(datetime, V3, type="n", ylab="Global Active Power (kilowatts)", xlab=" "))
with(power, lines(datetime, V3))
dev.off()