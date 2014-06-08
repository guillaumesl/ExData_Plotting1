#create the plot 1 for the exdata_plotting 
#all the function follows the same template
plot1 <- function() {
  #unzip the data
  zip<-unz("exdata-data-household_power_consumption.zip",filename="household_power_consumption.txt")
  #prepare the data and keep the time as char ( some issues with the conversion read.table)
  data <- read.csv(zip,  sep=";", na.strings=c("", " ", "?"), as.is=c("Date", "Time"))
  data$DateTime <- paste(data$Date, data$Time)
  data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
  data$Date <- strptime(data$Date, format="%d/%m/%Y")
  #can filter on date type...
  a <- data[(data$Date >= strptime("2007-02-01", format="%Y-%m-%d") ) & ( data$Date <= strptime("2007-02-02", format="%Y-%m-%d")),]
  png(filename="plot1.png", width=480, height=480, units="px")
  hist(x=a$Global_active_power, breaks=20, xlab="Global Active Power(kilowatts)", main="Global Active Power", col="red")
  #release the device
  dev.off()
}