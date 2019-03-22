source('pre_processing_census.R')

library(e1071)

classificator = svm(formula = income ~., data = training_base, type='C-classification', kernel = 'radial', cost = 1)

svm_predict = predict(classificator, newdata = test_base[-15])

confusion_matrix = table(test_base[,15], svm_predict)

library(caret)

confusionMatrix(confusion_matrix)