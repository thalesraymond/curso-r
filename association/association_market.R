library('arules')

base = read.transactions('market_1.csv', sep = ',', rm.duplicates = TRUE)

summary(base)

itemFrequencyPlot(base, topN = 7)

rules = apriori(data = base, parameter = list(support = 0.3, confidence = 0.8))

inspect(sort(rules,  by = 'lift'))
