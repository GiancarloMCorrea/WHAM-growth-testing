# Install the base version of WHAM for this script:
# remotes::install_github(repo = 'gmoroncorrea/wham', ref='growth', INSTALL_opts = c("--no-docs", "--no-multiarch", "--no-demo"))

rm(list = ls())
library(r4ss)
library(wham)
library(ggplot2)
library(TMB)
library(fields)

mainDir = 'C:/Users/moroncog/Documents/Postdoc_UW/test_size-info' # change this
setwd(mainDir)

# Read simulated data:
data_file = r4ss::SS_readdat_3.30(file = 'SS_sim/D0-E0-F0-R0-cod/10/em/ss3.dat') # from EM
SS_report = r4ss::SS_output(dir = 'SS_sim/D0-E0-F0-R0-cod/10/om', covar = FALSE) # from OM
SS_reportEM = r4ss::SS_output(dir = 'SS_sim/D0-E0-F0-R0-cod/10/em', covar = FALSE) # from EM

# Define some important information:
min_year = SS_report$startyr
max_year = SS_report$endyr
n_ages = length(SS_report$agebins)
fish_len = SS_report$lbins
n_years = length(min_year:max_year)

# NAA info:
NAA_SS = SS_report$natage[SS_report$natage$`Beg/Mid` == 'B' & SS_report$natage$Yr >= min_year & SS_report$natage$Yr <= max_year, 13:ncol(SS_report$natage)]

# WHAM MODEL --------------------------------------------------------------

wham_data = list()
wham_data$ages = 1:n_ages
wham_data$lengths = fish_len
wham_data$CV_len = c(0.1, 0.1) # age 1 and oldest
wham_data$years = min_year:max_year

wham_data$n_fleets = 1L
wham_data$agg_catch = as.matrix(data_file$catch[2:(n_years+1), 4])
catch_paa_num = data_file$agecomp[data_file$agecomp$FltSvy == 1, 10:(10+n_ages-1)]
catch_paa_prop = t(apply(as.matrix(catch_paa_num),1, function(x) x/sum(x)))
wham_data$catch_paa = array(data = catch_paa_prop, dim = c(1,max_year-min_year+1,n_ages))
wham_data$catch_cv = as.matrix(data_file$catch[2:(n_years+1), 5])
wham_data$catch_Neff = as.matrix(as.double(data_file$agecomp[data_file$agecomp$FltSvy == 1, 9]))
wham_data$use_catch_paa = matrix(1L, ncol = 1, nrow = (max_year - min_year + 1))

wham_data$selblock_pointer_fleets = matrix(1L, ncol = 1, nrow = (max_year - min_year + 1))
wham_data$F = matrix(apply(X = SS_report$fatage[SS_report$fatage$Yr >= min_year & 
                                                  SS_report$fatage$Yr <= max_year,
                                                8:ncol(SS_report$fatage)], MARGIN = 1, FUN = max),
                     ncol = 1)

wham_data$n_indices = 1L
wham_data$agg_indices = as.matrix(data_file$CPUE[,4])
index_paa_num = data_file$agecomp[data_file$agecomp$FltSvy == 2, 10:(10+n_ages-1)]
index_paa_prop = t(apply(as.matrix(index_paa_num),1, function(x) x/sum(x)))
wham_data$index_paa = array(data = index_paa_prop, dim = c(1,max_year-min_year+1,n_ages))
wham_data$index_cv = as.matrix(data_file$CPUE[,5])
wham_data$index_Neff =  as.matrix(as.double(data_file$agecomp[data_file$agecomp$FltSvy == 2, 9]))
wham_data$units_indices = rep(0L, times = 1) # numbers
wham_data$units_index_paa = rep(2L, times = 1) # numbers
wham_data$use_index_paa = matrix(1L, ncol = 1, nrow = (max_year - min_year + 1))

