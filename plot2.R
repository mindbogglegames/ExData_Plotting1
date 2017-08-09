library(dplyr)
library(lubridate)
household_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA","?"))
household_consumption_df = tbl_df(household_consumption)
rm(household_consumption)

household_consumption_df$Date <- as.Date(household_consumption_df$Date, "%d/%m/%Y")

household_consumption_day <- subset(household_consumption_df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
household_consumption_day$full_time <- ymd_hms(with(household_consumption_day, paste(Date, Time)))

par(mfrow=c(1,1), mar=c(5, 4, 4, 2) + 0.1)
with(household_consumption_day, plot(full_time, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()