#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)


#### Load raw data ####
raw_data <- read_csv("downloads/starter_folder-main 4/data/01-raw_data/matches.csv")

#### Clean Data ####
# Select required columns and filter rows for league_id 2411
analysis_data <- raw_data %>%
  select(season, league_id, league, team1, team2, spi1, spi2, prob1, prob2) %>%
  filter(league_id == 2411)

#### Save cleaned data ####
# Save the cleaned data to a new file
write_csv(analysis_data, "downloads/starter_folder-main 4/data/02-analysis_data/analysis_data.csv")

