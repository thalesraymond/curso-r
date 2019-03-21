source('pre_processing_credit_data.R')

library(class)

knn_predict = knn(train = training_base[, -4], test = test_base[, -4], cl = training_base[, 4], k = 5)

confusion_matrix = table(test_base[,4], knn_predict)

library(caret)

confusionMatrix(confusion_matrix)

