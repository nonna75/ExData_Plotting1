#load library 
library(data.table)

#import data
dataset <- data.table:: fread("household_power_consumption.txt", na.strings="?")

# using a POSIXct to create coulmn date with time 
dataset <- dataset[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Filter Dates for 2007-02-01 and 2007-02-02
DT_feb2017 <- dataset[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## Plot 1
plot(x = DT_feb2017[, DateTime],
     y = DT_feb2017[, Global_active_power],
     type ="l" ,xlab="", ylab="Global Active Power")

## Plot 2
plot(DT_feb2017[, DateTime],
     DT_feb2017[, Voltage],
     type ="l" ,xlab="datetime", ylab="Voltage")
## Plot 3
plot(DT_feb2017[,DateTime],DT_feb2017[,Sub_metering_1],type="l",xlab="", ylab="Energy sub metering")
lines(DT_feb2017[,DateTime],DT_feb2017[,Sub_metering_2] , col ="red")
lines(DT_feb2017[,DateTime],DT_feb2017[,Sub_metering_3] , col ="blue")
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
## Plot 4
plot(DT_feb2017[, DateTime],
     DT_feb2017[, Global_reactive_power],
     type ="l" ,xlab="datetime", ylab="Global_reactive_power")

dev.off()


