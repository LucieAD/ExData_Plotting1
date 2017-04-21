  ## read data file
  hpc <- read.csv2("household_power_consumption.txt")
  
  ## convert "Date" into a date format
  hpc[,1] <- as.Date(hpc[,1], "%d/%m/%Y")
  
  ## extract data for relevant dates
  hpc2 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
  
  ## create DateTime column in POSIXct format
  hpc2$DateTime <- paste(as.character(hpc2$Date), as.character(hpc2$Time), sep=" ")
  hpc2$DateTime <- as.POSIXct(hpc2$DateTime)
  
  ## convert data columns to numeric values
  hpc2[,3] <- as.numeric(as.character(hpc2[,3]))
  hpc2[,4] <- as.numeric(as.character(hpc2[,4]))
  hpc2[,5] <- as.numeric(as.character(hpc2[,5]))
  hpc2[,7] <- as.numeric(as.character(hpc2[,7]))
  hpc2[,8] <- as.numeric(as.character(hpc2[,8]))
  hpc2[,9] <- as.numeric(as.character(hpc2[,9]))
  
  ## create plots
  png("plot4.png")
    par(mfcol=c(2,2))
      plot(hpc2$DateTime, hpc2$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
      plot(hpc2$DateTime, hpc2$Sub_metering_1, type="n", xlab=" ", ylab="Energy sub metering")
        points(hpc2$DateTime, hpc2$Sub_metering_1, type="l")
        points(hpc2$DateTime, hpc2$Sub_metering_2, type="l", col="red")
        points(hpc2$DateTime, hpc2$Sub_metering_3, type="l", col="blue")
        legend("topright", names(hpc2[,7:9]) , lty=1, col=c("black", "red", "blue"))
      plot(hpc2$DateTime, hpc2$Voltage, type="l", xlab="datetime", ylab="Voltage")
      plot(hpc2$DateTime, hpc2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.off()