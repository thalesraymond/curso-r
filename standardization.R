age = c(60,35,20)
income = c(30000,45000,29500)
base = data.frame(age, income)

# Arithmetic Mean
mean(base$age)
mean(base$income)

#sd = standart deviation
sd(base$age)
sd(base$income)

base = scale(base)
