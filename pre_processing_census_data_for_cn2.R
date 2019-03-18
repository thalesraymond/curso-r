base = read.csv('census.csv')

base$X = NULL

#Get all unique values from column
unique(base$sex)

#Get quantity of each value
table(base$sex)

library(caTools)

# Set random seed

set.seed(1)

# Define training sample

division = sample.split(base$income, SplitRatio = 0.05)

# Save training sample

training_base = subset(base, division == TRUE)

# Save test base

test_base = subset(base, division == FALSE)


