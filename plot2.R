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
plot(epc1$DuT,epc1$Global_active_power,xlab="", ylab="Global Active Power (kilowatt)",type="l")
dev.copy(png, file = "plot2.png")
dev.off()