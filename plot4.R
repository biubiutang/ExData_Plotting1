dataset<-read.table("~/Downloads/household_power_consumption.txt",header = T,sep = ";")
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")
data<-subset(dataset,Date=="2007-02-01"|Date=="2007-02-02")
data$Time<-strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%OS")
#change the format of the numbers
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.character(data$Sub_metering_1)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.character(data$Sub_metering_2)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Voltage<-as.character(data$Voltage)
data$Voltage<-as.numeric(data$Voltage)
data$Global_reactive_power<-as.character(data$Global_reactive_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
#paint pictures
png(file="plot4.png")
par(mfcol=c(2,2),mar=c(4,4,1,1))

plot(data$Time,data$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")

plot(data$Time,data$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2,col="red",type="l")
lines(data$Time,data$Sub_metering_3,col="blue",type="l")
legend("topright",lty="solid",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$Time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(data$Time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()