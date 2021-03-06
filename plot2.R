  ## read data file
  hpc <- read.csv2("household_power_consumption.txt")
  
  ## convert "Date" into a date format
  hpc[,1] <- as.Date(hpc[,1], "%d/%m/%Y")
  
  ## extract data for relevant dates
  hpc2 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
  
  ## create DateTime column in POSIXct format
  hpc2$DateTime <- paste(as.character(hpc2$Date), as.character(hpc2$Time), sep=" ")
  hpc2$DateTime <- as.POSIXct(hpc2$DateTime)
  
  ## convert "Global_active_power" to numeric values
  hpc2[,3] <- as.numeric(as.character(hpc2[,3]))
  
  ## create line graph
  png("plot2.png")
  plot(hpc2$DateTime, hpc2$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
  dev.off()