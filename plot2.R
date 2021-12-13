data_full <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#formatting date and time now 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

#making the plot and saving
plot(data$Global_active_power~data$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()