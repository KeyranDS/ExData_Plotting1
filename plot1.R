data<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)
data<-filter(data,Date=="1/2/2007"|Date=="2/2/2007")

data[,3]<-as.numeric(as.character(data[,3]))
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png")
dev.off()