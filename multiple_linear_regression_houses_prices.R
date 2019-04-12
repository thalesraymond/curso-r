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

regressor = lm(formula = price ~ ., data = training_base)

regression_predict = predict(regressor, newdata = test_base[-1])

mean(abs(test_base$price - regression_predict))

library(miscTools)

cc = rSquared(test_base$price, resid = test_base$price - regression_predict)