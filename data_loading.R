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
