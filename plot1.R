getwd()
dir()
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep = ";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red", cex.sub=0.8)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()