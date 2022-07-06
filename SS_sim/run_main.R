require(BBmisc)
require(ss3sim)

rm(list = ls())
setwd('C:/Users/moroncog/Documents/Postdoc_UW/test_size-info/SS_sim')
source('parametersSimulation.R')

# Age information ---------------------------------------------------------

om = "scenario_base/cod-om"
em = "scenario_base/cod-em"
scenarioName = 'D0-E0-F0-R0-cod'


# First set of changes: This will apply for OM:
F0 = list(years = list(c(iniModelyear:nyears)), fleets = 1,
          fvals = list(c(upFway, downFway[-1])))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur), seas = list(1))
# lcomp0 = list(fleets = c(1), Nsamp = list(saNsamEM), years = list((iniFyear+1):nyears),
#               cpar = c(NA))
agecomp0 = list(fleets = c(1,2), Nsamp = list(saNsamEM, saNsamEM), 
                years = list((iniFyear):nyears, iniSurYear:nyears), seas = list(7,1),
                cpar = c(NA,NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(base_natM), par_phase = c(3), forecast_num = 0) # This is not altering anything
R0 = list(retro_yr = 0)

ss3sim_base(iterations = 10, scenarios = scenarioName,
            f_params = F0, index_params = index0, lcomp_params = NULL,
            agecomp_params = agecomp0, estim_params = E0,
            retro_params = R0, om_dir = om, em_dir = em,
            bias_adjust = FALSE)

SS_report = r4ss::SS_output(dir = 'D0-E0-F0-R0-cod/10/em', covar = FALSE) # from OM
SS_plots(replist = SS_report)



# my_model = r4ss::SS_output(dir = paste0(scenarioName, '/10/om'), covar = FALSE)
# r4ss::SS_plots(my_model)

# Length information ------------------------------------------------------


om = "scenario_base/cod-om"
em = "scenario_base/cod-em"
scenarioName = 'D1-E0-F0-R0-cod'


# First set of changes: This will apply for OM:
F0 = list(years = list(c(iniModelyear:nyears)), fleets = 1,
          fvals = list(c(upFway, downFway[-1])))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur), seas = list(1))
lcomp0 = list(fleets = c(1), Nsamp = list(saNsamEM), years = list((iniFyear):nyears), seas = list(7),
              cpar = c(NA))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), 
                years = list(iniSurYear:nyears), seas = list(1),
                cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(base_natM), par_phase = c(3), forecast_num = 0) # This is not altering anything
R0 = list(retro_yr = 0)

ss3sim_base(iterations = 10, scenarios = scenarioName,
            f_params = F0, index_params = index0, lcomp_params = lcomp0,
            agecomp_params = agecomp0, estim_params = E0,
            retro_params = R0, om_dir = om, em_dir = em,
            bias_adjust = FALSE)
  
# my_model = r4ss::SS_output(dir = paste0(scenarioName, '/1/em'), covar = FALSE)
# r4ss::SS_plots(my_model)

SS_report = r4ss::SS_output(dir = 'D1-E0-F0-R0-cod/10/em', covar = FALSE) # from OM
SS_plots(replist = SS_report)


# ALK information ------------------------------------------------------

om = "scenario_base_2/cod-om"
em = "scenario_base_2/cod-em"
scenarioName = 'D2-E0-F0-R0-cod'


# First set of changes: This will apply for OM:
F0 = list(years = list(c(iniModelyear:nyears)), fleets = 1,
          fvals = list(c(upFway, downFway[-1])))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur), seas = list(1))
lcomp0 = list(fleets = c(1), Nsamp = list(saNsamEM), 
              years = list(iniFyear:nyears), seas = list(7),
              cpar = c(NA))
calcomp0 = list(fleets = c(2), 
                years = list(iniSurYear:nyears), seas = list(1), Nsamp_lengths = list(200),
                Nsamp_ages = list(200), cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(base_natM), par_phase = c(3), forecast_num = 0) # This is not altering anything
R0 = list(retro_yr = 0)

