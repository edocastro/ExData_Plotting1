plot(data_set_filtered$TimeDate, data_set_filtered$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data_set_filtered$TimeDate, data_set_filtered$Sub_metering_2, type="l", col="red")
lines(data_set_filtered$TimeDate, data_set_filtered$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
