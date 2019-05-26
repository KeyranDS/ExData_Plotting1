data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

data$Date_Time<-paste(data$Date,data$Time)
data$Date_Time<-strptime(data[,10],"%d/%m/%Y %H:%M:%S")

data[,7]<-as.numeric(as.character(data[,7]))
data[,8]<-as.numeric(as.character(data[,8]))
data[,9]<-as.numeric(as.character(data[,9]))

png("plot3.png")

with(data, plot(Date_Time,Sub_metering_1,col="black",pch=".",xlab="",ylab="Energy sub metering"))
with(data, points(Date_Time,Sub_metering_2,col="red",pch="."))
with(data, points(Date_Time,Sub_metering_3,col="blue",pch="."))
with(data, lines(Date_Time,Sub_metering_1,col="black"))
with(data, lines(Date_Time,Sub_metering_2,col="red"))
with(data, lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

dev.off()