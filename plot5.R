################################# 
# File: plot5.R
# Description: Course Project 2 Plot 5
# Date: 4/24/2015
# Author: SD
# Notes: Creates plot5.png
# To do: 
################################# 

##load libraries
library(ggplot2)

##Read Data
setwd("C:\\Users\\ox0849\\Desktop\\Machine Learning\\Exploratory Data Analysis\\Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Data
veh <- grepl("vehicle",SCC$SCC.Level.Two, ignore.case=T)
veh.SCC <- SCC[veh,]$SCC
dat <- NEI[NEI$SCC %in% veh.SCC,]
dat$Emissions <- dat$Emissions / 1000
dat$year <- factor(dat$year, level=c("1999","2002","2005","2008"))
balt <- subset(dat,fips == "24510")

##Plot
png("plot5.png", width=480,height=480)
p <- ggplot(balt,aes(x=year,y=Emissions)) + 
 geom_bar(stat="identity") + 
 theme_bw() +
 guides(fill=F) +
 labs(x="Year", y=expression("PM"[2.5]*" Emissions (000s)")) +
 labs(title = expression("Total PM"[2.5]*" Vehicle Emissions Baltimore City, MD"))
print(p)
dev.off()

