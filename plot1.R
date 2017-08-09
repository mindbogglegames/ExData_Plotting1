library(dplyr)
household_consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("NA","?"))
household_consumption_df = tbl_df(household_consumption)
rm(household_consumption)

with(household_consumption_df, plot(Global_active_power))

household_consumption_df$Date <- as.Date(household_consumption_df$Date, "%d/%m/%Y")

household_consumption_day <- subset(household_consumption_df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
par(mfrow=c(1,1), mar=c(5, 4, 4, 2) + 0.1)
with(household_consumption_day, hist(Global_active_power,xlab="Global Active Power (kilowatts)", col="Red", main="Global Active Power"))
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()