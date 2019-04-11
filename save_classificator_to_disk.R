source('pre_processing_credit_data.R')

library(randomForest)

classificator_rf = randomForest(x = base[-4], y = base$default, ntr = 30, mtry = 2)

library(h2o)

h2o.init()

classificator_ann = h2o.deeplearning(
  y = 'default', 
  training_frame = as.h2o(base), 
  activation = 'Rectifier', 
  hidden = c(100))

saveRDS(classificator_rf, 'rf_final.rds')
saveRDS(classificator_ann, 'ann_final.rds')