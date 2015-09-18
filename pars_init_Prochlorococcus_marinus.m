%% pars_init_Prochlorococcus_marinus
% sets (initial values for) parameters

%%
function [par, metapar, txt_par, chem] = pars_init_Prochlorococcus_marinus(metadata)
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/03/31
  
  %% Syntax
  % [par, txt_par, chem] = <../pars_init_Prochlorococcus_marinus.m *pars_init_Prochlorococcus_marinus*>(metadata)
  
  %% Description
  % sets (initial values for) parameters
  %
  % Input
  %
  % * metadata for names of phylum and class to get d_V
  %  
  % Output
  %
  % * par : structure with values of parameters
  % * txt_par: structure with information on parameters
  % * chem : structure with values of chemical parameters

% parameters: initial values at 
T_C = 273.15;     % K, temperature at 0 degrees C
T_ref = T_C + 20; % K, reference temperature
metapar.T_ref = T_ref;
metapar.model = 'mr3'; % see online manual for explanation and alternatives

% edit the values below such that predictions are not too far off;
% the values must be set in the standard DEB units:
%   d for time; cm for length; J for energy; K for temperature

%% primary parameters
% 2.6095e-15=new M_V0
% par.z = 1;                                          free.z = 1;         units.z = '-';                                        label.z = 'z';          % zoom factor; for z = 1: L_m = 1 cm
par.alph = .365;                                            free.alph = 0;      units.alph = 'mol photons (uE m-2)-1 molMv-1 d-1 ';   label.alph='alpha';        % photon flux coefficient
par.K_C = .000165*10;                                       free.K_C = 0;       units.K_C='M';                                        label.K_C='K_C';             % Mikhaelis-Menten const. Palinska
par.K_N = .00000011*1e3;                                    free.K_N = 0;       units.K_N='M';                                        label.K_N='K_N';             % Mikhaelis-Menten const. Maranon (Litchman)
par.K_P = .0000021;                                         free.K_P = 0;       units.K_P='M';                                        label.K_P='K_P';             % Mikhaelis-Menten const. Krumhardt
par.j_CO2_Am = 1.068*10.636*1.235e-12*1e-9*60*24/2.6095e-15;free.j_CO2_Am = 0;  units.j_CO2_Am='mol d^{-1}/molM_V';                   label.j_CO2_Am='j_E_CO_2Am';   % CO2 assimilation rates
% par.j_EC_Am = 6.7648e-016/4.16e-15*1e-3;                    free.j_EC_Am = 0;   units.j_EC_Am='mol d^{-1}/molM_V';                    label.j_EC_Am='j_E_CAm';    % C assimilation rates
par.j_EN_Am = 1.1411*6.37e-5*1e-12*.0587*24/2.6095e-15*1e-3;free.j_EN_Am = 0;   units.j_EN_Am='mol d^{-1}/molM_V';                    label.j_EN_Am='j_E_NAm';    % N assimilation rates, Maranon
par.j_EC_Am = par.j_EN_Am*5.1;                              free.j_EC_Am = 0;   units.j_EC_Am='mol d^{-1}/molM_V';                    label.j_EC_Am='j_E_CAm';    % C assimilation rates
par.j_EP_Am = .772*.0005*1e-15*24/2.6095e-15*1e-3;          free.j_EP_Am = 0;   units.j_EP_Am='mol d^{-1}/molM_V';                    label.j_EP_Am='j_E_PAm';    % P assimilation rates, Krumhardt
par.k_E = 5.2;                                              free.k_E = 0;       units.k_E='d^{-1}';                                   label.k_E='k_E';             % reserve turnover rate 2.6 from Lorena... 
par.y_EC_V = 1;                                             free.y_EC_V = 0;    units.y_EC_V='molE_C molM_V^{-1}';                    label.y_EC_V='y_E_CV';      % yield factor of C-reserve to structure
par.y_EN_V = 106/16;                                        free.y_EN_V = 0;    units.y_EN_V='molE_N molM_V^{-1}';                    label.y_EN_V='y_E_NV';      % yield factor of N-reserve to structure
par.y_EP_V = 106;                                           free.y_EP_V = 0;    units.y_EP_V='molE_P molM_V^{-1}';                    label.y_EP_V='y_E_PV';      % yield factor of P-reserve to structure
% par.j_L = par.alph*par.I;                                  free.j_L = 0;       units.j_L='mol molM_V^{-1} d^{-1}';                   label.j_L='j_L';             % light "assimilation" rate
par.j_EC_M = .054;                                          free.j_EC_M = 0;    units.j_EC_M='molE_C molM_V^{-1} d^{-1}';             label.j_EC_M='j_E_CM';      % C reserve maintenance rates, from Lorena 
par.j_EN_M = .012;                                          free.j_EN_M = 0;    units.j_EN_M='molE_N molM_V^{-1} d^{-1}';             label.j_EN_M='j_E_NM';      % N reserve maintenance rates, from Lorena 
par.j_EP_M = .012*.95;                                      free.j_EP_M = 0;    units.j_EP_M='molE_P molM_V^{-1} d^{-1}';             label.j_EP_M='j_E_PM';      % P reserve maintenance rates, from Lorena 
par.kappaEC = .75;                                          free.kappaEC = 0;   units.kappaEC='-';                                    label.kappaEC='kappa_E_C'; % kappas - fraction of rejected flux returned into C reserve
par.kappaEN = .75;                                          free.kappaEN = 0;   units.kappaEN='-';                                    label.kappaEN='kappa_E_N'; % kappas - fraction of rejected flux returned into N reserve
par.kappaEP = .75;                                          free.kappaEP = 0;   units.kappaEP='-';                                    label.kappaEP='kappa_E_P'; % kappas - fraction of rejected flux returned into P reserve


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
d_V = get_d_V(metadata.phylum, metadata.class); d_EC = d_V;  d_EN = d_V;   d_EP = d_V;
% For a specific density of wet mass of 1 g/cm^3,
%   a specific density of d_E = d_V = 0.1 g/cm^3 means a dry-over-wet weight ratio of 0.1
% Replace d_V and d_E to more appropriate values if you have them
% see comments on section 3.2.1 of DEB3 
%   
%       V    E_C    E_N    E_P       structure, C  reserve, N reserve,  P reserve 
d_O = [ d_V; d_EC;  d_EN;  d_EP];    % g/cm^3, specific densities for organics

