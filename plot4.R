url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path<-"./epc/epc.zip"
download.file(url,destfile="./epc/epc.zip")
unzip("./epc/epc.zip")
epc<-read.table("./epc/household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
epc$Date<-as.Date(epc$Date, "%d/%m/%Y")
epc1 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
names(epc1)
epc1$Date<-as.character(epc1$Date)
epc1$Time<-as.character(epc1$Time)
epc1$DuT <- strptime(paste(epc1$Date, epc1$Time), "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2, 2))
par(mar=c(4.1,4.1,2,1))
#1 
plot(epc1$DuT,epc1$Global_active_power,xlab="", ylab="Global Active Power ",type="l")
#2
plot(epc1$DuT,epc1$Voltage,xlab="datetime", ylab="Voltage",type="l")
#3
plot(epc1$DuT,epc1$Sub_metering_1,xlab="", ylab="Energy sub metering",type="l", col="black")
points(epc1$DuT,epc1$Sub_metering_2, col = "red",type="l")
points(epc1$DuT,epc1$Sub_metering_3, col = "blue",type="l")
legend("top", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1,bty="n", )
#4
plot(epc1$DuT,epc1$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type="l", ylim = c(0, 0.5))
dev.copy(png, file = "plot4.png")
dev.off()