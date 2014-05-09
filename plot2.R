powerdata <- read.table("./data/household_power_consumption.txt", sep =";", header = TRUE, na.strings = c("?"))
# Filtering dates
powerdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"),]

# Date conversion
powerdata$Datetime <- paste(powerdata$Date, powerdata$Time)
powerdata$Datetime <- strptime(powerdata$Datetime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png") 
plot(powerdata$Datetime, powerdata$Global_active_power, type = "l", main = " ", ylab = "Global Active Power (kilowatts)", xlab = " ")
 
dev.off()
