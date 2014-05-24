# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

# make sure files are in the working directory

# requires:
# data.table package

# load required libraries
library(data.table)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate Emissions by year and county and filter "24510"
total.emissions.baltimore <- NEI.DT[, sum(Emissions), by=c("year", "fips")][fips == "24510"]

# Open the PNG device
png(filename="plot2.png", width=480, height=480, units="px")


## Total emissions from PM2.5 on average decreased in the Baltimore City, Maryland from 1999 to 2008
plot(total.emissions.baltimore$year, total.emissions.baltimore$V1, type = "b", pch = 19, col = "blue", ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")

# Close the PNG device
dev.off()