## Reset base plot global parameters
dev.off()

## Read and tidy the data
hpc = read.delim("household_power_consumption.txt", sep=";")
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")
hpc = hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Date <- paste(hpc$Date, "", hpc$Time)
hpc$Date <- as.POSIXct(hpc$Date)
hpc[,3:9] <- sapply(hpc[,3:9], as.numeric)

## Make plot 4
par(mfrow = c(2,2))
{
  plot(hpc$Date, hpc$Global_active_power, 
       type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  plot(hpc$Date, hpc$Voltage,
       type = "l", xlab="datetime", ylab="Voltage")
  
  plot(hpc$Date, hpc$Sub_metering_1, 
       type="l", xlab="", ylab="Energy sub metering")
  lines(hpc$Date, hpc$Sub_metering_2, col="red")
  lines(hpc$Date, hpc$Sub_metering_3, col="blue")
  legend("topright", lty="solid", 
         col=c("black","red","blue"), legend = colnames(hpc)[7:9])
  
  plot(hpc$Date, hpc$Global_reactive_power,
       type = "l", xlab="datetime", ylab="Global_reactive_power")
}

## Write plot 4
dev.copy(png, "plot4.png")
dev.off()
