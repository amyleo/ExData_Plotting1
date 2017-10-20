##Read the data from the text file
power <- read.table("household_power_consumption.txt", header = T, sep=";")

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
df <- power[(power$Date =="2007-02-01") | (power$Date == "2007-02-02"),]
t <- strptime(with(df,paste(Date, Time)),"%Y-%m-%d %H:%M:%S")

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

##Plot 3
plot(t,df$Sub_metering_1,type = "l", xlab = "", ylab ="Energy Sub Metering")
lines(t,df$Sub_metering_2,col="red")
lines(t,df$Sub_metering_3,col="blue")
legend("topright", inset=0.02, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = c(1,1), lwd = c(1,1))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
