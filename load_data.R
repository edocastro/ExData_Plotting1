setwd("C:/Dropbox/work/Coursera/Data Science/Exploratory Data Analysis")

library(httr) 

data_source_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
data_set <- "data_set"


data_file_zip <- "household_power_consumption.zip"


##download.file(data_source_url, data_file_zip, mode="wb")

unzip(data_file_zip, list = FALSE, overwrite = TRUE)

data_file <- "household_power_consumption.txt"

data_set <- read.table(data_file, header=TRUE,sep = ";", na="?")

data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

dates_filter <- as.Date(c("2007/02/01", "2007/02/02"), "%Y/%m/%d")

data_set_filtered <- subset(data_set, Date %in% dates_filter )
  
  
data_set_filtered$Global_active_power <- as.numeric(as.character(data_set_filtered$Global_active_power))
data_set_filtered$Global_reactive_power <- as.numeric(as.character(data_set_filtered$Global_reactive_power))
data_set_filtered$Voltage <- as.numeric(as.character(data_set_filtered$Voltage))

data_set_filtered$TimeDate <- strptime(paste(data_set_filtered$Date, data_set_filtered$Time), "%Y-%m-%d %H:%M:%S")

##data_set_filtered <- transform(data_set_filtered, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

data_set_filtered$Sub_metering_1 <- as.numeric(as.character(data_set_filtered$Sub_metering_1))
data_set_filtered$Sub_metering_2 <- as.numeric(as.character(data_set_filtered$Sub_metering_2))
data_set_filtered$Sub_metering_3 <- as.numeric(as.character(data_set_filtered$Sub_metering_3))

