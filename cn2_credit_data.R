# Run pre processing
source('pre_processing_credit_data_for_cn2.R')

# Load libraries
library(RoughSets)
library(caret)

# Create the traning decision table
decision_table_training = SF.asDecisionTable(dataset = training_base, decision.attr = 4)

# Create the test decision table
decision_table_test = SF.asDecisionTable(dataset = test_base, decision.attr = 4)

# Generate interval labels for numeric columns
intervals = D.discretization.RST(decision_table_training, nOfIntervals = 4)

decision_table_training = SF.applyDecTable(decision_table_training, intervals)
decision_table_test = SF.applyDecTable(decision_table_test, intervals)

# Run the CN2 classificator
classificator = RI.CN2Rules.RST(decision_table_training, K = 5)

credit_predict = predict(classificator, newdata = decision_table_test[-4])

#Create the confusion matrix
confusion_matrix = table(decision_table_test[, 4], credit_predict[, 1])

#Analyze confusion matrix
confusionMatrix(confusion_matrix)
