housePC <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, 
                      sep = ";", dec = ".", na.strings= "?", header = T)

library(dplyr)
house_data <- filter(housePC, Date == "1/2/2007" | Date == "2/2/2007")
house_data <- mutate(house_data, fecha = strptime(paste(house_data$Date , house_data$Time), 
                                                  format = "%d/%m/%Y %H:%M:%S")) 

png(filename = "plot4.png", width = 480, height = 480)


par(mfrow = c(2,2))

with(house_data, {
  plot(fecha , Global_active_power, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(fecha, Voltage, type = "l", 
       xlab = "datetime", ylab = "Voltage")
  plot(fecha, Sub_metering_1, 
       type = "l", ylab = "Energy sub metering", xlab = "")
lines(house_data$fecha, house_data$Sub_metering_2, col = ("red"))
lines(house_data$fecha, house_data$Sub_metering_3, col = ("blue"))

legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  
  
  plot(fecha, Global_reactive_power, type = "l", xlab = "datetime", ylab = "")

})

dev.off()
