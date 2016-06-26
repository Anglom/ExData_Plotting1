dataAll<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
strptime(dataAll$Time,"%h:%m:%s")
strptime(dataAll$Date,"%d-%m-%y")
dataSub<-dataAll[dataAll$Date %in% c("1/2/2007","2/2/2007"),]

dataSub$Global_active_power<-as.numeric(dataSub$Global_active_power)
png("plot1.png",width=480,height=480)
hist(dataSub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()