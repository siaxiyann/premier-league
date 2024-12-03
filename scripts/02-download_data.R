#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]



#### Workspace setup ####
library(tidyverse)

#### Download data ####
github_raw_url <- "https://projects.fivethirtyeight.com/soccer-api/club/spi_matches.csv"
# Download and read the data
matches <- read_csv(github_raw_url)

#### Save data ####
# Save the downloaded data to a local file
write_csv(matches, "downloads/starter_folder-main 4/data/01-raw_data/matches.csv")




