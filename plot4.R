library(dplyr)
library(lubridate)
household_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA","?"))
household_consumption_df = tbl_df(household_consumption)
rm(household_consumption)

household_consumption_df$Date <- as.Date(household_consumption_df$Date, "%d/%m/%Y")

household_consumption_day <- subset(household_consumption_df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
household_consumption_day$full_time <- ymd_hms(with(household_consumption_day, paste(Date, Time)))
colnames(household_consumption_day)
par(mfrow=c(2,2), mar=c(4,4,2,1))

#Plot 1
with(household_consumption_day, plot(full_time, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))

#Plot2
with(household_consumption_day, plot(full_time, Voltage, type="l", ylab = "Voltage", xlab = "datetime"))

#Plot3
with(household_consumption_day, {
    plot(full_time,Sub_metering_1,ylab = "Energy sub metering", xlab = "", type="l")
    lines(full_time,Sub_metering_2,col='red')
    lines(full_time, Sub_metering_3,col='blue')
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty = 1,  lwd=2, bty="n")
})

#Plot4
with(household_consumption_day, plot(full_time, Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()