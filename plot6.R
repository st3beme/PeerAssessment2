################################# 
# File: plot6.R
# Description: Course Project 2 Plot 6
# Date: 4/24/2015
# Author: SD
# Notes: Creates plot6.png
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
balt$city <- "Baltimore City, MD"
la <- subset(dat,fips == "06037")
la$city <- "Los Angeles County, CA"
dat <- rbind(balt,la)


##Plot
png("plot6.png", width=480,height=480)
p <- ggplot(dat,aes(x=year,y=Emissions,fill=city)) + 
 geom_bar(stat="identity") + 
 facet_grid(.~city) +
 theme_bw() +
 guides(fill=F) +
 labs(x="Year", y=expression("PM"[2.5]*" Emissions (000s)")) +
 labs(title = expression("Total PM"[2.5]*" Vehicle Emissions"))
print(p)
dev.off()

