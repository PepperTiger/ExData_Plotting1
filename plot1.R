## Reset base plot global parameters
dev.off() 

## Read and tidy the data
hpc = read.delim("household_power_consumption.txt", sep=";")
hpc$Date = as.Date(hpc$Date, "%d/%m/%Y")
hpc = hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Date <- paste(hpc$Date, "", hpc$Time)
hpc$Date <- as.POSIXct(hpc$Date)
hpc[,3:9] <- sapply(hpc[,3:9], as.numeric)

## Make plot 1
hist(hpc$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main="Global Active Power", 
     col ="Red")

## Write plot 1
dev.copy(png, file="plot1.png")
dev.off()
