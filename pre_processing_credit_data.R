base = read.csv('credit-data.csv')

base$clientid = NULL

summary(base)

invalid_age = base[base$age < 0 & !is.na(base$age), ]

#exclude rows with negative ages

filtered_base_by_row = base[base$age >0, ]

age_mean = mean(filtered_base_by_row$age, na.rm = TRUE)

base$age = ifelse(base$age < 0, age_mean, base$age)
