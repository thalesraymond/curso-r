# Run pre processing
source('pre_processing_census.R')

# Import library
library(randomForest)

library(caret)

#Training
classificator = randomForest(x = training_base[-15], y = training_base$income, ntree = 30)

random_forest_predict = predict(classificator, newdata = test_base[-15])


confusion_matrix = table(test_base[, 15], random_forest_predict)

confusionMatrix(confusion_matrix)
