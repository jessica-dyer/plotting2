#******************************************************************
#Step 0. Downloading dependencies
#******************************************************************
library(tidyverse)
library(plyr)
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
library(RColorBrewer)

#******************************************************************
#Step 1. Downloading & unzipping data
#******************************************************************
if(!file.exists("./data")){dir.create("./data")}

if(!exists("NEI")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  zipF <- "./data/emissions_data.zip"
  
  if(!file.exists(zipF)) {
    download.file(fileUrl, destfile = "./data/emissions_data.zip", method = "curl")
    outDir <- "./data"
    unzip(zipF, exdir = outDir)
  }
  
  if(!exists("NEI")) {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  }
  
  if(!exists("SCC")) {
  SCC <- readRDS("data/Source_Classification_Code.rds")
  }
}

theme(
  # Change axis lines
  axis.line = element_line(),
  
  # Change axis ticks text labels: font color, size and face
  axis.text = element_text(),       # Change tick labels for all axes
  axis.text.x = element_text(),     # Change x axis tick labels only
  axis.text.x.top = element_text(), # x axis tick labels on top axis
  axis.text.y = element_text(),     # Change y axis tick labels only
  axis.text.y.right = element_text(),# y  axis tick labels on top axis
  
  # Change axis ticks line: font color, size, linetype and length
  axis.ticks = element_line(),      # Change ticks line fo all axes
  axis.ticks.x = element_line(),    # Change x axis ticks only
  axis.ticks.y = element_line(),    # Change y axis ticks only
  axis.ticks.length = unit(3, "pt") # Change the length of tick marks
)