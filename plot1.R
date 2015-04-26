################################# 
# File: plot1.R
# Description: Course Project 2 Plot 1
# Date: 4/24/2015
# Author: SD
# Notes: Creates plot1.png
# To do: 
################################# 

##Read Data
setwd("C:\\Users\\ox0849\\Desktop\\Machine Learning\\Exploratory Data Analysis\\Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Data
dat <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)
dat$Emissions <- dat$Emissions / 1000

##Plot
png("plot1.png", width=480,height=480)
with(dat,barplot(Emissions, names.arg=year,
   main=expression("Total PM"[2.5]*" Emissions in the US"),
   xlab = "Year",ylab = expression("PM"[2.5]*" Emissions (000s)")))
dev.off()


