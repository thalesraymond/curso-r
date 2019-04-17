base = read.csv('risco-credito.csv')

base = base[base$risco != "moderado", ]

classificator = glm(formula = risk ~., family = binomial, data = base)


historia = c('boa', 'ruim')
divida = c('alta', 'alta')
garantias = c('nenhuma', 'adequada')
renda = c('acima_35', '0_15')

df = data.frame(historia,divida,garantias,renda)

risk_predict = predict(classificator, newdata = df, type = 'response')

response = ifelse(risk_predict > 0.5, 'baixo', 'alto')

print(risk_predict)
