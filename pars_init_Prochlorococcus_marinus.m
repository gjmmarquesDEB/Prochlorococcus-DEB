%% pars_init_Prochlorococcus_marinus
% sets (initial values for) parameters

%%
function [par, metaPar, txtPar] = pars_init_Prochlorococcus_marinus(metaData)

metaPar.model = 'mr3'; % see online manual for explanation and alternatives

% reference parameter (not to be changed)
par.T_ref = C2K(20);    free.T_ref = 0;    units.T_ref = 'K';        label.T_ref = 'Reference temperature';

%% primary parameters
% 2.6095e-15=new M_V0
% par.z = 1;                                          free.z = 1;         units.z = '-';                                        label.z = 'z';          % zoom factor; for z = 1: L_m = 1 cm
par.alph = .365;                                            free.alph = 0;      units.alph = 'mol photons (uE m-2)-1 molMv-1 d-1 ';   label.alph='alpha';        % photon flux coefficient
par.K_C = .000000165/10;                                       free.K_C = 0;       units.K_C='M';                                        label.K_C='K_C';             % Mikhaelis-Menten const. Palinska
par.K_N = .0000011;                                        free.K_N = 0;       units.K_N='M';                                        label.K_N='K_N';             % Mikhaelis-Menten const. Maranon (Litchman)
par.K_P = .0000000021;                                         free.K_P = 0;       units.K_P='M';                                        label.K_P='K_P';             % Mikhaelis-Menten const. Krumhardt
par.j_CO2_Am = 7.7414;                                        free.j_CO2_Am = 0;  units.j_CO2_Am='mol d^{-1}/molM_V';                   label.j_CO2_Am='j_E_CO_2Am';   % CO2 assimilation rates
par.j_EN_Am = 0.13;                                         free.j_EN_Am = 1;   units.j_EN_Am='mol d^{-1}/molM_V';                    label.j_EN_Am='j_E_NAm';    % N assimilation rates, Maranon
par.j_EC_Am = par.j_EN_Am*206/16;                            free.j_EC_Am = 1;   units.j_EC_Am='mol d^{-1}/molM_V';                    label.j_EC_Am='j_E_CAm';    % C assimilation rates
par.j_EP_Am = par.j_EN_Am/16;                               free.j_EP_Am = 1;   units.j_EP_Am='mol d^{-1}/molM_V';                    label.j_EP_Am='j_E_PAm';    % P assimilation rates, Krumhardt
par.k_E = 5.2;                                                 free.k_E = 1;       units.k_E='d^{-1}';                                   label.k_E='k_E';             % reserve turnover rate 2.6 from Lorena... 
par.y_EC_V = 1.25;                                             free.y_EC_V = 0;    units.y_EC_V='molE_C molM_V^{-1}';                    label.y_EC_V='y_E_CV';      % yield factor of C-reserve to structure
par.y_EN_V = 16/106/1;                                       free.y_EN_V = 0;    units.y_EN_V='molE_N molM_V^{-1}';                    label.y_EN_V='y_E_NV';      % yield factor of N-reserve to structure
par.y_EP_V = 1/106/1;                                        free.y_EP_V = 0;    units.y_EP_V='molE_P molM_V^{-1}';                    label.y_EP_V='y_E_PV';      % yield factor of P-reserve to structure
% par.j_L = par.alph*par.I;                                      free.j_L = 0;       units.j_L='mol molM_V^{-1} d^{-1}';                   label.j_L='j_L';             % light "assimilation" rate
par.j_EC_M = .054;                                             free.j_EC_M = 1;    units.j_EC_M='molE_C molM_V^{-1} d^{-1}';             label.j_EC_M='j_E_CM';      % C reserve maintenance rates, from Lorena 
par.j_EN_M = .012;                                             free.j_EN_M = 1;    units.j_EN_M='molE_N molM_V^{-1} d^{-1}';             label.j_EN_M='j_E_NM';      % N reserve maintenance rates, from Lorena 
par.j_EP_M = .012/16;                                         free.j_EP_M = 1;    units.j_EP_M='molE_P molM_V^{-1} d^{-1}';             label.j_EP_M='j_E_PM';      % P reserve maintenance rates, from Lorena 
par.kappaEC = .5;                                              free.kappaEC = 0;   units.kappaEC='-';                                    label.kappaEC='kappa_E_C'; % kappas - fraction of rejected flux returned into C reserve
par.kappaEN = .5;                                             free.kappaEN = 0;   units.kappaEN='-';                                    label.kappaEN='kappa_E_N'; % kappas - fraction of rejected flux returned into N reserve
par.kappaEP = .5;                                             free.kappaEP = 0;   units.kappaEP='-';                                    label.kappaEP='kappa_E_P'; % kappas - fraction of rejected flux returned into P reserve
par.kappaXC = 0.95;                                             free.kappaXC = 0;   units.kappaXC='-';                                    label.kappaXC='kappa_X_C'; % kappas - fraction of excreted flux added to the assimilable C source
par.kappaXN = 0.0;                                             free.kappaXN = 0;   units.kappaXN='-';                                    label.kappaXN='kappa_X_N'; % kappas - fraction of excreted flux added to the assimilable N source
par.kappaXP = 0.8;                                             free.kappaXP = 0;   units.kappaXP='-';                                    label.kappaXP='kappa_X_P'; % kappas - fraction of excreted flux added to the assimilable P source

