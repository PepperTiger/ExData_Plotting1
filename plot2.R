## Read and tidy the data
hpc = read.delim("household_power_consumption.txt", sep=";")
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")
hpc = hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Date <- paste(hpc$Date, "", hpc$Time)
hpc$Date <- as.POSIXct(hpc$Date)
hpc[,3:9] <- sapply(hpc[,3:9], as.numeric)

## Make plot 2
plot(hpc$Date, hpc$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Write plot 2
dev.copy(png, file="plot2.png")
dev.off()
