#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("downloads/starter_folder-main 4/data/02-analysis_data/analysis_data.csv")


### Model data ####
# Fit logistic regression model
model <- glm(
  formula = outcome ~ man_city_spi + is_home,
  family = binomial(),
  data = analysis_data,
  na.action = na.omit
)

# Check if the model was successfully created
summary(model) 


#### Save model ####
saveRDS(
  model,
  file = "downloads/starter_folder-main 4/models/model.rds"
)