%% auxiliary parameters
par.T_A   = 7964.5;   free.T_A   = 0;    units.T_A = 'K';        label.T_A = 'T_A';      % Arrhenius temperature
% par.del_M = 0.16;   free.del_M = 1;    units.del_M = '-';      label.del_M = 'del_M';  % shape coefficient

% environmental parameters (temperatures are in data)
par.f = 1.0;        free.f     = 0;    units.f = '-';          label.f = 'f';          % scaled functional response for 0-var data
% par.I=20;                                             free.I = 0;           units.I='\muE m^{-2}';                                label.I='I';    % light intensity

txt_par.units = units; txt_par.label = label; par.free = free; % pack units, label, free in structure

%% set chemical parameters from Kooy2010 
%  don't change these values, unless you have a good reason

% specific densities
%   set specific densites using the pet's taxonomy
d_V = get_d_V(metaData.phylum, metaData.class);
par.d_V = d_V;     free.d_V = 0;   units.d_V = 'g/cm^3';  label.d_V = 'specific density of structure'; 
par.d_EC = d_V;    free.d_EC = 0;  units.d_EC = 'g/cm^3'; label.d_EC = 'specific density of carbon reserve'; 
par.d_EN = d_V;    free.d_EN = 0;  units.d_EN = 'g/cm^3'; label.d_EN = 'specific density of nitrogen reserve'; 
par.d_EP = d_V;    free.d_EP = 0;  units.d_EP = 'g/cm^3'; label.d_EP = 'specific density of phosphorous reserve'; 

% chemical potentials from Kooy2010 Tab 4.2
par.mu_V = 525000;  free.mu_V = 0;   units.mu_V = 'J/ mol';  label.mu_V = 'chemical potential of structure'; 
par.mu_EC = 550000; free.mu_EC = 0;  units.mu_EC = 'J/ mol'; label.mu_EC = 'chemical potential of carbon reserve'; 
par.mu_EN = 0;      free.mu_EN = 0;  units.mu_EN = 'J/ mol'; label.mu_EN = 'chemical potential of nitrogen reserve'; 
par.mu_EP = 0;      free.mu_EP = 0;  units.mu_EP = 'J/ mol'; label.mu_EP = 'chemical potential of phosphorous reserve'; 

