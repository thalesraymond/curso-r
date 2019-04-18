age = c(20,  27,  21,  37,  46, 53, 55,  47,  52,  32,  39,  41,  39,  48,  48)
salary = c(1000,1200,2900,1850,900,950,2000,2100,3000,5900,4100,5100,7000,5000,6500)
base = scale(data.frame(age, salary))

plot(age, salary)

set.seed(1)

kmeans = kmeans(x = base, centers = 3)

centroids = kmeans$centers

predict = kmeans$cluster

library(cluster)

clusplot(base, predict, xlab = 'Salary', ylab = 'Age', main = 'Salary x Age', 
         lines = 0, shade = TRUE, color = TRUE, labels = 2)
