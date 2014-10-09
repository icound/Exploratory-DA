url<-"httpurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path<-"./epc/epc.zip"
download.file(url,destfile="./epc/epc.zip")
unzip("./epc/epc.zip")
epc<-read.table("./epc/household_power_consumption.txt",sep=";",header=TRUE, na.strings = "?")
epc$Date<-as.Date(epc$Date, "%d/%m/%Y")
epc1 <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")
names(epc1)
hist(epc1$Global_active_power,col="red",main="Global Active Power", xlab="Clobal Active Power ( kilowatt)")
dev.copy(png, file = "plot1.png")
dev.off()