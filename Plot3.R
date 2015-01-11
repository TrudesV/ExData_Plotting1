Elec_Cons <- read.table(text = grep("^[1,2]/2/2007", 
      readLines("household_power_consumption.txt"), value = TRUE), 
      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
      "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      na.strings = "?", sep = ";", header = TRUE)

Elec_Cons$Date <- as.Date(Elec_Cons$Date, format = "%d/%m/%Y")

## Convert dates
datetime <- paste(as.Date(Elec_Cons$Date), Elec_Cons$Time)
Elec_Cons$Datetime <- as.POSIXct(datetime)

## Plot 3
png(file = "Plot3.png", width = 480, height = 480)

with(Elec_Cons, {
      plot(Sub_metering_1 ~ Datetime, type = "l", 
           ylab = "Global Active Power (kilowatts)", xlab = "")
      lines(Sub_metering_2 ~ Datetime, col = 'Red')
      lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()