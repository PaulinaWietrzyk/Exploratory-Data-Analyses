# Plotting plot4.R

# Setting the working directory
setwd("E:/7 Analizy statystyczne/RCran/Coursera R/Exploratory Data Analyses/exdata_data_household_power_consumption")

# Loading data set
mydata <- read.table("E:/7 Analizy statystyczne/RCran/Coursera R/Exploratory Data Analyses/exdata_data_household_power_consumption/household_power_consumption.txt", skip=1, sep=";", stringsAsFactors=F)
head(mydata)

# Naming the columns
names(mydata) <- c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Subsetting the data from 1/2/2007 to 2/2/2007
subset2007 <- subset(mydata,mydata$Date=="1/2/2007" | mydata$Date =="2/2/2007")
head(subset2007)

# Creating datatime column
subset2007$Date <- as.Date(subset2007$Date, format="%d/%m/%Y")
datatime <- paste(as.Date(subset2007$Date), subset2007$Time)
mydatatime <- as.POSIXct(datatime)

# Plotting the figures
Sys.setlocale(category = "LC_ALL", "ENG")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset2007, plot(Global_active_power~mydatatime, type="l", ylab="Global Active Power", xlab=""))
with(subset2007, plot(Voltage~mydatatime, type="l", ylab="Voltage", xlab="datetime"))
with(subset2007, plot(Sub_metering_1~mydatatime, type="l", ylab="Energy sub metering", xlab=""))
lines(Sub_metering_2~mydatatime, data = subset2007, col='Red') 
lines(Sub_metering_3~mydatatime, data = subset2007, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(subset2007, plot(Global_reactive_power~mydatatime, type="l", ylab="Global_Rective_Power", xlab="datetime")) 

# Saving the histogram as PNG file 
dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()

