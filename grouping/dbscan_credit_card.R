base = read.csv('credit-card-clients.csv', header = TRUE)
base$BILL_TOTAL = base$BILL_AMT1 + base$BILL_AMT2 + base$BILL_AMT3 + base$BILL_AMT4 + base$BILL_AMT5 + base$BILL_AMT6

X = data.frame(limit = base$LIMIT_BAL, expenses  = base$BILL_TOTAL)
X = scale(X)

library(dbscan)
dbscan = dbscan(X, eps = 0.37, minPts = 4)
predict = dbscan$cluster

table(predict)

plot(X, col = predict)