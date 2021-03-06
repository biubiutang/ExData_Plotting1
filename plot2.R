dataset<-read.table("~/Downloads/household_power_consumption.txt",header = T,sep = ";")
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")
data<-subset(dataset,Date=="2007-02-01"|Date=="2007-02-02")
data$NEW<-strptime(paste(data$Date,data$Time,sep=""),format = "%Y-%m-%d %H:%M:%S")
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
png(file="plot2.png",width = 480,height = 480)
plot(data$NEW,data$Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)",xlab = "")
dev.off()