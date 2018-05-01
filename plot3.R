#load library 
library(data.table)

#import data
dataset <- data.table:: fread("household_power_consumption.txt", na.strings="?")

# using a POSIXct to create coulmn date with time 
dataset <- dataset[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Filter Dates for 2007-02-01 and 2007-02-02
DT_feb2017 <- dataset[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

## Plot 3
plot(DT_feb2017[,DateTime],DT_feb2017[,Sub_metering_1],type="l",xlab="", ylab="Energy sub metering")
lines(DT_feb2017[,DateTime],DT_feb2017[,Sub_metering_2] , col ="red")
lines(DT_feb2017[,DateTime],DT_feb2017[,Sub_metering_3] , col ="blue")
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
dev.off()


