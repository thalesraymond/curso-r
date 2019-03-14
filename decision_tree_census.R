# Run pre processing
source('pre_processing_census.R')

# Load libs
library(rpart)

library(rpart.plot)

library(caret)

# Create decision tree
classificator = rpart(formula = income ~ ., data = training_base)

# Pruning example (not necessary)
prune = classificator$cptable[which.min(classificator$cptable[,'xerror']), 'CP']

print(classificator$cptable)

prune(classificator,0.05)

# Plot tree
rpart.plot(classificator)

# Run the tree in the test database
census_predict = predict(classificator, newdata = test_base[-15], type = 'class')

#Create the confusion matrix
confusion_matrix = table(test_base[, 15], census_predict)

#Analyze confusion matrix
confusionMatrix(confusion_matrix)