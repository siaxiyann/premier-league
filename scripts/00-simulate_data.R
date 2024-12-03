#### Preamble ####
# Purpose: Simulates a dataset of Premier League, including the spi and winning probability for each team.
# Author: Xiyan Chen 
# Date: 3 December 2024
# Contact: xiyan.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and `dplyr`and `readr` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)

set.seed(853)


#### Simulate data ####
# team names
teams <- c("Arsenal", "Aston Villa", "Bournemouth", "Brentford", "Brighton", 
             "Burnley", "Chelsea", "Crystal Palace", "Everton", "Fulham", 
             "Liverpool", "Luton Town", "Manchester City", "Manchester United", 
             "Newcastle", "Nottingham Forest", "Sheffield United", 
             "Tottenham", "West Ham", "Wolves")


# Generate all pairwise matchups (home and away)
schedule <- expand.grid(team1 = teams, team2 = teams) %>%
  filter(team1 != team2) %>%
  mutate(round = rep(1:(length(teams) - 1), each = nrow(.) / (length(teams) - 1)))

#Simulate SPI ratings for each team
set.seed(123) # For reproducibility
spi_values <- data.frame(
  team = teams,
  spi = runif(length(teams), min = 50, max = 85)
)

# Merge SPI values with schedule
schedule <- schedule %>%
  left_join(spi_values, by = c("team1" = "team")) %>%
  rename(spi1 = spi) %>%
  left_join(spi_values, by = c("team2" = "team")) %>%
  rename(spi2 = spi)

# Step 3: Calculate probabilities
# Logistic function for probabilities
schedule <- schedule %>%
  mutate(
    prob1 = 1 / (1 + exp(-(spi1 - spi2) / 10)), # Adjust '10' to control sensitivity
    prob2 = 1 - prob1
  )

# Step 4: Add season column
schedule <- schedule %>%
  mutate(season = 2024) %>%
  select(season, round, team1, team2, spi1, spi2, prob1, prob2)

# View the first few rows
head(schedule)


#### Save data ####
write_csv(schedule, "downloads/starter_folder-main 4/data/00-simulated_data/simulated_data.csv")

