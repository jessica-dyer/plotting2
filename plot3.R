## Load all necessary data & packages to build the plot:

source("data_loading.R")

## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four 
## sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

baltimore_plot_data_2 <- aggregate(Emissions ~ year*type, baltimore_df, sum)

png("plot3.png", width = 480, height = 480)

plot <- qplot(year, Emissions, data = baltimore_plot_data_2, col = type, facets = .~type, ylab = expression("Total US "~   PM[2.5] ~ "Emissions"), xlab = "Year") + geom_line()

plot + theme(axis.text.x = element_text(angle = 90))

dev.off()