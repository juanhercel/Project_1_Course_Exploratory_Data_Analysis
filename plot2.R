housePC <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, 
                      sep = ";", dec = ".", na.strings= "?", header = T)

library(dplyr)
house_data <- filter(housePC, Date == "1/2/2007" | Date == "2/2/2007")

house_data <- mutate(house_data, fecha = strptime(paste(house_data$Date , house_data$Time), 
                                                  format = "%d/%m/%Y %H:%M:%S")) 
## date time in Spanish , Sorry!

png(filename = "plot2.png", width = 480, height = 480)

with(house_data, plot(fecha , Global_active_power, type = "l", 
                      ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()



