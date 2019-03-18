# Load Database
base = read.csv('risco-credito.csv')
 
# Reference OneR Library
library(OneR)

classificator = OneR(x = base)

print(classificator)

historia = c('boa', 'ruim')
divida = c('alta', 'alta')
garantias = c('nenhuma', 'adequada')
renda = c('acima_35', '0_15')

df = data.frame(historia,divida,garantias,renda)

risk_predict = predict(classificator, newdata = df)