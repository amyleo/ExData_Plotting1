##Read the data from the text file
power <- read.table("household_power_consumption.txt", header = T, sep=";")

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
df <- power[(power$Date =="2007-02-01") | (power$Date == "2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
t <- strptime(with(df,paste(Date, Time)),"%Y-%m-%d %H:%M:%S")

##Plot 2
dev.cur()
plot(t, df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()