################################# 
# File: plot4.R
# Description: Course Project 2 Plot 4
# Date: 4/24/2015
# Author: SD
# Notes: Creates plot4.png
# To do: 
################################# 

##load libraries
library(ggplot2)

##Read Data
setwd("C:\\Users\\ox0849\\Desktop\\Machine Learning\\Exploratory Data Analysis\\Project 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Data
comb <- grepl("comb",SCC$SCC.Level.One, ignore.case=T)
coal <- grepl("coal",SCC$SCC.Level.Four, ignore.case=T)
combcoal <- (comb & coal)
combcoal.SCC <- SCC[combcoal,]$SCC
dat <- NEI[NEI$SCC %in% combcoal.SCC,]
dat$Emissions <- dat$Emissions / 1000
dat$year <- factor(dat$year, level=c("1999","2002","2005","2008"))

##Plot
png("plot4.png", width=480,height=480)
p <- ggplot(dat,aes(x=year,y=Emissions,fill=type)) + 
 geom_bar(stat="identity") + 
 facet_grid(.~type) +
 theme_bw() +
 guides(fill=F) +
 labs(x="Year", y=expression("PM"[2.5]*" Emissions (000s)")) +
 labs(title = expression("Total PM"[2.5]*" Emissions from coal-combustion related sources"))
print(p)
dev.off()

