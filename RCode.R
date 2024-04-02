library(psych)
library(readxl)
library(REdaS)
library(paran)
library(EFA.dimensions)
library(ltm)
options(max.print = 99999)

#Attach the dataset
efadataset <- read_excel("C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/surveyData.xlsx")
View(efadataset)        
attach(efadataset)

#Perform KMO Test
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/KMOtest.txt")
KMO(efadataset)
sink(file = NULL)

#Perform Bartlett's test
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/Bartlettstest.txt")
bart_spher(efadataset)
sink(file = NULL)

# Parallel Analysis
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/ParallelAnalysis.txt")
paran(efadataset, cfa=TRUE, graph=TRUE, 
      color=TRUE, col=c("black","red","blue"))
sink(file = NULL)

# Scree Plot
nofactors = fa.parallel(efadataset, fm="pa", fa="fa")
nofactors

# Kaiser Criterion
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/Kaiser.txt")
nofactors = fa.parallel(efadataset, fm="pa", fa="fa")
nofactors
sink(file = NULL)

#=IF(ABS(B2)<0.3,"",B2)

# 11 Factors
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/Results/11Factors.txt")
fa(efadataset, nfactors = 11, rotate =  "oblimin")
sink(file = NULL)

# 6 Factors
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/Results/6Factors.txt")
fa(efadataset, nfactors = 6, rotate =  "oblimin")
sink(file = NULL)

# 5 Factors
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/Results/5Factors.txt")
fa(efadataset, nfactors = 5, rotate =  "oblimin")
sink(file = NULL)

#Remove Publications (<h2)
sink(file = "C:/Users/heraa/Documents/University/Doctoral Directed Studies/Guest Lecture/Factor Analysis/Results/5Factors-1.txt")
fa(efadataset[, -c(4)], nfactors = 5, rotate =  "oblimin")
sink(file = NULL)

