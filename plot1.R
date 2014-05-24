# Question 1 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

# NOTE:
# Inspired by : https://github.com/mgudipati/ExData_Prog2

# make sure files are in the working directory

# requires:
# data.table package

# load required libraries
library(data.table)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Convert into data.table
NEI.DT <- data.table(NEI)

# Cleanup to save memory
rm(NEI)

## Aggregate Emissions by year
total.emissions <- NEI.DT[, sum(Emissions), by="year"]

# Open the PNG device
png(filename="plot1.png", width=480, height=480, units="px")

## Plot emissions per year using basic package
## Total emissions from PM2.5 decreased in the United States from 1999 to 2008
plot(total.emissions, type = "b", pch = 19, col = "blue", ylab = "Emissions", xlab = "Year", main = "Annual Emissions")

# Close the PNG device
dev.off()