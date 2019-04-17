base = read.csv('health_insurance.csv')

library(ggplot2)
library(randomForest)

regressor = randomForest(x = base[1], y = base$custo, ntree = 500)

summary(regressor)

rf_predict = predict(regressor, newdata = base[-2])

library(miscTools)

cc = rSquared(base$custo, resid = base$custo - rf_predict)

x_test = seq(min(base$idade), max(base$idade), 0.001)

predict_test = predict(regressor, newdata = data.frame(idade = x_test))

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') + 
  geom_line(aes(x = x_test,y = predict_test), colour = 'red')
