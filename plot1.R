##Read the data from the text file
power <- read.table("household_power_consumption.txt", header = T, sep=";")

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
df <- power[(power$Date =="2007-02-01") | (power$Date == "2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

##Plot 1
dev.cur()
hist(df$Global_active_power,main="Global Active Power", col="red", 
              xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
