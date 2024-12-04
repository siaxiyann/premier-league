#### Preamble ####
# Purpose: Cleans the raw plane data, selecting data for only Manchester City in Premier League
# Author: Xiyan Chen
# Date: 3 December 2024
# Contact: xiyan.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - 00-simulate_data.R and 01-test_simulated_data and 02-download_data must have been run
# Any other information needed? 

#### Workspace setup ####
library(tidyverse)


#### Load raw data ####
raw_data <- read_csv("downloads/starter_folder-main 4/data/01-raw_data/matches.csv")

#### Clean Data ####
# Select required columns and filter rows for Manchester City
analysis_data <- raw_data %>%
  select(season, league_id,league, team1, team2, spi1, spi2, prob1, prob2) %>%
  filter(league_id == 2411) %>%
  filter(team1 == "Manchester City"| team2 == "Manchester City")

#### Save cleaned data ####
# Save the cleaned data to a new file
write_csv(analysis_data, "downloads/starter_folder-main 4/data/02-analysis_data/analysis_data.csv")

