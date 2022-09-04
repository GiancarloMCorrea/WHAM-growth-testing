#V3.30
#C file created using the SS_writectl function in the R package r4ss
#C file write time: 2022-08-25 21:03:42
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
2 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern
# begin and end years of blocks
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
0 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
2 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
0 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
    0	       1	       0.36	  0	  0	0	 -9	  0	0	0	0	0	0	0	#_NatM_p_1_Fem_GP_1    
    0	      40	          3	  0	  0	0	  3	  0	0	0	0	0	0	0	#_L_at_Amin_Fem_GP_1   
   60	     150	      117.9	  0	  0	0	  3	  0	0	0	0	0	0	0	#_L_at_Amax_Fem_GP_1   
    0	       1	       0.16	  0	  0	0	  3	  0	0	0	0	0	0	0	#_VonBert_K_Fem_GP_1   
    0	      10	        0.1	  0	  0	0	  3	  0	0	0	0	0	0	0	#_CV_young_Fem_GP_1    
    0	      20	        0.1	  0	  0	0	  3	  0	0	0	0	0	0	0	#_CV_old_Fem_GP_1      
-9.99	    9.99	5.58883e-06	  0	  0	0	 -1	201	0	0	0	0	0	0	#_Wtlen_1_Fem_GP_1     
-9.99	    9.99	    3.18851	  0	  0	0	 -1	  0	0	0	0	0	0	0	#_Wtlen_2_Fem_GP_1     
-9.99	    9.99	     4.8832	  0	  0	0	 -1	  0	0	0	0	0	0	0	#_Mat50%_Fem_GP_1      
-9.99	    9.99	    -0.9654	  0	  0	0	 -1	  0	0	0	0	0	0	0	#_Mat_slope_Fem_GP_1   
-9.99	    9.99	          1	  0	  0	0	 -1	  0	0	0	0	0	0	0	#_Eggs_scalar_Fem_GP_1 
-9.99	    9.99	          0	  0	  0	0	 -1	  0	0	0	0	0	0	0	#_Eggs_exp_len_Fem_GP_1
   -4	       4	          0	  0	  0	0	 -4	  0	0	0	0	0	0	0	#_RecrDist_GP_1        
   -4	       4	          0	  0	  0	0	 -4	  0	0	0	0	0	0	0	#_RecrDist_Area_1      
   -4	       4	          0	  0	  0	0	 -4	  0	0	0	0	0	0	0	#_RecrDist_month_1     
  0.1	      10	          1	  1	  1	0	 -1	  0	0	0	0	0	0	0	#_CohortGrowDev        
1e-06	0.999999	        0.5	0.5	0.5	0	-99	  0	0	0	0	0	0	0	#_FracFemale_GP_1      
#_timevary MG parameters
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
-2	2	1	0	99	0	-5	#_Wtlen_1_Fem_GP_1_ENV_add
# info on dev vectors created for MGparms are reported with other devs after tag parameter section
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
   12	  16	13.15	0	0	0	 1	0	0	0	0	0	0	0	#_SR_LN(R0)  
-9.99	9.99	    1	0	0	0	-1	0	0	0	0	0	0	0	#_SR_BH_steep
-9.99	9.99	  0.6	0	0	0	-3	0	0	0	0	0	0	0	#_SR_sigmaR  
  -10	   5	    0	0	0	0	-1	0	0	0	0	0	0	0	#_SR_regime  
