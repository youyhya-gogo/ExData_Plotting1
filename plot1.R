fname <- "household_power_consumption.txt"
fullDataSet <- read.table(fname, sep=";", dec=".", header = TRUE, na.strings="?", stringsAsFactor=FALSE)
febDataSet <- fullDataSet[fullDataSet$Date %in% c("1/2/2007", "2/2/2007"), ]
png(file = "plot1.png",  width = 480 , height = 480)
hist(febDataSet$Global_active_power, col="red", xlab="Global Active Power (killowatts)",  ylab="Frequency", main="Global Active Power", ylim=c(0,1200))
dev.off()