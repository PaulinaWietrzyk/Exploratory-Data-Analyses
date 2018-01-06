# Plotting plot1.R

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

# Plotting the histogram
plot1 <- as.numeric(as.character(subset2007$Global_active_power))
hist(plot1, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Saving the histogram as PNG file 
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()


