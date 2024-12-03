#### Preamble ####
# Purpose: Downloads and saves the data from github resources
# Author:Xiyan Chen
# Date: 3 December 2024
# Contact: xiyan.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites:  
# - The `tidyverse` package must be installed and loaded
# Any other information needed? None



#### Workspace setup ####
library(tidyverse)

#### Download data ####
github_raw_url <- "https://projects.fivethirtyeight.com/soccer-api/club/spi_matches.csv"
# Download and read the data
matches <- read_csv(github_raw_url)

#### Save data ####
# Save the downloaded data to a local file
write_csv(matches, "downloads/starter_folder-main 4/data/01-raw_data/matches.csv")




