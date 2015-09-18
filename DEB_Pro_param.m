% DEB-Pro
% Version 1, May 23rd, 2015, by MG
% i=[C N P]

clear 
clc

md=40; % number of days

M_V0=4.16e-15; % =50 fg C in moles
m_E0=[3.83e-15 6.71e-16 6.29e-17]/M_V0; % bertilsson, bertilsson, krumhardt, mol/molM_V 
X0=[3000 800 50]*1e-6; % Concentration in Pro99 medium in moles. 2000 uM of C is the sturation of CO2 in sea water (Follows and Williams 2011)

% param
% light params
pars.alpha=.365; % photon flux coefficient, units: mol photons (uE m-2)-1 molMv-1 d-1 ??? was 2... nothing is really affecting
pars.I=20; % uE m-2 - light intensity

% kappas - fraction of rejected flux returned into reserve
pars.kappaE=ones(1,3)*.75; % just a guess, Lorena had 0.7...

% Mikhaelis-Menten consts.
pars.K=[.000165*10 .00000011*1e3 .0000021]; % Palinska, Maranon (Litchman), Krumhardt; units: Molar

% elements of structure and reserve (C H O N P)
pars.nV=[1 263/106 110/106 16/106 1/106;   % structure composition
    1 2 1 0 0;                             % E_C composition
    0 4 0 1 0;                             % E_N composition
    0 0 4 0 1];                            % E_P composition

% Arrhenius temp.
T=273+24;   % experiment's temp.
T_A=7964.5; % calculation in TA.xlsx
T_1=273+[19 18 24]; % K, temp rate is given in: Palinska (C): 18-20, Maranon (N): 18+/-0.5, Krumbhardt (PO4): 24
TC=tcorr1(T,T_1,T_A);

% turover rates
pars.k_E=5.2; % 2.6 from Lorena... bigger value makes mE to go down and vis versa. nice val of 4

% yields
pars.y_E_V=[pars.nV(1,1) pars.nV(1,4) pars.nV(1,5)]; % according to assumption b in table 2 at Lorena     or...  =A.j_E_G./j_G

% Rate params.
% assimilation rates
N_uptake=6.37e-05*1e-12*0.0587*24; % pgN h-1*grams in pg*moles of ammunium*hours per day, data from Maranon
P_uptake=0.0005*1e-15*24; % fmol h-1*fmole to mole*24 hours per day, data from Krumhardt
CO2_uptake=10.636*1.235e-12*1e-9*60*24; % 10.636 nmol min-1 (mg Chl)-1 (value from Palinska)*1.235e-12 mg Chl cell*60 mins in hour*24 hour per day

pars.j_E_Am=[6.7648e-016 TC(2)*N_uptake TC(3)*P_uptake]/M_V0*1e-3; % mol d-1/molM_V %%%%first value (for E_C) is not true!!!!! need to obtain!%%%% N=1.09e-16, P=4.72e-21
pars.j_CO2_Am=TC(1)*CO2_uptake/M_V0; % palinska, mol d-1/molM_V 
pars.j_L=pars.alpha*pars.I; % light "assimilation" rate

% reserve maintenance rates
pars.j_E_M=[.054 .012 .012*.95]; % from Lorena [.054 .012 .012] make it lower surprisingly decrease mE, but make MV bigger

% growth rate
% the specific growth flux
pars.r_max=0.98; % d-1

% for saving data
% global source_C source_index 
% source_index=1;
% source_C=zeros(4000,2);

% State variable Eqs.
statVar0=[m_E0 X0 M_V0];
[t,statVar_values]=ode45(@(t,statVar) ProDEB(t,statVar,pars),[0 5],statVar0);
t_all=t; t_all(end)=[];
statVar_values_all=statVar_values; statVar_values_all(end,:)=[];

% HCO3- additions (1 mM) on days: 5, 11, 18 
statVar0=[statVar_values(end,1:3) statVar_values(end,4)+.001 statVar_values(end,5:6) statVar_values(end,7)];
[t,statVar_values]=ode45(@(t,statVar) ProDEB(t,statVar,pars),[5 11],statVar0);
t_all=[t_all; t]; t_all(end)=[];
statVar_values_all=[statVar_values_all; statVar_values]; statVar_values_all(end,:)=[];

statVar0=[statVar_values(end,1:3) statVar_values(end,4)+.001 statVar_values(end,5:6) statVar_values(end,7)];
[t,statVar_values]=ode45(@(t,statVar) ProDEB(t,statVar,pars),[11 18],statVar0);
t_all=[t_all; t]; t_all(end)=[];
statVar_values_all=[statVar_values_all; statVar_values]; statVar_values_all(end,:)=[];

statVar0=[statVar_values(end,1:3) statVar_values(end,4)+.001 statVar_values(end,5:6) statVar_values(end,7)];
[t,statVar_values]=ode45(@(t,statVar) ProDEB(t,statVar,pars),[18 md],statVar0);
t_all=[t_all; t];
statVar_values_all=[statVar_values_all; statVar_values]; 


% experimental results
% columns: density (days - 1, data - 2), nutrients (days - 3, data - 4-6)
     
data=[0       0.0419e11    0       NaN     800       50
    1.8200    0.0867e11    6       NaN     859.18    40.14
    3.8900    0.101e11     14      NaN     1008.52   49.15
    5.8200    0.116e11     18      NaN     817.38    32.17
    7.8600    0.313e11     23      NaN     733.78    17.63
    9.9300    1.05e11      28      NaN     544.16    10.59
    14.9500   1.24e11      31      NaN     471.77    0.78
    19.9600   4.15e11      38      NaN     294.88    0.13
    21.8800   4.97e11      42      NaN     180.12    0.19
    22.9900   5.3e11       NaN     NaN     NaN       NaN
    23.9700   4.76e11      NaN     NaN     NaN       NaN
    27.8900   2.72e11      NaN     NaN     NaN       NaN
    29.8900   2.18e11      NaN     NaN     NaN       NaN
    33.9800   2.02e11      NaN     NaN     NaN       NaN];

% plotting
figure

titles = {'mE_C','mE_N','mE_P','X_C','X_N','X_P','M_V'};
ylabels={'Reserve density (mol molM_V^{-1})','Concentration (mol L^{-1})','Biomass (mol L^{-1})'};

for n=1:3
    subplot(3,3,n)
    plot(t_all,statVar_values_all(:,n))
    title(titles{n})
    xlabel('Time (days)')
    ylabel(ylabels{1})
end
for n=4:6
    subplot(3,3,n)
    plot(t_all,statVar_values_all(:,n),data(:,3),data(:,n)*1e-6,'o')
    title(titles{n})
    xlabel('Time (days)')
    ylabel(ylabels{2})
end
    subplot(3,3,7)
    plot(t_all,statVar_values_all(:,7),data(:,1),data(:,2)*M_V0,'o') %
    title(titles{7})
    xlabel('Time (days)')
    ylabel(ylabels{3})
    
% Checking graphs
% figure(3)
% C=.1:.1:10;
% plot(C,C_assim_1(C,pars.j_L,pars.K(1),pars.j_CO2_Am,pars.j_E_Am(1)),'ro')