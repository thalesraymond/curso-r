base = read.csv('credit-card-clients.csv')

base$BILL_TOTAL = base$BILL_AMT1 + base$BILL_AMT2 + base$BILL_AMT3 + base$BILL_AMT4 + base$BILL_AMT5 + base$BILL_AMT6