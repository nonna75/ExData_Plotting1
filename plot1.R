#load library 
library(data.table)

#import data
dataset <- data.table:: fread("household_power_consumption.txt", na.strings="?")

#Change Date Column to Date Type
dataset <- dataset[,Date :=lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
DT_feb2017 <- dataset[(Date >= "2007-02-01") & (Date <= "2007-02-02"),]

png("plot1.png", width=480, height=480)

## Plot 1
hist(DT_feb2017[, Global_active_power], main ="Global_active_power",
     xlab = "Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

