base = read.csv('health_insurance.csv')

# First, linear regression just for comparison :)
regressor_linear = lm(formula = custo ~ idade, data = base)

regressor_linear_summary = summary(regressor_linear)

predict_linear = predict(regressor_linear, newdata = base[-2])

library(ggplot2)

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') +
  geom_line(aes(x = base$idade, y = predict_linear), colour = 'red') + 
  ggtitle('Idade x Custo') + xlab('Idade') + ylab('Custo')

# Now the polynomial one :D

base_polynomial = base

base_polynomial$idade2 = base_polynomial$idade^2

base_polynomial$idade3 = base_polynomial$idade^3

regressor_polynomial = lm(formula = custo ~., data = base_polynomial)

regressor_polynomial_summary = summary(regressor_polynomial)

predict_polynomial = predict(regressor_polynomial, newdata = base_polynomial[-2])

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') +
  geom_line(aes(x = base$idade, y = predict_polynomial), colour = 'red') + 
  ggtitle('Idade x Custo') + xlab('Idade') + ylab('Custo')
