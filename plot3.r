dataAll<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

dataSub<-dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007"),]

dataSub$Sub_metering_1<-as.numeric(dataSub$Sub_metering_1)
dataSub$Sub_metering_2<-as.numeric(dataSub$Sub_metering_2)
dataSub$Sub_metering_3<-as.numeric(dataSub$Sub_metering_3)

dateT<-paste(dataSub$Date, dataSub$Time)
dateT2<-strptime(dateT, "%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)
plot(dateT2, dataSub$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering",col="black")
lines(dateT2,dataSub$Sub_metering_2,type="l",col="red")
lines(dateT2,dataSub$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()