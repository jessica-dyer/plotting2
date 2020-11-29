## Load all necessary data & packages to build the plot:

source("data_loading.R")

## 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
  
scc_subset <- SCC[grepl("coal",SCC$Short.Name, ignore.case = T), ]
coal_df <- NEI[NEI$SCC %in% scc_subset$SCC, ]

coal_plot_data <- aggregate(Emissions ~ year*type, coal_df, sum)

png("plot4.png", width = 480, height = 480)

ggplot(coal_plot_data, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))

dev.off()