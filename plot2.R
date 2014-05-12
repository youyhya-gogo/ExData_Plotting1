cDateTime <- function(cDate, cTime) {
  strptime(paste(cDate, cTime, sep=" "), format="%d/%m/%Y %H:%M:%S")
}

fname <- "household_power_consumption.txt"
fullDataSet <- read.table(fname, sep=";", dec=".", header = TRUE, na.strings="?", stringsAsFactor=FALSE)
febDataSet <- fullDataSet[fullDataSet$Date %in% c("1/2/2007", "2/2/2007"), ]
png(file = "plot2.png",  width = 480 , height = 480)
x<-cDateTime(febDataSet$Date, febDataSet$Time)
y<-febDataSet$Global_active_power
plot(x, y, xlab="", ylab="Global Active Power (killowatts)", main="", type="l")
dev.off()