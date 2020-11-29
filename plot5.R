## Load all necessary data & packages to build the plot:

source("data_loading.R")

## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?  
## NEI onroad sources include emissions from onroad vehicles that use gasoline, diesel, and other fuels. 
## These sources include light duty and heavy duty vehicle emissions from operation on roads, highway ramps, and during idling.

baltimore_auto_df <- filter(NEI, fips == "24510" & type == "ON-ROAD")

baltimore_auto_plot <- aggregate(Emissions ~ year, baltimore_auto_df, sum)

png("plot5.png", width = 480, height = 480)

ggplot(baltimore_auto_plot, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore" ~ PM[2.5] ~ "Auto Emission by Year")) +
  xlab("Year") +
  ylab(expression(~ PM[2.5] ~ "Auto Emission"))

dev.off()