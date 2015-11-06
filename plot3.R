## Exploratory Data Analysis - Course Project 1
## File - plot3.R, Output plot3.png
## Load dependent external scripts
source("install_load.R")

## Will be using the package("sqldf") for selecting the rows from the file to be loaded
## A function in install_load.R is called to load the library

install_load("sqldf")

## The downloaded dataset for electric power consumption should be placed in "data" directory
##  under the working directory

flnm <- c("./data/household_power_consumption.txt")

# Read only the rows for the selected dates using the library(sqldn)
dset <- read.csv.sql( flnm, sql='select * from file where Date =="1/2/2007" or Date = "2/2/2007"', header=TRUE, sep=";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

dset$Time <- strptime(paste(dset$Date,dset$Time), format = "%d/%m/%Y %H:%M:%S")
dset$Date <- as.Date(dset$Date, "%d/%m/%Y")

## Set the device to png with height and width as 480
## Output - plot3.png file will be created in the current working directory

png( filename = "plot3.png", height = 480, width = 480 )
par(lty=1, lwd=1)

## Plot the graph
plot(dset$Time, dset$Sub_metering_1, type ="l", col = "black", ylab = "Energy sub metering", xlab = "")

## Add lines to the base plot
lines(dset$Time, dset$Sub_metering_2, col ="red")

## Add lines to the base plot
lines(dset$Time, dset$Sub_metering_3, col ="blue")

## Add legend to the base plot
legend(x = "topright", lwd = 2, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

dev.off()
