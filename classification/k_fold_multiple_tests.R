base = read.csv('credit-data.csv')

base$clientid = NULL

summary(base)

invalid_age = base[base$age < 0 & !is.na(base$age), ]

filtered_base_by_row = base[base$age >0, ]

age_mean = mean(filtered_base_by_row$age, na.rm = TRUE)

base$age = ifelse(base$age < 0, age_mean, base$age)

base$age = ifelse(is.na(base$age), age_mean, base$age)

base[ ,1:3] = scale(base[ ,1:3]) 

base$default = factor(base$default, levels = c(0,1))

library(caret)

results30 = c()
for(i in 1:30){
  training_control = trainControl(method = 'cv', number = 10)

  model = train(default ~., data = base, trControl = training_control, method = 'avNNet')
  
  precision = model_neural_network$results$Accuracy[9]
  
  print(precision)
  
  results30 = c(results30, precision)
}

for(i in 1:30){
  cat(gsub('[.]',',',results30[i]))
  cat('\n')
}




