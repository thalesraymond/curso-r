base = read.csv('credit-card-clients.csv')

base$BILL_TOTAL = base$BILL_AMT1 + base$BILL_AMT2 + base$BILL_AMT3 + base$BILL_AMT4 + base$BILL_AMT5 + base$BILL_AMT6

X = data.frame(limit = base$LIMIT_BAL, spending = base$BILL_TOTAL)

X = scale(X)

set.seed(1)

wcss = vector()

for(i in 1:10){
  kmeans = kmeans(x = X, centers = i)
  wcss[i] = sum(kmeans$withinss)
}

plot(1:10, wcss, type = 'b', xlab = 'Clusters', ylab = 'WCSS')

set.seed(1)

kmeans = kmeans(x = X, centers = 5)

predict = kmeans$cluster

plot(X, col = predict)

# clusplot(X, predict, lines = 0, shade = TRUE, color = TRUE, labels = 2)