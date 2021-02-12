###Fourth Plot###

##Load the dataset and take only the data of the two days 01/02/2007 and 02/02/2007
library(data.table)
dataset <-data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)) 
TwoDays<-subset(dataset, subset= Date=="1/2/2007" | Date=="2/2/2007") 

#Set the variables that we need
library(lubridate)
Sys.setlocale("LC_TIME", "C") ##set the weeknames in english....
GlobalActPow <- as.numeric(TwoDays$Global_active_power)
DateTime<-with(TwoDays, dmy(Date) + hms(Time)) #unify tha dates and the times...
SubMetering1<-as.numeric(TwoDays$Sub_metering_1)
SubMetering2<-as.numeric(TwoDays$Sub_metering_2)
SubMetering3<-as.numeric(TwoDays$Sub_metering_3)
Voltage <- as.numeric(TwoDays$Voltage)
GlobalReact <- as.numeric(TwoDays$Global_reactive_power)
par(mfrow = c(2, 2)) #set 2 rows and 2 columns, 4 graphics 

#First plot
plot(DateTime,GlobalActPow,xlab="",ylab="Global Active Power",type="l") 

#Second plot
plot(DateTime, Voltage,xlab="datetime",ylab="Voltage",type="l" )

#Third plot
plot(DateTime,SubMetering1, xlab="",ylab="Energy sub metering",type="l")
points(DateTime,SubMetering2,type="l", col="red" )
points(DateTime,SubMetering3, type="l", col="blue" )
legend("topright", bty="n", adj = c(0.35,0.2),x.intersp = 5,y.intersp= 0.7, lty=1, cex=0.7,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


#Fourth plot
plot(DateTime, GlobalReact,xlab="datetime",ylab="Global_reactive_power",type="l" )

#Create the png file
dev.copy(png, file = "plot4.png")  ## credo il file, non so come ma è già impostato 480 x 480 pixel
dev.off()
