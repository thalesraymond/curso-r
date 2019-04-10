# Execute pre processing

source('pre_processing_credit_data.R')

library(h2o)
library(caret)

h2o.init(nthreads = -1)

classificator = h2o.deeplearning(y = 'default',
                                 training_frame = as.h2o(training_base),
                                 activation = 'Rectifier',
                                 hidden = c(100),
                                 epochs = 1000)

neural_predict = h2o.predict(classificator, newdata = as.h2o(test_base[-4]))

# neural_predict_converted = as.vector((neural_predict[1] > 0.5))

neural_predict_converted = as.vector(as.numeric(neural_predict[1]))


confusion_matrix = table(test_base[, 4], neural_predict_converted)

confusionMatrix(confusion_matrix)