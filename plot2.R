# Read in data #
data<-read.csv("/Users/jingshi/desktop/Coursera/household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?")


#Subset #
datasub<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

#Create and format weekday variable#
datasub$day<-paste(datasub$Date,datasub$Time, sep=" ")
datasub$day<-as.POSIXct(datasub$day,format="%d/%m/%Y %H:%M:%S")

#Plot2 and save as PNG#
png("/Users/jingshi/desktop/Coursera/plot2.png",width=480,height=480)
plot(datasub$day,datasub$Global_active_power,type="l",main="Plot2",xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()

