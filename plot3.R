plot3 <- function() {
  zip<-unz("exdata-data-household_power_consumption.zip",filename="household_power_consumption.txt")
  data <- read.csv(zip,  sep=";", na.strings=c("", " ", "?"), as.is=c("Date", "Time"))
  data$DateTime <- paste(data$Date, data$Time)
  data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
  data$Date <- strptime(data$Date, format="%d/%m/%Y")
  a <- data[(data$Date >= strptime("2007-02-01", format="%Y-%m-%d") ) & ( data$Date <= strptime("2007-02-02", format="%Y-%m-%d")),]
  png(filename="plot3.png", width=480, height=480, units="px")
  plot(x=a$DateTime,y=a$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab="")
  with(a, plot(x=a$DateTime,y=a$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
  with(a, points(x=a$DateTime,y=a$Sub_metering_2, col="red", type="l"))
  with(a, points(x=a$DateTime,y=a$Sub_metering_3, col="blue", type="l"))
  legend("topright", pch=NA, col=c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1))
  dev.off()
}