% chemical potentials from Kooy2010 Tab 4.2
%        V    E_C    E_N    E_P 
mu_O = [500; 550;  0;  0] * 1000; % J/mol, chemical potentials for organics
%       C  H  O  N  P   CO2, H2O, O2, NH4, PO4
mu_M = [0; 0; 0; 0; 0]; % chemical potential of minerals

% chemical indices from Kooy2010 Fig 4.15
%       V        E_C  E_N  E_P
n_O = [1,        1,   0,   0;  % C/C, equals 1 by definition
       263/106,  2,   4,   0;  % H/C  these values show that we consider dry-mass
       10/106,   1,   0,   4;  % O/C
       16/106,   0,   1,   0;    % N/C
       1/106,    0,   0,   1]; % P/C

 w_O = n_O' * [12; 1; 16; 14; 31]; % g/mol, mol-weights for (unhydrated)  org. compounds
 w_V = w_O(1);
 w_EC = w_O(2);
 w_EN = w_O(3);
 w_EP = w_O(4);   
   
%       C     H     O     N     P
n_M = [ 1     0     0     0     0;    % C/C, equals 0 or 1
        0     2     0     3     0;    % H/C
        2     1     2     0     4;    % O/C
        0     0     0     1     0;   % N/C
        0     0     0     0     1];   % P/C
    
    
% makes structure with chemical indices
% molar volume of gas at 1 bar and 20 C is 24.4 L/mol
T = T_C + 24;            % K, temp of measurement equipment
X_gas = T_ref/ T/ 24.4;  % M, mol of gas per litre at T_ref (= 20 C) and 1 bar 

% pack chem 
chem = struct(...
'mu_M', mu_M,  ...
'mu_V', mu_O(1),  ...
'mu_EC', mu_O(2),  ...
'mu_EN', mu_O(3),  ...
'mu_EP', mu_O(4),  ...
'd_V',  d_O(1),   ...
'd_EC',  d_O(2),   ...
'd_EN',  d_O(3),   ...
'd_EP',  d_O(4),   ...
'X_gas', X_gas, ...
'n_O',  n_O,   ...
'n_M',  n_M, ...
'w_V', w_V, ...
'w_EC', w_EC, ... 
'w_EN', w_EN, ...
'w_EP', w_EP);
