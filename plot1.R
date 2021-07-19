housePC <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE, 
                      sep = ";", dec = ".", na.strings= "?", header = T)

library(dplyr)
house_data <- filter(housePC, Date == "1/2/2007" | Date == "2/2/2007")


png(filename = "plot1.png", width = 480, height = 480)
with(house_data, hist(Global_active_power, col = "red", breaks = 15, 
                      xlab = "Global Active Power (kilowatts)", 
                      main = "Global Active Power"))

dev.off()






