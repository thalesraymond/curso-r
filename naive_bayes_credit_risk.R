base = read.csv('risco-credito.csv')

library(e1071)

classificador = naiveBayes(x = base[-5], y = base$risco)

print(classificador)

historia = c('boa', 'ruim')
divida = c('alta', 'alta')
garantias = c('nenhuma', 'adequada')
renda = c('acima_35', '0_15')

df = data.frame(historia,divida,garantias,renda)

myPredict = predict(classificador,newdata = df, 'raw')

print(myPredict)
