base = read.csv('house_prices.csv')

library(caTools)
set.seed(1)

division = sample.split(base$price, SplitRatio = 0.70)

training_base = subset(base, division == TRUE)
test_base = subset(base, division == FALSE)


regressor = lm(formula = price ~ sqft_living, data = training_base)

regressor_summary = summary(regressor)

regression_predict = predict(regressor, newdata = training_base[6])

library(ggplot2)

ggplot() + geom_point(aes(x = training_base$sqft_living, y = training_base$price), colour = 'blue') +
  geom_line(aes(x = training_base$sqft_living, y = regression_predict), colour = 'red') 


regression_predict = predict(regressor, newdata = test_base[6])

result = abs(test_base[3] - regression_predict)

mean(result$price)

library(miscTools)

cr = rSquared(test_base$price, resid = test_base$price - regression_predict)
