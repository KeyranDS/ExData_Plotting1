data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

data$Date_Time<-paste(data$Date,data$Time)
data$Date_Time<-strptime(data[,10],"%d/%m/%Y %H:%M:%S")

data[,3]<-as.numeric(as.character(data[,3]))
data[,4]<-as.numeric(as.character(data[,4]))
data[,5]<-as.numeric(as.character(data[,5]))
data[,7]<-as.numeric(as.character(data[,7]))
data[,8]<-as.numeric(as.character(data[,8]))
data[,9]<-as.numeric(as.character(data[,9]))

png("plot4.png")*
        
par(mfrow=c(2,2))

with(data,plot(Date_Time,Global_active_power,col="black",pch=".",xlab="",ylab="Global Active Power (kilowatts)"))
lines(data$Date_Time,data$Global_active_power,col="black")

with(data,plot(Date_Time,Voltage,col="black",pch=".",xlab="datetime",ylab="Voltage"))
lines(data$Date_Time,data$Voltage,col="black")

with(data, plot(Date_Time,Sub_metering_1,col="black",pch=".",xlab="",ylab="Energy sub metering"))
with(data, points(Date_Time,Sub_metering_2,col="red",pch="."))
with(data, points(Date_Time,Sub_metering_3,col="blue",pch="."))
with(data, lines(Date_Time,Sub_metering_1,col="black"))
with(data, lines(Date_Time,Sub_metering_2,col="red"))
with(data, lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

with(data,plot(Date_Time,Global_reactive_power,col="black",pch=".",xlab="datetime",ylab="Global_reactive_power"))
lines(data$Date_Time,data$Global_reactive_power,col="black")

dev.off()