# Run pre processing
source('pre_processing_census.R')

library(class)

knn_predict = knn(train = training_base[, -15], test = test_base[, -15], cl = training_base[, 15], k = 5)

confusion_matrix = table(test_base[,15], knn_predict)

library(caret)

confusionMatrix(confusion_matrix)