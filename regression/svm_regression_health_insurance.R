base = read.csv('health_insurance.csv')

library(e1071)

regressor = svm(formula = custo ~ idade, data = base, type = 'eps-regression', kernel = 'radial')

summary(regressor)

svm_predict = predict(regressor, newdata = base[-2])

library(miscTools)

cc = rSquared(base$custo, resid = base$custo - svm_predict)



library(ggplot2)

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') + 
  geom_line(aes(x = base$idade, y = svm_predict), colour = 'red')