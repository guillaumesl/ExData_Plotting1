plot2 <- function() {
  zip<-unz("exdata-data-household_power_consumption.zip",filename="household_power_consumption.txt")
  data <- read.csv(zip,  sep=";", na.strings=c("", " ", "?"), as.is=c("Date", "Time"))
  data$DateTime <- paste(data$Date, data$Time)
  data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
  data$Date <- strptime(data$Date, format="%d/%m/%Y")
  a <- data[(data$Date >= strptime("2007-02-01", format="%Y-%m-%d") ) & ( data$Date <= strptime("2007-02-02", format="%Y-%m-%d")),]
  png(filename="plot2.png", width=480, height=480, units="px")
  plot(x=a$DateTime,y=a$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab="")
  dev.off()
}