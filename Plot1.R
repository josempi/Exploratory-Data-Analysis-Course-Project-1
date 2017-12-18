######################################################################################################
##                                                                                                  ##
## This is the Exploratory Data Analysis Assignment1 R script                                       ##
## Title: Plot 1                                                                                    ##
##                                                                                                  ##
## Author: Jose M. Pi                                                                               ##
## Date: 12/17/2017                                                                                 ##
## Version 1.0                                                                                      ##
## File source: UCI Machine Learning Respository                                                    ##
## Link: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption    ##
##                                                                                                  ##
######################################################################################################


##############################
##  SETUP WORKING DIRECTORY ##
##############################
setwd("~/Documents/Data Science/Exploratory Data Analysis/Week 1")
## Create the subdirectory "data" if not already found.
if(!file.exists("./Data")){dir.create("./Data")}
setwd("~/Documents/Data Science/Exploratory Data Analysis/Week 1/Data")

######################
##  LOAD LIBRARY    ##
######################

library(ggplot2)


##############################
##  FILE RETRIEVAL SECTION  ##
##############################
## Get the zip file for the project.
## Assign the file link/ location to fileUrl.
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## Download the file
download.file(fileUrl,destfile="./Data/Dataset.zip",method="curl")

## Unzip the file contents into the data subdirectory.
unzip(zipfile="./Data/Dataset.zip",exdir="./Data")


##############################
##  DATA LOADING SECTION    ##
##############################

## Power Consumption Data ##
## Load the data file into powerconsumption data frame   
powerconsumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Subset the data from 1/2/2007 and 2/2/2007 into powerdata
powerdata <-rbind(powerconsumption[powerconsumption$Date=="1/2/2007",],powerconsumption[powerconsumption=="2/2/2007",])


################################################
##  Run and Print the 1st Histogram Plot      ##
################################################

## Runs the Histogram Plot ##
hist(as.numeric(powerdata$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")


## Print the file
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(powerdata$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()







