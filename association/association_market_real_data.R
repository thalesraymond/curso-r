library(arules)

# One week sales of supermarket in France (I guess)
base = read.transactions('market_real.csv', sep = ',', rm.duplicates = TRUE)

summary(base)

itemFrequencyPlot(base, topN = 10)

#No rules will be create due to high support/confidence levels
rules = apriori(data = base, parameter = list(support = 0.3, confidence = 0.8))

# Must calculate a realistic desired pattern to find, for exemple: 
# we want to find the pattern for products that are sold at least 4 times a day (28 times in total)
# (also the confidence level is to high)
daily_sales = 4
database_sample_period_in_days = 7
new_support_value = (daily_sales * database_sample_period_in_days) / 7501

rules = apriori(data = base, parameter = list(support = new_support_value, confidence = 0.2))

inspect(sort(rules,  by = 'lift')[1:20])
