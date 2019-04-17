base = read.csv('health_insurance.csv')

library(h2o)

h2o.init(nthreads = -1)

regressor = h2o.deeplearning(y = 'custo', 
                             training_frame = as.h2o(base), 
                             activation = 'Rectifier', 
                             hidden = c(100,100),
                             epochs = 10000)


ann_predict = h2o.predict(regressor, newdata = as.h2o(base[-2]))

library(miscTools)

cc = rSquared(base$custo, resid = base$custo - as.vector(ann_predict))

library(ggplot2)

ggplot() + geom_point(aes(x = base$idade, y = base$custo), colour = 'blue') + 
  geom_line(aes(x = base$idade, y = as.vector(ann_predict)), colour = 'red')
