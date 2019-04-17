base = read.csv('house_prices.csv')

base$id = NULL
base$date = NULL
base$sqft_living15 = NULL
base$sqft_lot15 = NULL
base$sqft_basement = NULL

library(caTools)
set.seed(1)

division = sample.split(base$price, SplitRatio = 0.70)

training_base = subset(base, division == TRUE)
test_base = subset(base, division == FALSE)

library(h2o)

h2o.init()

regressor = h2o.deeplearning(y = 'price', 
                             training_frame = as.h2o(training_base), 
                             activation = 'Rectifier',
                             hidden = c(100,100),
                             epochs = 1000)

ann_predict_training = as.vector(h2o.predict(regressor, newdata = as.h2o(training_base[-1])))

library(miscTools)

cc_training  = rSquared(training_base$price, resid = training_base$price - ann_predict_training)

ann_predict_test = as.vector(h2o.predict(regressor, newdata=as.h2o(test_base[-1])))

mean(abs(test_base$price - ann_predict_test))

cc_test  = rSquared(test_base$price, resid = test_base$price - ann_predict_test)

