library(arules)

base = base = read.transactions('market_real.csv', sep = ',', rm.duplicates = TRUE)

item_sets = eclat(data = base, parameter = list(support = 0.003, minlen = 3))

inspect(sort(item_sets, by = 'support'))