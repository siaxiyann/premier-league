#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Premier League data 
# Author: Xiyan Chen
# Date: 3 December 2024
# Contact: xiyan.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` and `dplyr` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(dplyr)

analysis_data <- read_csv("downloads/starter_folder-main 4/data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 382 rows
if (nrow(analysis_data) == 380) {
  message("Test Passed: The dataset has 380 rows.")
} else {
  stop("Test Failed: The dataset does not have 380 rows.")
}

# Check if the dataset has 8 columns
if (ncol(analysis_data) == 8) {
  message("Test Passed: The dataset has 8 columns.")
} else {
  stop("Test Failed: The dataset does not have 8 columns.")
}

# Check if all values in the 'team1' column appear 21 times
# Count occurrences of each team in the 'team1' column
team1_counts <- analysis_data %>% 
  count(team1)

# Check if all teams appear exactly 21 times
if (all(team1_counts$n == 19)) {
  message("Test Passed: All values in the 'team1' column appear exactly 19 times.")
} else {
  # Identify teams that do not appear 21 times
  problematic_teams <- team1_counts %>% 
    filter(n != 19)
  
  stop(paste("Test Failed: The following teams do not appear 19 times in the 'team1' column:", 
             paste(problematic_teams$team1, collapse = ", ")))
}

# Check if the 'team' column contains only valid team names
valid_teams <- c("Arsenal", "Aston Villa", "Bournemouth", "Brentford", "Brighton", 
                 "Burnley", "Chelsea", "Crystal Palace", "Everton", "Fulham", 
                 "Liverpool", "Luton Town", "Manchester City", "Manchester United", 
                 "Newcastle", "Nottingham Forest", "Sheffield United", 
                 "Tottenham", "West Ham", "Wolves")

# Verify for both team1 and team2 columns
if (all(analysis_data$team1 %in% valid_teams) && all(analysis_data$team2 %in% valid_teams)) {
  message("Test Passed: All values in 'team1' and 'team2' columns are valid.")
} else {
  stop("Test Failed: Invalid team names detected in 'team1' or 'team2' columns.")
}


# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check for empty strings in 'team1', 'team2' columns
if (all(analysis_data$team1 != "") && all(analysis_data$team2 != "") ) {
  message("Test Passed: No empty strings in 'team1', 'team2', or 'division' columns.")
} else {
  stop("Test Failed: Empty strings detected in 'team1', 'team2', or 'division' columns.")
}

