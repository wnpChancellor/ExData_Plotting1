# Read in data #
data<-read.csv("/Users/jingshi/desktop/Coursera/household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")


#Subset #
datasub<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#Create and format weekday variable#
datasub$day<-paste(datasub$Date,datasub$Time, sep=" ")
datasub$day<-as.POSIXct(datasub$day,format="%d/%m/%Y %H:%M:%S")

#Plot3 and save as PNG#
png("/Users/jingshi/desktop/Coursera/plot3.png",width=480,height=480)
plot(datasub$day,datasub$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
par(new=T)
lines(datasub$day,datasub$Sub_metering_2,col="red",type="l")
par(new=T)
lines(datasub$day,datasub$Sub_metering_3,col="blue",type="l")
par(new=F)
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,merge=FALSE)
dev.off()