% chemical potential of minerals
par.mu_C = 0;      free.mu_C = 0;  units.mu_C = 'J/ mol'; label.mu_C = 'chemical potential of CO2'; 
par.mu_H = 0;      free.mu_H = 0;  units.mu_H = 'J/ mol'; label.mu_H = 'chemical potential of H2O'; 
par.mu_O = 0;      free.mu_O = 0;  units.mu_O = 'J/ mol'; label.mu_O = 'chemical potential of O2'; 
par.mu_N = 0;      free.mu_N = 0;  units.mu_N = 'J/ mol'; label.mu_N = 'chemical potential of NH3'; 
par.mu_P = 0;      free.mu_P = 0;  units.mu_P = 'J/ mol'; label.mu_P = 'chemical potential of PH4'; 

% chemical indices for water-free organics from Kooy2010 Fig 4.15 (excluding contributions of H and O atoms from water)
par.n_CV = 1;       free.n_CV = 0;  units.n_CV = '-'; label.n_CV = 'chem. index of carbon in structure'; % n_CV = 1 by definition
par.n_HV = 263/106/1; free.n_HV = 0;  units.n_HV = '-'; label.n_HV = 'chem. index of hydrogen in structure';
par.n_OV = 10/106/1;  free.n_OV = 0;  units.n_OV = '-'; label.n_OV = 'chem. index of oxygen in structure';
par.n_NV = 16/106/1;  free.n_NV = 0;  units.n_NV = '-'; label.n_NV = 'chem. index of nitrogen in structure';
par.n_PV = 1/106/1;   free.n_PV = 0;  units.n_PV = '-'; label.n_PV = 'chem. index of phosphorous in structure';
%
par.n_CEC = 1;    free.n_CEC = 0;  units.n_CEC = '-'; label.n_CEC = 'chem. index of carbon in carbon reserve';   % n_CE = 1 by definition
par.n_HEC = 2;    free.n_HEC = 0;  units.n_HEC = '-'; label.n_HEC = 'chem. index of hydrogen in carbon reserve';
par.n_OEC = 1;    free.n_OEC = 0;  units.n_OEC = '-'; label.n_OEC = 'chem. index of oxygen in carbon reserve';
par.n_NEC = 0;    free.n_NEC = 0;  units.n_NEC = '-'; label.n_NEC = 'chem. index of nitrogen in carbon reserve';
par.n_PEC = 0;    free.n_PEC = 0;  units.n_PEC = '-'; label.n_PEC = 'chem. index of phosphorous in carbon reserve';
%
par.n_CEN = 0;    free.n_CEN = 0;  units.n_CEN = '-'; label.n_CEN = 'chem. index of carbon in nitrogen reserve';   % n_CE = 1 by definition
par.n_HEN = 4;    free.n_HEN = 0;  units.n_HEN = '-'; label.n_HEN = 'chem. index of hydrogen in nitrogen reserve';
par.n_OEN = 0;    free.n_OEN = 0;  units.n_OEN = '-'; label.n_OEN = 'chem. index of oxygen in nitrogen reserve';
par.n_NEN = 1;    free.n_NEN = 0;  units.n_NEN = '-'; label.n_NEN = 'chem. index of nitrogen in nitrogen reserve';
par.n_PEN = 0;    free.n_PEN = 0;  units.n_PEN = '-'; label.n_PEN = 'chem. index of phosphorous in nitrogen reserve';
%
par.n_CEP = 0;    free.n_CEP = 0;  units.n_CEP = '-'; label.n_CEP = 'chem. index of carbon in phosphorous reserve';   % n_CE = 1 by definition
par.n_HEP = 0;    free.n_HEP = 0;  units.n_HEP = '-'; label.n_HEP = 'chem. index of hydrogen in phosphorous reserve';
par.n_OEP = 4;    free.n_OEP = 0;  units.n_OEP = '-'; label.n_OEP = 'chem. index of oxygen in phosphorous reserve';
par.n_NEP = 0;    free.n_NEP = 0;  units.n_NEP = '-'; label.n_NEP = 'chem. index of nitrogen in phosphorous reserve';
par.n_PEP = 1;    free.n_PEP = 0;  units.n_PEP = '-'; label.n_PEP = 'chem. index of phosphorous in phosphorous reserve';

%% Pack output:
txtPar.units = units; txtPar.label = label; par.free = free; 

