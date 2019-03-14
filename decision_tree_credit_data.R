# Run pre processing
source('pre_processing_credit_data.R')

# Load libs
library(rpart)

library(rpart.plot)

library(caret)

# Create decision tree
classificator = rpart(formula = default ~ ., data = training_base)

# Plot tree
rpart.plot(classificator)

# Run the tree in the test database
risk_predict = predict(classificator,newdata = test_base[-4], type='class')

confusion_matrix = table(test_base[, 4], risk_predict)

confusionMatrix(confusion_matrix)