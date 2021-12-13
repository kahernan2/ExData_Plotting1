data_full <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#formatting date and time now 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

## making plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~DateTime, type = "l",
             ylab = "Global Active Power", xlab = "", cex = 0.8)
        plot(Voltage~DateTime, type = "l",
             ylab = "Voltage", xlab = "datetime", cex = 0.8)
        plot(Sub_metering_1~DateTime, type="l",
             ylab = "Energy sub metering", xlab = "", cex = 0.8)
        lines(Sub_metering_2~DateTime, col = 'Red')
        lines(Sub_metering_3~DateTime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
        plot(Global_reactive_power~DateTime, type = "l",
             ylab = "Global_reactive_power", xlab = "datetime", cex = 0.8)
})

## saving plots 
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()