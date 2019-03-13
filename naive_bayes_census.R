# Execute pre processing

source('pre_processing_census.R')

library(e1071)

classificator = naiveBayes(x = training_base[-15], y = training_base$income)

census_predict = predict(classificator, newdata = test_base[-15])

confusion_matrix = table(test_base[, 15], census_predict)

library(carret)

confusionMatrix(confusion_matrix)
