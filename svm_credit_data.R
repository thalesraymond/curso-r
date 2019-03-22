source('pre_processing_credit_data.R')

library(e1071)

classificator = svm(formula = default ~., data = training_base, type='C-classification', kernel = 'radial', cost = 6)

svm_predict = predict(classificator, newdata = test_base[-4])

confusion_matrix = table(test_base[,4], svm_predict)

library(caret)

confusionMatrix(confusion_matrix)