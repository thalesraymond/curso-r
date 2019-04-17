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

library(rpart)

regressor = rpart(formula = price ~., data = training_base)

summary(regressor)

training_price_predict = predict(regressor, newdata = training_base[-1])

library(miscTools)

cc_training  = rSquared(training_base$price, resid = training_base$price - training_price_predict)

test_price_predict = predict(regressor, newdata=test_base[-1])

mean(abs(test_base$price - test_price_predict))

cc_test  = rSquared(test_base$price, resid = test_base$price - test_price_predict)
