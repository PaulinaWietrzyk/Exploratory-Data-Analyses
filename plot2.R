# Plotting plot2.R

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

# Plotting the figure
Sys.setlocale(category = "LC_ALL", "ENG")
with(subset2007, plot(Global_active_power~mydatatime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Saving the histogram as PNG file 
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()

