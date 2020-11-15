source("data_loading.R")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# 
plot3 <- plot(NEI$Emissions, type = "l",
              xlab = " ", ylab = "Energy sub metering",  lty = 1, lwd = 1)