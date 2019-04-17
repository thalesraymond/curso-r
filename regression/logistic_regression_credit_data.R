# Execute pre processing

source('pre_processing_credit_data.R')

classificator = glm(formula = default ~., family = binomial, data = training_base)

credit_predict = predict(classificator, type = 'response', newdata = test_base[-4])

predict_label = ifelse(credit_predict > 0.5, 1, 0)

print(predict_label)

library(caret)

# Create confusion matrix to check for errors

confusion_matrix = table(test_base[, 4], predict_label)

# Analyze precision

confusionMatrix(confusion_matrix)
