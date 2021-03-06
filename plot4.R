cDateTime <- function(cDate, cTime) {
  strptime(paste(cDate, cTime, sep=" "), format="%d/%m/%Y %H:%M:%S")
}
fname <- "household_power_consumption.txt"
fullDataSet <- read.table(fname, sep=";", dec=".", header = TRUE, na.strings="?", stringsAsFactor=FALSE)
febDataSet <- fullDataSet[fullDataSet$Date %in% c("1/2/2007", "2/2/2007"), ]
png(file = "plot4.png",  width = 480 , height = 480)

par( mfrow = c( 2, 2 ) )

x<-cDateTime(febDataSet$Date, febDataSet$Time)
y<-febDataSet$Global_active_power
plot(x, y, xlab="", ylab="Global Active Power (killowatts)", main="", type="l", cex.lab = 1.1)

y<-febDataSet$Voltage
plot(x, y, xlab="datetime", ylab="Voltage", main="", type="l", cex.lab = 1.1)

y1<-febDataSet$Sub_metering_1
y2<-febDataSet$Sub_metering_2
y3<-febDataSet$Sub_metering_3
plot(x, y1, xlab="", ylab="Energy Sub Metering", main="", type="l", cex.lab = 1.1)
lines(x, y2, col="red", type="l")
lines(x, y3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"), bty='n', cex=.75)

y<-febDataSet$Global_reactive_power
plot(x, y, xlab="datetime", ylab="Global_reactive_power", main="", type="l", cex.lab = 1.1)

dev.off()