ss3sim_base(iterations = 10, scenarios = scenarioName,
            f_params = F0, index_params = index0, lcomp_params = lcomp0,
            calcomp_params = calcomp0, estim_params = E0,
            retro_params = R0, om_dir = om, em_dir = em,
            bias_adjust = FALSE)

# my_model = r4ss::SS_output(dir = paste0(scenarioName, '/1/em'), covar = FALSE)
# r4ss::SS_plots(my_model)

SS_report = r4ss::SS_output(dir = 'D2-E0-F0-R0-cod/10/em', covar = FALSE) # from OM
SS_plots(replist = SS_report)


# Length information Size selex ------------------------------------------------------


om = "scenario_base_3/cod-om"
em = "scenario_base_3/cod-em"
scenarioName = 'D3-E0-F0-R0-cod'


# First set of changes: This will apply for OM:
F0 = list(years = list(c(iniModelyear:nyears)), fleets = 1,
          fvals = list(c(upFway, downFway[-1])))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur), seas = list(1))
lcomp0 = list(fleets = c(1), Nsamp = list(saNsamEM), years = list((iniFyear):nyears), seas = list(7),
              cpar = c(NA))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), 
                years = list(iniSurYear:nyears), seas = list(1),
                cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(base_natM), par_phase = c(3), forecast_num = 0) # This is not altering anything
R0 = list(retro_yr = 0)

ss3sim_base(iterations = 10, scenarios = scenarioName,
            f_params = F0, index_params = index0, lcomp_params = lcomp0,
            agecomp_params = agecomp0, estim_params = E0,
            retro_params = R0, om_dir = om, em_dir = em,
            bias_adjust = FALSE)

# my_model = r4ss::SS_output(dir = paste0(scenarioName, '/1/em'), covar = FALSE)
# r4ss::SS_plots(my_model)

SS_report = r4ss::SS_output(dir = 'D3-E0-F0-R0-cod/10/em', covar = FALSE) # from OM
SS_plots(replist = SS_report)

# Growth K temporal variability ------------------------------------------------------

om = "scenario_base_4/cod-om"
em = "scenario_base_4/cod-em"
scenarioName = 'D4-E0-F0-R0-cod'


# First set of changes: This will apply for OM:
F0 = list(years = list(c(iniModelyear:nyears)), fleets = 1,
          fvals = list(c(upFway, downFway[-1])))

# Second set of changes: This will apply for EM:
index0 = list(fleets = c(2), years = list(iniSurYear:nyears), sds_obs = list(CVSur), seas = list(1))
lcomp0 = list(fleets = c(1), Nsamp = list(saNsamEM), years = list((iniFyear):nyears), seas = list(7),
              cpar = c(NA))
agecomp0 = list(fleets = c(2), Nsamp = list(saNsamEM), 
                years = list(iniSurYear:nyears), seas = list(1),
                cpar = c(NA))

# Standard (apply to EM):
E0 = list(natM_type = NULL, natM_n_breakpoints = NULL, natM_lorenzen = NULL, 
          natM_val= NULL, par_name = c("NatM_p_1_Fem_GP_1"),
          par_int = c(base_natM), par_phase = c(3), forecast_num = 0) # This is not altering anything
G1 = list(VonBert_K_Fem_GP_1 = growthindex1$index) # check time varying parameters later
R0 = list(retro_yr = 0)

ss3sim_base(iterations = 10, scenarios = scenarioName,
            f_params = F0, index_params = index0, lcomp_params = lcomp0,
            agecomp_params = agecomp0, estim_params = E0,
            retro_params = R0, om_dir = om, em_dir = em,
            tv_params = G1,
            bias_adjust = FALSE)

# my_model = r4ss::SS_output(dir = paste0(scenarioName, '/1/em'), covar = FALSE)
# r4ss::SS_plots(my_model)

SS_report = r4ss::SS_output(dir = 'D4-E0-F0-R0-cod/10/em', covar = FALSE) # from OM
SS_plots(replist = SS_report)
