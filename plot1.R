## Load all necessary data & packages to build the plot:

source("data_loading.R")

## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008. 

totalNEI <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png", width = 480, height = 480)

plot1 <- plot(totalNEI$year, totalNEI$Emissions, type = "b", col = "deepskyblue2", 
              main = expression("Total US "~ PM[2.5]~ "Emissions: 1999-2008"), 
              ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), 
              xlab = "Year", 
              pch = 1)
dev.off()