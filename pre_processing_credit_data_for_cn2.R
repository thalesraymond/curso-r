base = read.csv('credit-data.csv')

base$clientid = NULL

summary(base)

invalid_age = base[base$age < 0 & !is.na(base$age), ]

# fix rows with negative ages

filtered_base_by_row = base[base$age >0, ]

age_mean = mean(filtered_base_by_row$age, na.rm = TRUE)

base$age = ifelse(base$age < 0, age_mean, base$age)

# fix rows with NA ages

base$age = ifelse(is.na(base$age), age_mean, base$age)

#Encode class value
base$default = factor(base$default, levels = c(0,1))

library(caTools)

# Set random seed

set.seed(1)

# Define training sample

division = sample.split(base$default, SplitRatio = 0.75)

# Save training sample

training_base = subset(base, division == TRUE)

# Save test base

test_base = subset(base, division == FALSE)

# Encode training and test bases classes

training_base$default = factor(training_base$default, levels = c(0,1))

test_base$default = factor(test_base$default, levels = c(0,1))



