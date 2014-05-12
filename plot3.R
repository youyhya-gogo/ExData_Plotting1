cDateTime <- function(cDate, cTime) {
  strptime(paste(cDate, cTime, sep=" "), format="%d/%m/%Y %H:%M:%S")
}

fname <- "household_power_consumption.txt"
fullDataSet <- read.table(fname, sep=";", dec=".", header = TRUE, na.strings="?", stringsAsFactor=FALSE)
febDataSet <- fullDataSet[fullDataSet$Date %in% c("1/2/2007", "2/2/2007"), ]
png(file = "plot3.png",  width = 480 , height = 480)
x<-cDateTime(febDataSet$Date, febDataSet$Time)
y1<-febDataSet$Sub_metering_1
y2<-febDataSet$Sub_metering_2
y3<-febDataSet$Sub_metering_3
plot(x, y1, xlab="", ylab="Energy Sub Metering", main="", type="l")
lines(x, y2, col="red", type="l")
lines(x, y3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"), bty='n', cex=.75)
dev.off()