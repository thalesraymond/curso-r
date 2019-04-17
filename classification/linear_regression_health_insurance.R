base = read.csv('health_insurance.csv')

cor(base$idade, base$custo)

regressor = lm(formula = custo ~ idade, data = base)

regressor_summary = summary(regressor)

b0 = regressor$coefficients[1]
b1 = regressor$coefficients[2]
cr = regressor_summary$adj.r.squared

regression_predict = predict(regressor, newdata = base)

library(ggplot2)

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') +
  geom_line(aes(x = base$idade, y = regression_predict), colour = 'red') + 
  ggtitle('Idade x Custo') + xlab('Idade') + ylab('Custo')


idade = c(40)
df = data.frame(age)

test_predict_1 = predict(regressor, newdata = df)

test_predict_2 = b0 + b1 * 40
