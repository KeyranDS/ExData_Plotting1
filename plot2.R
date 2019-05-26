data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

data$Date_Time<-paste(data$Date,data$Time)
data$Date_Time<-strptime(data[,10],"%d/%m/%Y %H:%M:%S")

data[,3]<-as.numeric(as.character(data[,3]))

with(data,plot(Date_Time,Global_active_power,col="black",pch="",xlab="",ylab="Global Active Power (kilowatts)"))
lines(data$Date_Time,data$Global_active_power,col="black")

dev.copy(png,"plot2.png")
dev.off()