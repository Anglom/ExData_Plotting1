dataAll<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

dataSub<-dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007"),]

dataSub$Global_active_power<-as.numeric(dataSub$Global_active_power)
dataSub$Voltage<-as.numeric(dataSub$Voltage)
dataSub$Global_reactive_power<-as.numeric(dataSub$Global_reactive_power)
dataSub$Sub_metering_1<-as.numeric(dataSub$Sub_metering_1)
dataSub$Sub_metering_2<-as.numeric(dataSub$Sub_metering_2)
dataSub$Sub_metering_3<-as.numeric(dataSub$Sub_metering_3)

dateT<-paste(dataSub$Date, dataSub$Time)
dateT2<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#plot 2
plot(dateT2, dataSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot voltage
plot(dateT2, dataSub$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 3
plot(dateT2, dataSub$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering",col="black")
lines(dateT2,dataSub$Sub_metering_2,type="l",col="red")
lines(dateT2,dataSub$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#plot global reactive power
plot(dateT2, dataSub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()