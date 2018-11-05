power <- read.table("household_power_consumption.txt", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                    sep = ";", skip = grep("31/1/2007;23:59", readLines("household_power_consumption.txt")), nrows = 2*24*60, na.strings = "?")
png("plot1.png")
hist(power$V3, main='Global Active Power', xlab="Global Active Power (kilowatts)",col='red')
dev.off()