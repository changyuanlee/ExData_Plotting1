power <- read.table("household_power_consumption.txt", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                    sep = ";", skip = grep("31/1/2007;23:59", readLines("household_power_consumption.txt")), nrows = 2*24*60, na.strings = "?")

datetime <- paste(power[, 1], power[, 2], sep=" ")
datetime <- strptime(datetime, format= "%d/%m/%Y %H:%M:%S")
power$datetime <- datetime
png("plot4.png")
par(mfcol=c(2, 2))
with(power, plot(datetime, V3, type="n", ylab="Global Active Power (kilowatts)", xlab=" "))
with(power, lines(datetime, V3))

with(power, plot(datetime, V7, type="n", ylab="Energy sub metering", xlab=" "))
with(power, lines(datetime, V7))
with(power, lines(datetime, V8, col="red"))
with(power, lines(datetime, V9, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

with(power, plot(datetime, V5, type="n", ylab="Voltage"))
with(power, lines(datetime, V5))

with(power, plot(datetime, V4, type="n", ylab="Global_reactive_power"))
with(power, lines(datetime, V4))

dev.off()