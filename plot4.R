##Read the data from the text file
power <- read.table("household_power_consumption.txt", header = T, sep=";")

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
df <- power[(power$Date =="2007-02-01") | (power$Date == "2007-02-02"),]
t <- strptime(with(df,paste(Date, Time)),"%Y-%m-%d %H:%M:%S")

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

##Making plot 4
par(mfrow=c(2,2))

##Plot #1
plot(t, df$Global_active_power,type = "l", xlab="", ylab="Global Active Power (kilowatts)")

##Plot #2
plot(t, df$Voltage,type = "l", xlab="datetime", ylab="Voltage")

##Plot #3
plot(t,df$Sub_metering_1,type = "l", xlab = "", ylab ="Energy Sub Metering")
lines(t,df$Sub_metering_2,col="red")
lines(t,df$Sub_metering_3,col="blue")
legend("topright", inset=0.02, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = c(1,1), lwd = c(1,1), bty = "n",cex = .6)  
       ##bty for no box, cex for shrinking the text

##Plot #4
plot(t, df$Global_reactive_power,type = "l", xlab="datetime")

dev.copy(png, "plot4.png", width=480, height=480)
dev.off()