# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.

# make sure files are in the working directory

# requires:
# data.table package

# load required libraries
library(data.table)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate Emissions by year, county, type and filter "24510"
total.emissions.baltimore.type <- NEI.DT[, sum(Emissions), by=c("year", "fips", "type")][fips == "24510"]

# Open the PNG device
png(filename="plot3.png", width=480, height=480, units="px")

## Plot emissions per year grouped by source type using ggplot2 plotting system
## NON-ROAD, NONPOINT, ON-ROAD type sources have seen decreases in emissions.
## POINT type has seen increased emissions until year 2005 and then decreased.
library(ggplot2)
g = ggplot(total.emissions.baltimore.type, aes(year, V1))
g + geom_point() + 
  geom_line(aes(color = type)) + 
  labs(x = "Year") + labs(y = "Emissions") +
  labs(title = "Baltimore City Emissions")
ggsave(filename="plot4.png", width=4.80, height=4.80, dpi=100)

# Close the PNG device
dev.off()