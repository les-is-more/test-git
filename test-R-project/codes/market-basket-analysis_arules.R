require(arules)


#arules
data(Groceries)

# eclat takes in a transactions object and gives the most frequest items based on the support
# eclat gives us the support value of each item
freqItem = eclat (Groceries, parameter = list(supp = 0.07, maxlen = 10))
inspect(freqItem)

# plots the frequencies of individual items in the dataset
itemFrequencyPlot(Groceries,topN=10,type="absolute",main="Item Frequency")

# apriori gives us the confidence and lift measure for each rules
rules = apriori (Groceries, parameter = list(supp = 0.001, conf = 0.5, maxlen=4))

rules_supp = arules::sort(rules,by="support",decreasing = TRUE)


# if you want to get the related items for a selected product, use the below codes
rules_tid = apriori (data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), appearance = list(default="rhs",lhs="tidbits"), control = list(verbose=F)) 

