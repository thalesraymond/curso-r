# Execute pre processing

source('pre_processing_census.R')

classificator = glm(formula = income ~., family = binomial, data = training_base)

census_predict = predict(classificator, type = 'response', newdata = test_base[-15])

predict_label = ifelse(census_predict > 0.5, 1, 0)

print(predict_label)

library(caret)

# Create confusion matrix to check for errors

confusion_matrix = table(test_base[, 15], predict_label)

# Analyze precision

confusionMatrix(confusion_matrix)
