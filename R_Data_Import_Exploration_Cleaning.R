# ==============================================================================
# R Data Analysis: Importing, Exploring, and Cleaning Data
# Project: R_Data_Import_Exploration_Cleaning
# Dataset: peacebuilding.csv
# ==============================================================================

# ------------------------------------------------------------------------------
# A: Importing & First Look
# ------------------------------------------------------------------------------

# A1: Load tidyverse library

library(tidyverse)

# Check working directory before importing data

getwd()

# Read dataset into peace_data

peace_data <- read_csv("peacebuilding.csv") 

# A2: View first and last rows using head() and tail()

head(peace_data)
tail(peace_data)

# Note: Column "region" contains character values showing location (e.g., "Northern").

# A3: Check dimensions using nrow(), ncol(), and dim()

nrow(peace_data)   # Number of rows (232)
ncol(peace_data)   # Number of columns (13)
dim(peace_data)    # Full dimensions (232 rows, 13 columns)

# A4: List column names and inspect full dataset

colnames(peace_data)
View(peace_data)


# ------------------------------------------------------------------------------
# B: Structure and Summary
# ------------------------------------------------------------------------------

# B1: Inspect structure using str() and glimpse()

str(peace_data)
glimpse(peace_data)

# glimpse() provides a clear vertical layout of column names, data types and sample values
# making it easier to read for datasets with many columns.

# B2: Generate summary statistics

summary(peace_data)

# The duration_minutes column.
# Min.   : 60.0 
# Max.   : 180.0 

# B3: Column Data Types (based on glimpse output)
# - session_id: character
# - date: character
# - region: character
# - district: character
# - facilitator: character
# - dialogue_theme: character
# - conflict_type: character
# - num_participants: numeric
# - num_female_participants: numeric
# - duration_minutes: numeric
# - resolution_status: character
# - satisfaction_score: numeric
# - follow_up_scheduled: character


# ------------------------------------------------------------------------------
# C: Data Quality Checks
# ------------------------------------------------------------------------------

# C1: Check for duplicate rows

duplicated(peace_data)
sum(duplicated(peace_data))

# Total duplicate rows identified: 12

# C2: Total number of missing values across the whole dataset

sum(is.na(peace_data))

# Total missing values across all cells: 80

# C3: Missing values per column

colSums(is.na(peace_data))

# The column with the most missing values is "follow_up_scheduled", which contains 54 missing values.

# C4: Explanation of sum(is.na()) vs colSums(is.na())

# sum(is.na(peace_data)) calculates the total count of missing values across all row and columns returning a single overall sum.
# colSums(is.na(peace_data)) calculates missing values independently for each 
# column, making it easy to identify specific variables that need data cleaning.


# ------------------------------------------------------------------------------
# D: Cleaning the Data
# ------------------------------------------------------------------------------

# D1: Remove duplicate rows using distinct() and store in clean_data

clean_data <- distinct(peace_data)

# D2: Compare row counts between original and cleaned dataset

nrow(peace_data)  # 232 rows
nrow(clean_data) # 220 rows

# Exactly 12 duplicate rows were successfully removed.

# D3: Explanation of why peace_data remains unchanged

# Calling distinct(peace_data) returns a cleaned view of the data in the console. 
# To permanently modify peace_data, you must reassign the output back to the variable:
# peace_data <- distinct(peace_data)


# ------------------------------------------------------------------------------
# E: Exploring Individual Columns
# ------------------------------------------------------------------------------

# E1: Access and print specific columns

peace_data$region
peace_data$dialogue_theme
peace_data$facilitator

# E2: List unique facilitators

unique(peace_data$facilitator)

# Unique non-NA facilitators (7 total): "R. Alhassan", "S. Mohammed", "F. Wekia", "M. Awuni",  "A. Azantilow", "J. Tindana", "K. Abugri"

# E3: Count missing values in the facilitator column

sum(is.na(peace_data$facilitator))

# 7 missing values in "facilitator"

# E4: List unique regions

unique(peace_data$region)
# 6 distinct regions: "Northern", "Upper West", "North East", "Upper East", "Savannah", "Bono East"
