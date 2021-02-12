###Second Plot###


##Load the dataset and take only the data of the two days 01/02/2007 and 02/02/2007
library(data.table)
dataset <-data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)) 
TwoDays<-subset(dataset, subset= Date=="1/2/2007" | Date=="2/2/2007") 


#Create the plot and save it as png file
library(lubridate)
Sys.setlocale("LC_TIME", "C") #set the weeknames in english....
GlobalActPow <- as.numeric(TwoDays$Global_active_power)
DateTime<-with(TwoDays, dmy(Date) + hms(Time)) #unify tha dates and the times...
plot(DateTime,GlobalActPow,xlab="",ylab="Global Active Power (Kilowatts)",type="l")
dev.copy(png, file = "plot2.png")  
dev.off()