%% predict_Prochlorococcus_marinus
% Obtains predictions, using parameters and data

%%
function [prdData, info, XNut_pro99, XNut_LowN, XNut_LowP] = predict_Prochlorococcus_marinus(par, data, auxData)
  
  %% unpack par, data and auxData
  vars_pull(par); vars_pull(data); vars_pull(auxData);
  
  kappaEN = kappaEC; kappaEP = kappaEC;
  kappaXN = kappaXC; kappaXP = kappaXC;  
  
  m_ECm = (j_EC_Am - kappaEC * j_EC_M)/ (1 - kappaEC)/ k_E;
  m_ENm = (j_EN_Am - kappaEN * j_EN_M)/ (1 - kappaEN)/ k_E;
  m_EPm = (j_EP_Am - kappaEP * j_EP_M)/ (1 - kappaEP)/ k_E;
  
  RR_Nm = n_NV + m_ENm;
  RR_Pm = n_PV + m_EPm;

  filterChecks = y_EN_V < n_NV || y_EP_V < n_PV  || ...     % mass conservation  n_HV > 263/106 || n_OV > 10/106 || n_NV > 16/106 || n_PV > 1/106 || ...     % assuming there is some reserve in Redfield ratio
                 j_EC_Am < j_EC_M || j_EN_Am < j_EN_M || j_EP_Am < j_EP_M || ...                 % species survival
                 k_E < 0.52 || ...                                                               % r_max = 0.71
                 j_EC_Am < 1.1 * j_EC_M || j_EN_Am < 1.1 * j_EN_M || j_EP_Am < 1.1 * j_EP_M || ...              % species survival
                 kappaEC < 0 || kappaEC > 1 || kappaEN < 0 || kappaEN > 1 || kappaEP < 0 || kappaEP > 1 || ...  % energy conservation
                 kappaXC < 0 || kappaXC > 1 || kappaXN < 0 || kappaXN > 1 || kappaXP < 0 || kappaXP > 1 || ...
                 RR_Nm * 106/16 > 7 || RR_Pm * 106 > 7 || ...                 %m_ECm > 100 || ...
                 m_ENm > 10 || m_EPm > 20; % || ... 
%                  j_EC_M < j_EN_M * 206/16;       % maintenance in C must be higher than the others
  
             
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  %       V        E_C  E_N  E_P
  n_O = [n_CV, n_CEC, n_CEN, n_CEP;  % C/C, equals 1 by definition
         n_HV, n_HEC, n_HEN, n_HEP;  % H/C  these values show that we consider dry-mass
         n_OV, n_OEC, n_OEN, n_OEP;  % O/C
         n_NV, n_NEC, n_NEN, n_NEP;    % N/C
         n_PV, n_PEC, n_PEN, n_PEP]; % P/C

  w_O  = n_O' * [12; 1; 16; 14; 31]; % g/mol, mol-weights for (unhydrated)  org. compounds
  w_V  = w_O(1);  w_EC = w_O(2);  w_EN = w_O(3);  w_EP = w_O(4);
  
  %% compute temperature correction factors
  
  TC_tXN = tempcorr(temp.tXN_pro99, T_ref,T_A);
  
  j_EN_Am = j_EN_Am*TC_tXN;
  j_EP_Am = j_EP_Am*TC_tXN;
  j_CO2_Am = j_CO2_Am*TC_tXN;

  %% zero-variate data

%   % maximum growth rate: r_max
%    R_max;
%   % time of division: tb
%    T_d;
%    % light intensity
%    Ii;
   
