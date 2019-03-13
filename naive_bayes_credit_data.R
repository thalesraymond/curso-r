# Execute pre processing

source('pre_processing_credit_data.R')

# Import libs

library(e1071)

library(caret)

# Create classificator

classificator = naiveBayes(x = training_base[-4], y = training_base$default)

# Run Predict

training_predict = predict(classificator, newdata=test_base[-4])

# Create confusion matrix to check for errors

confusion_matrix = table(test_base[, 4], training_predict)

# Analyze precision

confusionMatrix(confusion_matrix)
