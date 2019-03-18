# Run pre processing
source('pre_processing_credit_data.R')

# Load libs
library(randomForest)

library(caret)

classificator = randomForest(x = training_base[-4], y = training_base$default, ntree = 40)

random_forest_predict = predict(classificator, newdata = test_base[-4])

confusion_matrix = table(test_base[, 4], random_forest_predict)

confusionMatrix(confusion_matrix)
