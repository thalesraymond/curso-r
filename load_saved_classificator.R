source('pre_processing_credit_data.R')

classificator_rf = readRDS('rf_final.rds')
classificator_ann = readRDS('ann_final.rds')

predict_rf = predict(classificator_rf, newdata=base[, -4])

predict_ann = predict(classificator_ann, newdata = as.h2o(base[, -4]))
