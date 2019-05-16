age = c(20,  27,  21,  37,  46, 53, 55,  47,  52,  32,  39,  41,  39,  48,  48)
income = c(1000,1200,2900,1850,900,950,2000,2100,3000,5900,4100,5100,7000,5000,6500)
base = data.frame(age, income)

base = scale(base)

plot(age, income)

library(dbscan)

dbscan = dbscan(base, eps = 0.95, minPts = 3)
predict = dbscan$cluster

library(cluster)
clusplot(base, predict)

