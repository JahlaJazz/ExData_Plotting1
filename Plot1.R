
# define the path of the working directory - this is the same directory that contains the data file
ff <- "C:/Users/Andre/ExpAna/"
# point to the working directory
setwd(ff)

# read in the data
sdata <- read.csv(file = "household_power_consumption.txt", header=TRUE,sep=";", as.is = TRUE, na.strings = "?")
# pick on the dates corresponding to the 1st or 2nd of Feburary 2007
sdata <- sdata[sdata$Date %in% c("1/2/2007", "2/2/2007"),]

# create the first plot
png(file = "Plot1.png", width = 480, height = 480, units = "px")
hist(sdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
 
# close PNG device
dev.off()
