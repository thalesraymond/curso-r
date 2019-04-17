base = read.csv('house_prices.csv')

base$id = NULL
base$date = NULL
base$sqft_living15 = NULL
base$sqft_lot15 = NULL
base$sqft_basement = NULL

library(caTools)
set.seed(1)

division = sample.split(base$price, SplitRatio = 0.70)

training_base = subset(base, division == TRUE)
test_base = subset(base, division == FALSE)

library(e1071)

regressor = svm(formula = price ~., data = training_base, type = 'eps-regression', kernel = 'radial')

summary(regressor)

svm_predict_training = predict(regressor, newdata = training_base[-1])
svm_predict_test = predict(regressor, newdata = test_base[-1])

library(miscTools)

cc_traning = rSquared(training_base$price, resid = training_base$price - svm_predict_training)
cc_test = rSquared(test_base$price, resid = test_base$price - svm_predict_test)

print("Training:")
mean(abs(training_base$price - svm_predict_training))

print("Test:")
mean(abs(test_base$price - svm_predict_test))