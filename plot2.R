## Load all necessary data & packages to build the plot:

source("data_loading.R")

## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.


baltimore_df <- filter(NEI, fips == "24510")

baltimore_plot_data <- aggregate(Emissions ~ year, baltimore_df, sum)

png("plot2.png", width = 480, height = 480)

plot2 <- plot(baltimore_plot_data$year, baltimore_plot_data$Emissions, 
              col = "deepskyblue2", type = "b",
              main = expression("Total US "~ PM[2.5]~ "Emissions: 1999-2008 in Baltimore"), 
              ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), 
              xlab = "Year", 
              pch = 1)
abline(lm(Emissions ~ year, data= baltimore_plot_data), col = "red")

dev.off()