-9.99	9.99	    0	0	0	0	-1	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
27 # first year of main recr_devs; early devs can preceed this era
75 # last year of main recr_devs; forecast devs start in following year
-2 #_recdev phase
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
27 #_last_yr_nobias_adj_in_MPD; begin of ramp
28 #_first_yr_fullbias_adj_in_MPD; begin of plateau
74 #_last_yr_fullbias_adj_in_MPD
75 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
0 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-10 #min rec_dev
10 #max rec_dev
51 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
#_Year	recdev
26	   0.657013	#_recdev_input1 
27	   0.324728	#_recdev_input2 
28	   0.081844	#_recdev_input3 
29	  -0.612719	#_recdev_input4 
30	  -0.450174	#_recdev_input5 
31	  -0.839059	#_recdev_input6 
32	  -0.560283	#_recdev_input7 
33	  -0.847428	#_recdev_input8 
34	   -1.06292	#_recdev_input9 
35	    -1.0332	#_recdev_input10
36	   0.581788	#_recdev_input11
37	  -0.275909	#_recdev_input12
38	   -0.78725	#_recdev_input13
39	   0.705364	#_recdev_input14
40	   0.627868	#_recdev_input15
41	   0.617805	#_recdev_input16
42	   0.650461	#_recdev_input17
43	  -0.788157	#_recdev_input18
44	  -0.288347	#_recdev_input19
45	  -0.896154	#_recdev_input20
46	   0.147904	#_recdev_input21
47	  -0.441156	#_recdev_input22
48	 -0.0881873	#_recdev_input23
49	   -1.17178	#_recdev_input24
50	  -0.374552	#_recdev_input25
51	  -0.784468	#_recdev_input26
52	   0.757861	#_recdev_input27
53	   0.612775	#_recdev_input28
54	  -0.248566	#_recdev_input29
55	   0.492636	#_recdev_input30
56	   -1.07897	#_recdev_input31
57	   0.234831	#_recdev_input32
58	  -0.574852	#_recdev_input33
59	   -1.36117	#_recdev_input34
60	  -0.905465	#_recdev_input35
61	   -1.18719	#_recdev_input36
62	  -0.556943	#_recdev_input37
63	   0.329746	#_recdev_input38
64	   0.229612	#_recdev_input39
65	  -0.595706	#_recdev_input40
66	  -0.530826	#_recdev_input41
67	   0.272931	#_recdev_input42
68	-0.00759775	#_recdev_input43
69	   -0.79899	#_recdev_input44
70	  -0.167121	#_recdev_input45
71	   -1.47203	#_recdev_input46
72	   -1.12054	#_recdev_input47
73	 -0.0582542	#_recdev_input48
74	  -0.369928	#_recdev_input49
75	   -1.23626	#_recdev_input50
76	   0.372844	#_recdev_input51
#
#Fishing Mortality info
0.01 # F ballpark
-25 # F ballpark year (neg value to disable)
2 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
#_overall start F value; overall phase; N detailed inputs to read
0 1 50 #_F_setup
#_Fleet	Yr	Seas	F_value	se	phase
1	26	1	     0.01	0.005	1	#_1 
1	27	1	0.0200588	0.005	1	#_2 
1	28	1	0.0301176	0.005	1	#_3 
1	29	1	0.0401765	0.005	1	#_4 
1	30	1	0.0502353	0.005	1	#_5 
1	31	1	0.0602941	0.005	1	#_6 
1	32	1	0.0703529	0.005	1	#_7 
1	33	1	0.0804118	0.005	1	#_8 
1	34	1	0.0904706	0.005	1	#_9 
1	35	1	 0.100529	0.005	1	#_10
1	36	1	 0.110588	0.005	1	#_11
1	37	1	 0.120647	0.005	1	#_12
1	38	1	 0.130706	0.005	1	#_13
1	39	1	 0.140765	0.005	1	#_14
1	40	1	 0.150824	0.005	1	#_15
1	41	1	 0.160882	0.005	1	#_16
1	42	1	 0.170941	0.005	1	#_17
1	43	1	    0.181	0.005	1	#_18
1	44	1	 0.191059	0.005	1	#_19
1	45	1	 0.201118	0.005	1	#_20
1	46	1	 0.211176	0.005	1	#_21
1	47	1	 0.221235	0.005	1	#_22
1	48	1	 0.231294	0.005	1	#_23
1	49	1	 0.241353	0.005	1	#_24
1	50	1	 0.251412	0.005	1	#_25
1	51	1	 0.261471	0.005	1	#_26
1	52	1	 0.271529	0.005	1	#_27
1	53	1	 0.281588	0.005	1	#_28
1	54	1	 0.291647	0.005	1	#_29
1	55	1	 0.301706	0.005	1	#_30
1	56	1	 0.311765	0.005	1	#_31
1	57	1	 0.321824	0.005	1	#_32
1	58	1	 0.331882	0.005	1	#_33
1	59	1	 0.341941	0.005	1	#_34
1	60	1	    0.352	0.005	1	#_35
1	61	1	    0.352	0.005	1	#_36
1	62	1	    0.352	0.005	1	#_37
1	63	1	    0.352	0.005	1	#_38
1	64	1	    0.352	0.005	1	#_39
1	65	1	    0.352	0.005	1	#_40
1	66	1	    0.352	0.005	1	#_41
1	67	1	    0.352	0.005	1	#_42
1	68	1	    0.352	0.005	1	#_43
1	69	1	    0.352	0.005	1	#_44
1	70	1	    0.352	0.005	1	#_45
1	71	1	    0.352	0.005	1	#_46
1	72	1	    0.352	0.005	1	#_47
1	73	1	    0.352	0.005	1	#_48
1	74	1	    0.352	0.005	1	#_49
1	75	1	    0.352	0.005	1	#_50
#
#_initial_F_parms; count = 0
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
    2	1	0	0	0	0	#_Fleet2    
-9999	0	0	0	0	0	#_terminator
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-5	5	0	0	0	0	-4	0	0	0	0	0	0	0	#_LnQ_base_Fleet2(2)
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
0	0	0	0	#_1 Fleet1
0	0	0	0	#_2 Fleet2
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
11	0	0	0	#_1 Fleet1
11	0	0	0	#_2 Fleet2
#
#_SizeSelex
#_No size_selex_parm
#_AgeSelex
1	20	 4	-999	-999	0	3	0	0	0	0	0	0	0	#_AgeSel_P_1_Fleet1(1)
1	20	20	-999	-999	0	3	0	0	0	0	0	0	0	#_AgeSel_P_2_Fleet1(1)
0	20	 1	-999	-999	0	3	0	0	0	0	0	0	0	#_AgeSel_P_1_Fleet2(2)
0	20	20	-999	-999	0	3	0	0	0	0	0	0	0	#_AgeSel_P_2_Fleet2(2)
#_no timevary selex parameters
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_Factor Fleet Value
-9999 1 0 # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
-9999 0 0 0 0 # terminator
#
0 # 0/1 read specs for more stddev reporting
#
999
