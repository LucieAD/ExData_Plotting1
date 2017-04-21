## read data file
hpc <- read.csv2("household_power_consumption.txt")

## convert "Date" into a date format
hpc[,1] <- as.Date(hpc[,1], "%d/%m/%Y")

## extract data for relevant dates
hpc2 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

## convert "Global_active_power" to numeric values
hpc2[,3] <- as.numeric(as.character(hpc2[,3]))

## create histogram
png("plot1.png")
hist(hpc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()