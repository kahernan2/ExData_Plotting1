data_full <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#formatting date and time now 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

#making the plot
with(data, {
        plot(Sub_metering_1~DateTime, type = "l",
             ylab = "Energy sub metering", xlab = "", cex = 0.8)
        lines(Sub_metering_2~DateTime, col = 'Red')
        lines(Sub_metering_3~DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue") lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)

#saving the plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()