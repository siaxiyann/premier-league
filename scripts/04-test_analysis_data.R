#### Preamble ####
# Purpose: Tests the structure and validity of the dataset
# Author: Xiyan Chen
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("/Users/chenxiyan/Downloads/starter_folder-main 4/data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Test that the dataset has 2660 rows - Premier League matches from 2016 to 2022
test_that("dataset has 2660 rows", {
  expect_equal(nrow(data), 2660)
})

# Test that the dataset has 9 columns
test_that("dataset has 9 columns", {
  expect_equal(ncol(data), 9)
})

# Test that the 'team1' and 'team2' columns are character type
test_that("'team1' and 'team2' are character type", {
  expect_true(is.character(data$team1))
  expect_true(is.character(data$team2))
})

# Test that the 'league' column is character type
test_that("'league' column is character type", {
  expect_true(is.character(data$league))
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(data)))
})

# Test that 'team1' and 'team2' contain only valid Premier League teams
valid_teams <- c("Arsenal", "Aston Villa", "AFC Bournemouth", "Brentford", 
                 "Brighton and Hove Albion", "Burnley", "Chelsea", 
                 "Crystal Palace", "Everton", "Fulham", 
                 "Liverpool", "Luton Town", "Manchester City", "Manchester United", 
                 "Newcastle", "Nottingham Forest", "Sheffield United", 
                 "Tottenham Hotspur", "West Ham United", "Wolves","Leeds United","Leicester City",
                 "Southampton","Huddersfield Town","Watford",
                 "West Bromwich Albion","Sunderland",
                 "Hull City", "Middlesbrough", "Stoke City","Swansea City","Wolverhampton","Cardiff City","Norwich City")



test_that("'team1' and 'team2' contain only valid Premier League teams", {
  expect_true(all(data$team1 %in% valid_teams))
  expect_true(all(data$team2 %in% valid_teams))
})


# Test that there are no empty strings in 'team1', 'team2', or 'league' columns
test_that("no empty strings in 'team1', 'team2', or 'league' columns", {
  expect_true(all(data$team1 != ""))
  expect_true(all(data$team2 != ""))
  expect_true(all(data$league != ""))
})


invalid_team1 <- setdiff(unique(data$team1), valid_teams)
invalid_team2 <- setdiff(unique(data$team2), valid_teams)

# Print the invalid teams
print("Invalid teams in team1:")
print(invalid_team1)

print("Invalid teams in team2:")
print(invalid_team2)



