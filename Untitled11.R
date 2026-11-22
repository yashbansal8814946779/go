install.packages("openxlsx")
library(openxlsx)
FactorC2 <- read.xlsx("go.xlsx")
summary(FactorC2) #Gives summary of data
# check correlation among variables
correl = cor(FactorC2[,-1]) #Gives correlation matrix
correl
?cor  #Checks function code

correl #displays output saved under the chosen name; in this case "correl"
install.packages("psych")                                                          #R packages are extensions to the R statistical programming language. R packages contain functions, code, data, and documentation in a standardised collection format that can be installed by users of R, typically via a centralised software repository such as CRAN(Comprehensive R Archive Network: cran.r-project.org)
library(psych)

cortest.bartlett(correl, n = nrow(FactorC2))

KMO(correl)
correl = cor(FactorC2[, -c(1,4)])
correl
KMO(correl)
?pca
pca1 = pca(correl, nfactors = 6,method = "regression", rotate = "none") #Gives factors/components/ segments          
pca1

pca3 = pca(correl, nfactors = 3, method = "regression", rotate = "none") #Gives relevant factors/components/ segments
pca3

pca31 = pca(correl, nfactors = 3, method = "regression", rotate = "varimax") #Gives IMPROVED relevant factors/components/ segments
pca31

print(pca31$loadings, ldigits = 2, cutoff = .5)