wham_data$selblock_pointer_indices = matrix(2L, ncol = 1, nrow = (max_year - min_year + 1))
wham_data$fracyr_indices = matrix(0.01, ncol = 1, nrow = (max_year - min_year + 1))
waa_matrix = as.matrix(SS_report$wtatage[SS_report$wtatage$Fleet == 1 & SS_report$wtatage$Yr <= max_year, 7:(7+n_ages-1)])
waa_matrix_ini = as.matrix(SS_report$wtatage[SS_report$wtatage$Fleet == 0 & SS_report$wtatage$Yr <= max_year, 7:(7+n_ages-1)])
waa_tot_matrix = rbind(waa_matrix, waa_matrix, waa_matrix, waa_matrix_ini)
dim(waa_tot_matrix) = c(max_year-min_year+1,4,n_ages)
waa_tot_matrix2 = aperm(waa_tot_matrix, c(2,1,3))
wham_data$waa = waa_tot_matrix2
wham_data$maturity = matrix(rep(SS_report$endgrowth[,19], times = max_year - min_year + 1),
                            ncol = n_ages, nrow = max_year - min_year + 1, byrow = TRUE) 
wham_data$fracyr_SSB = rep(0, times = max_year - min_year + 1)
wham_data$Fbar_ages = c(5L,21L)
wham_data$percentSPR = 20
wham_data$percentFXSPR = n_years
wham_data$percentFMSY = n_years
wham_data$XSPR_R_avg_yrs = 1:n_years
wham_data$XSPR_R_opt = 1
wham_data$simulate_process_error = rep(1, times = 6)
wham_data$simulate_observation_error = rep(1, times = 3)
wham_data$simulate_period = rep(1, times = 2)
wham_data$bias_correct_process = 0
wham_data$bias_correct_observation = 0

my_input = prepare_wham_input(model_name="whamGrowth0",
                              selectivity=list(model=rep("age-specific",2), 
                                               re=rep("none",2), 
                                               initial_pars=list(c(rep(0, 4), rep(1, 17)),
                                                                 c(rep(0, 1), rep(1, 20))),
                                               fix_pars = list(1:21, 1:21),
                                               n_selblocks = 2),
                              M = list(model = 'constant', re = 'none', 
                                       initial_means = 0.36),
                              NAA_re = list(sigma="rec", cor = 'iid', N1_model = 0,
                                            recruit_model = 2,
                                            N1_pars = as.vector(as.matrix(NAA_SS[1,])), 
                                            recruit_pars = c(500000)),
                              growth = list(model = 'vB_classic',
                                            re = c('none', 'none', 'none'), 
                                            init_vals = c(0.16, 117.9, 0.835)), # K, Linf, t0
                              catchability = list(re = 'none', initial_q = 1, q_lower = 0,
                                                  q_upper = 1000, prior_sd = NA),
                              age_comp = 'multinomial',
                              len_comp = 'multinomial',
                              basic_info = wham_data)

# Some extra changes:
my_input$par$log_NAA = as.matrix(log(NAA_SS[-1,])) # set initial rec devs as OM
my_input$par$mean_rec_pars = mean(log(NAA_SS[,1])) # mean recruitment as OM
my_input$map$log_N1_pars = factor(rep(NA, times = n_ages)) # fix N1
my_input$map$log_F1 = factor(c(NA)) # fix F1
my_input$map$logit_q = factor(NA) # fix q

# Run model:
my_model_8 = fit_wham(my_input, do.osa = FALSE, do.fit = TRUE)
check_convergence(my_model_8)

# Compare models ----------------------------------------------------------
this_model = my_model_8
this_name = deparse(substitute(my_model_8))

# Compare SSB time series:
OM_SSB = SS_reportEM$timeseries[SS_reportEM$timeseries$Yr >= min_year & 
                                SS_reportEM$timeseries$Yr <= max_year, 'SpawnBio']
WHAM_SSB = this_model$rep$SSB 
data_plot = data.frame(year = rep(min_year:max_year, times = 2), 
                       SSB = c(OM_SSB*1e-06, WHAM_SSB*1e-06),
                       type = c(rep('OM', times = length(min_year:max_year)), 
                                rep('WHAM', times = length(min_year:max_year))))
p1 = ggplot(data = data_plot, aes(x = year, y = SSB, color = factor(type))) +
  geom_line() + 
  ylab('SSB (1e+06)') +
  theme_bw() +
  guides(color = guide_legend(title = 'model')) +
  theme(legend.position = c(0.8, 0.8))

ggsave(paste0('images/SSB_', this_name,'.png'), plot = p1, width = 110, height = 80, units = 'mm', dpi = 300)

# Check hessian -----------------------------------------------------------
my_hessian = this_model$env$spHess(random = TRUE)

png(filename = paste0('images/hessian_', this_name,'.png'), width = 120, height = 90, units = 'mm', res = 300)
par(mar=c(3,2,1,5))
image(my_hessian)
dev.off()