%   % life span
%   pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
%   t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
%   aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
%   
%   %% pack to output
%   % the names of the fields in the structure must be the same as the data names in the mydata file
%    prdData.r_max=R_max;
%    prdData.td=T_d;
%    prdData.I=Ii;
  %% uni-variate data
  
  % time-nutriens: N & P
  % State variable Eqs.
  
  C_init = 0.5e-5; r = 0.4; 
  m_EC0 = (j_EC_Am - kappaEC * j_EC_M - kappaEC * y_EC_V * r)/ ((1 - kappaEC) * k_E + kappaEC * r);
  m_EN0 = (j_EN_Am - kappaEN * j_EN_M - kappaEN * y_EN_V * r)/ ((1 - kappaEN) * k_E + kappaEN * r);
  m_EP0 = (j_EP_Am - kappaEP * j_EP_M - kappaEP * y_EP_V * r)/ ((1 - kappaEP) * k_E + kappaEP * r);
  M_V0 = C_init/ (1 + m_EC0);
  
  data0_pro99 = [3000*1e-6, 800*1e-6, 50*1e-6, m_EC0, m_EN0, m_EP0, M_V0]; 
  data0_LowN = [3000*1e-6, 100*1e-6, 50*1e-6, m_EC0, m_EN0, m_EP0, M_V0]; 
  data0_LowP = [3000*1e-6, 800*1e-6, 50/8*1e-6, m_EC0, m_EN0, m_EP0, M_V0]; 

  % HCO3- additions (1 mM) on days: 5, 11, 18  
  tTot_pro99 = [0];  tTot_LowN = [0];   tTot_LowP = [0]; 
  XNut_pro99 = data0_pro99;  XNut_LowN = data0_LowN;  XNut_LowP = data0_LowP;
  
  tNC_pro99  = union(tXN_pro99(:,1)', tXC_pro99(:,1)');    tNC_LowN  = union(tXN_LowN(:,1)', tXC_LowN(:,1)');  tNC_LowP  = union(tXN_LowP(:,1)', tXC_LowP(:,1)');
  tAll_pro99 = union(tNC_pro99,tV_pro99(:,1)');  tAll_LowN = union(tNC_LowN,tV_LowN(:,1)');  tAll_LowP = union(tNC_LowP,tV_LowP(:,1)');
  pos_N_pro99 = ismember(tAll_pro99, tXN_pro99(:,1)');   pos_N_LowN = ismember(tAll_LowN, tXN_LowN(:,1)');    pos_N_LowP = ismember(tAll_LowP, tXN_LowP(:,1)');
  pos_C_pro99 = ismember(tAll_pro99, tXC_pro99(:,1)');   pos_C_LowN = ismember(tAll_LowN, tXC_LowN(:,1)');    pos_C_LowP = ismember(tAll_LowP, tXC_LowP(:,1)');
  pos_V_pro99 = ismember(tAll_pro99, tV_pro99(:,1)');   pos_V_LowN = ismember(tAll_LowN, tV_LowN(:,1)');    pos_V_LowP = ismember(tAll_LowP, tV_LowP(:,1)');
  tvec_pro99 = tAll_pro99;  tvec_LowN = tAll_LowN;  tvec_LowP = tAll_LowP;
  
  options = odeset('RelTol', 1e-6);
  
  [t, statVar_values] = ode23s(@(t, statVar) ProDEB1(t, statVar, par), tvec_pro99, data0_pro99, options);
  XNut_pro99 = statVar_values;
  
  [t, statVar_values] = ode23s(@(t, statVar) ProDEB1(t, statVar, par), tvec_LowN, data0_LowN, options);
  XNut_LowN = statVar_values;
  
  [t, statVar_values] = ode23s(@(t, statVar) ProDEB1(t, statVar, par), tvec_LowP, data0_LowP, options);
  XNut_LowP = statVar_values;
  
 

  %% pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
%   prdData.num_cell=NumCell;
%   prdData.biomass=Biomass;
  prdData.tXN_pro99 = XNut_pro99(pos_N_pro99, 2) * 1e6; % concentration in muM
  prdData.tXP_pro99 = XNut_pro99(pos_N_pro99, 3) * 1e6; % concentration in muM
  prdData.tXC_pro99 = XNut_pro99(pos_C_pro99, 1) * 1e6; % concentration in muM
  prdData.tV_pro99 = XNut_pro99(pos_V_pro99, 7) .* (1 + XNut_pro99(pos_V_pro99, 4));       % biomass in mols

  prdData.tXN_LowN = XNut_LowN(pos_N_LowN, 2) * 1e6; % concentration in muM
  prdData.tXP_LowN = XNut_LowN(pos_N_LowN, 3) * 1e6; % concentration in muM
  prdData.tXC_LowN = XNut_LowN(pos_C_LowN, 1) * 1e6; % concentration in muM
  prdData.tV_LowN = XNut_LowN(pos_V_LowN, 7) .* (1 + XNut_LowN(pos_V_LowN, 4));       % biomass in mols

  prdData.tXN_LowP = XNut_LowP(pos_N_LowP, 2) * 1e6; % concentration in muM
  prdData.tXP_LowP = XNut_LowP(pos_N_LowP, 3) * 1e6; % concentration in muM
  prdData.tXC_LowP = XNut_LowP(pos_C_LowP, 1) * 1e6; % concentration in muM
  prdData.tV_LowP = XNut_LowP(pos_V_LowP, 7) .* (1 + XNut_LowP(pos_V_LowP, 4));       % biomass in mols
  
  info = 1;