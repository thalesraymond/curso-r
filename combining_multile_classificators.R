source('pre_processing_credit_data.R')

classificator_rf = readRDS('rf_final.rds')
classificator_ann = readRDS('ann_final.rds')

# Random Forest
predict_rf = predict(classificator_rf, newdata=base[1, -4])

predict_rf = as.numeric(trimws(predict_rf))

#Artifical Neural Networks
predict_ann = predict(classificator_ann, newdata = as.h2o(base[1, -4]))

predict_ann = as.numeric(as.vector(predict_ann[1]$predict))

class_0 = 0
class_1 = 0

if(predict_rf == 1) {
  class_1 = class_1 + 1
} else {
  class_0 = class_0 + 1
}

if(predict_ann == 1) {
  class_1 = class_1 + 1
} else {
  class_0 = class_0 + 1
}
