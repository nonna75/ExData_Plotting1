#load library 
library(data.table)

#import data
dataset <- data.table:: fread("household_power_consumption.txt", na.strings="?")

# using a POSIXct to create coulmn date with time 
dataset <- dataset[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


# Filter Dates for 2007-02-01 and 2007-02-02
DT_feb2017 <- dataset[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]


png("plot2.png", width=480, height=480)

## Plot 2
plot(x = DT_feb2017[, DateTime],
     y = DT_feb2017[, Global_active_power],
     type ="l" ,xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


