###Third Plot###

##Load the dataset and take only the data of the two days 01/02/2007 and 02/02/2007
library(data.table)
dataset <-data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)) 
TwoDays<-subset(dataset, subset= Date=="1/2/2007" | Date=="2/2/2007") 

#Create the plot and save it as png file
library(lubridate)
Sys.setlocale("LC_TIME", "C") #set the weeknames in english....
SubMetering1<-as.numeric(TwoDays$Sub_metering_1)
SubMetering2<-as.numeric(TwoDays$Sub_metering_2)
SubMetering3<-as.numeric(TwoDays$Sub_metering_3)
DateTime<-with(TwoDays, dmy(Date) + hms(Time)) #unify tha dates and the times...

plot(DateTime,SubMetering1, xlab="",ylab="Energy sub metering",type="l") #the first plot
points(DateTime,SubMetering2,type="l", col="red" ) #add submteterin2 plot
points(DateTime,SubMetering3, type="l", col="blue" ) ##add submteterin3 plot
legend("topright", adj = c(0.5, 0.5),x.intersp = 6,lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) #add legend
dev.copy(png, file = "plot3.png")  # create png file
dev.off()