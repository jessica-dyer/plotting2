## Load all necessary data & packages to build the plot:

source("data_loading.R")

## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
## Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?  
  
baltimore_la_df <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")

baltimore_la_plot <- aggregate(Emissions ~ year*fips, baltimore_la_df, sum)

png("plot6.png", width = 480, height = 480)

ggplot(baltimore_la_plot, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore & Los Angeles" ~ PM[2.5] ~ "Auto Emission by Year")) +
  xlab("Year") +
  ylab(expression(~ PM[2.5] ~ "Auto Emission")) + 
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))

dev.off()