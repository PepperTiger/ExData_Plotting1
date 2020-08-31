## Read and tidy the data
hpc = read.delim("household_power_consumption.txt", sep=";")
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")
hpc = hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Date <- paste(hpc$Date, "", hpc$Time)
hpc$Date <- as.POSIXct(hpc$Date)
hpc[,3:9] <- sapply(hpc[,3:9], as.numeric)

## Make plot 3
plot(hpc$Date, hpc$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(hpc$Date, hpc$Sub_metering_2, col="red")
lines(hpc$Date, hpc$Sub_metering_3, col="blue")
legend("topright", lty="solid", 
       col=c("black","red","blue"), legend = colnames(hpc)[7:9])

## Write plot 3
dev.copy(png, file="plot3.png")
dev.off()
