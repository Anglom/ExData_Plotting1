dataAll<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")

dataSub<-dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007"),]

dataSub$Global_active_power<-as.numeric(dataSub$Global_active_power)

dateT<-paste(dataSub$Date, dataSub$Time)
dateT2<-strptime(dateTime, "%d/%m/%Y %H:%M:%S")

png("plot2.png",width=480,height=480)
plot(dateT2, dataSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()