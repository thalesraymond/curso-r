base = read.csv('health_insurance.csv')

library(rpart)

regressor = rpart(formula = custo ~ idade, data = base, control = rpart.control(minsplit = 3))

summary(regressor)

tree_predict = predict(regressor, newdata = base[-2])

library(ggplot2)

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') + 
  geom_line(aes(x = base$idade, y = tree_predict), colour = 'red')


