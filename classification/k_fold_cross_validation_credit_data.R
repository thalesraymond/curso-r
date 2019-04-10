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

training_control = trainControl(method = 'cv', number = 10)

model_nb = train(default ~., data = base, trControl = training_control, method = 'nb')

model_tree = train(default ~., data = base, trControl = training_control, method = 'rpart')

model_random_forest = train(default ~., data = base, trControl = training_control, method = 'rf')

model_rules = train(default ~., data = base, trControl = training_control, method = 'C5.0Rules')

model_knn = train(default ~., data = base, trControl = training_control, method = 'knn')

model_logistic_regression = train(default ~., data = base, trControl = training_control, method = 'glm', family = 'binomial')

model_svm = train(default ~., data = base, trControl = training_control, method = 'svmRadial')

model_neural_network = train(default ~., data = base, trControl = training_control, method = 'avNNet')

print(model_nb)

print(model_tree)

print(model_random_forest)

print(model_rules)

print(model_knn)

print(model_logistic_regression)

print(model_svm)

print(model_neural_network)



