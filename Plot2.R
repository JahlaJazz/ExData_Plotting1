# clean the workspace
rm(list=ls())
# define the path of the working directory - this is the same directory that contains the data file
ff <- "C:/Users/Andre/ExpAna/"
# point to the working directory
setwd(ff) 
library(dplyr)
# read in the data
sdata <- read.csv(file = "household_power_consumption.txt", header=TRUE,sep=";", as.is = TRUE, na.strings = "?")

# pick on the dates corresponding to the 1st or 2nd of Feburary 2007
sdata <- arrange(sdata[sdata$Date %in% c("1/2/2007", "2/2/2007"),],Date, Time)
sdata$tTime <- strptime(paste(sdata$Date, sdata$Time), "%d/%m/%Y %H:%M:%S")
sdata$wday <- weekdays(strptime(paste(sdata$Date, sdata$Time), "%d/%m/%Y %H:%M:%S"), abbreviate = TRUE)

# open a png device
png(file = "Plot2.png", width = 480, height = 480, units = "px")

#create graphic
with(sdata, plot(tTime, Global_active_power , type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)" ))

# close the device
dev.off()
