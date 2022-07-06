
# General parameters used for all scenarios:
flNsamEM = 75
saNsamEM = 75
iniModelyear = 26
nyears = 75
iniFyear = 26 # F positive for iniFyear + 1. fishery and len comps start here. Normal value = 25
maxFyear = 60 
Fmsy = 0.32
maxF = 1.1*Fmsy # 
lowF = 0.9*Fmsy #
iniSurYear = iniFyear # ini year for survey index and age comps
CVSur = 0.2
cPar = 2 # for len comps fishery
base_natM = 0.36
CVgrowth_K = 0.03

# 1) Create F pattern
upFway = normalize(x = iniFyear:maxFyear, method = 'range', range = c(0.01,maxF))
downFway = rep(x = maxF, times = length(maxFyear:nyears))

# Temporal variability

# Annual PDO index:
PDO_annual = read.csv('aux_files/PDO_annual_1970_2019.csv') # REAL PDO: only this will apply in EM

# Create index for year-specific temporal variability:
growthindex1 = PDO_annual
growthindex1$index = normalize(x = growthindex1$index, method = 'range', range = c(-CVgrowth_K, CVgrowth_K)) # apply to OM
growthindex1 = growthindex1[growthindex1$years >= iniFyear, ]
write.csv(growthindex1, 'aux_files/K_year_devs.csv', row.names = FALSE)
