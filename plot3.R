#library(dplyr)
#library(lubridate)
#household_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA","?"))
#household_consumption_df = tbl_df(household_consumption)
#rm(household_consumption)

#household_consumption_df$Date <- as.Date(household_consumption_df$Date, "%d/%m/%Y")

#household_consumption_day <- subset(household_consumption_df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#household_consumption_day$full_time <- ymd_hms(with(household_consumption_day, paste(Date, Time)))
colnames(household_consumption_day)

with(household_consumption_day, {
    plot(Sub_metering_1~full_time,ylab = "Energy sub metering", xlab = "", type="l")
    lines(Sub_metering_2~full_time,col='red')
    lines(Sub_metering_3~full_time,col='blue')
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty = 1,  lwd=3)
})


