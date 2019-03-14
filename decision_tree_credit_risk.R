base = read.csv('risco-credito.csv')

library(rpart)
library(rpart.plot)

classificator = rpart(formula = risco ~ ., data = base, control = rpart.control(minbucket = 1))

plot(classificator)
text(classificator)

rpart.plot(classificator)

historia = c('boa', 'ruim')
divida = c('alta', 'alta')
garantias = c('nenhuma', 'adequada')
renda = c('acima_35', '0_15')

df = data.frame(historia,divida,garantias,renda)

risk_predict = predict(classificator, newdata = df)

print(risk_predict)