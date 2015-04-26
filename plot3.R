################################# 
# File: plot3.R
# Description: Course Project 2 Plot 3
# Date: 4/24/2015
# Author: SD
# Notes: Creates plot3.png
# To do: 
################################# 

##Read Data
setwd("C:\\Users\\ox0849\\Desktop\\Machine Learning\\Exploratory Data Analysis\\Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

##Data
balt <- subset(NEI,fips == "24510")
dat <- aggregate(balt[c("Emissions")], list(type = balt$type,year = balt$year), sum)
dat$Emissions <- dat$Emissions / 1000
dat$year <- factor(dat$year, level=c("1999","2002","2005","2008"))

##Plot
png("plot3.png", width=480,height=480)
p <- ggplot(dat,aes(x=year,y=Emissions,fill=type)) + 
 geom_bar(stat="identity") + 
 facet_grid(.~type) +
 theme_bw() +
 guides(fill=F) +
 labs(x="Year", y=expression("PM"[2.5]*" Emissions (000s)")) +
 labs(title = expression("Total PM"[2.5]*" Emissions in Baltimore City, MD by Type")) +
 theme(axis.text.x = element_text(angle=90, hjust=0, vjust=0))
print(p)
dev.off()

