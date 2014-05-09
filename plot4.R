powerdata <- read.table("./data/household_power_consumption.txt", sep =";", header = TRUE, na.strings = c("?"))
# Filtering dates
powerdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"),]
# Date conversion
powerdata$Datetime <- paste(powerdata$Date, powerdata$Time)
powerdata$Datetime <- strptime(powerdata$Datetime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png") 
#Right png structure
par(mfrow = c(2,2))
plot(powerdata$Datetime, powerdata$Global_active_power, type = "l", main = " ", ylab = "Global Active Power", xlab = " ")
plot(powerdata$Datetime, powerdata$Voltage, type = "l", main = " ", ylab = "Voltage", xlab = "datetime")
with(powerdata, plot(Datetime, Sub_metering_1, ylab ="Energy sub metering", xlab = " ", type = "l"))
with(powerdata, points(Datetime, Sub_metering_2, col = "red", type = "l" ))
with(powerdata, points(Datetime, Sub_metering_3, col = "blue", type = "l" ))
legend("topright", pch = "_____", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ),
       bty = "n")
plot(powerdata$Datetime, powerdata$Global_reactive_power, type = "l", main = " ", ylab = "Global_reactive_powe", xlab = "datetime")

dev.off()