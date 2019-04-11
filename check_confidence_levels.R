source('load_saved_classificator.R')

probrf = predict(classificator_rf, newdata = base[1,-4], type='prob')
confidendce_level_rf = max(probrf)
probann = predict(classificator_ann, newdata = as.h2o(base[4,-4]), type='prob')

probann = predict(classificator_ann, newdata = as.h2o(base[4,-4]))
confidence_level_ann = max(probann[2:3])