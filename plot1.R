#Parameters
datafile <- "exdata-data-household_power_consumption.zip"
datadir  <- "data"
if (!file.exists(datafile)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, datafile, method="curl")
}  
if (!file.exists(datadir)) { 
  unzip(datafile) 
}
powerdata <- read.table("./data/household_power_consumption.txt", sep =";", header = TRUE, na.strings = c("?"))
# Filtering dates
powerdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"),]

png(file = "plot1.png") 
hist(powerdata$Global_active_power ,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

