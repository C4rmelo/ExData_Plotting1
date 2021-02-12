###First Plot###

#Load the dataset and take only the data of the two days 01/02/2007 and 02/02/2007
library(data.table)
dataset <-data.table(read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)) 
TwoDays<-subset(dataset, subset= Date=="1/2/2007" | Date=="2/2/2007") 

#Create the plot and save it as png file
GlobalActPow <- as.numeric(TwoDays$Global_active_power)
hist(GlobalActPow, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")  
dev.off()