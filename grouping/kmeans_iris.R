base = iris

base_simple = base[1:2]

set.seed(1)

kmeans = kmeans(x = base_simple, centers = 3)

centroids = kmeans$centers

predict = kmeans$cluster

library(cluster)

clusplot(base, predict, lines = 0, shade = TRUE, color = TRUE, labels = 2)

table(base$Species, predict)
 