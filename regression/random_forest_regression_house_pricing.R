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

library(ggplot2)
library(randomForest)

regressor = randomForest(x = training_base[-1], y = training_base$price, ntree = 100)

summary(regressor)

training_predict = predict(regressor, newdata = training_base[-1])

library(miscTools)

cc_training = rSquared(training_base$price, resid = training_base$price - training_predict)

test_predict = predict(regressor, newdata = test_base[-1])

mean(abs(test_base$price - test_predict))

cc_test = rSquared(test_base$price, resid = test_base$price - test_predict)
