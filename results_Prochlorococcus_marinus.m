%% results_my_pet
% presents results of univariate data graphically

%%
function results_Prochlorococcus_marinus(txt_par, par, chem, metapar, txt_data, data)
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/04/12

  %% Syntax
  % <../results_Prochlorococcus_marinus.m *results_Prochlorococcus_marinus*>(txt_par, par, chem, metapar, txt_data, data)
  
  %% Description
  % present customized results of univariate data
  %
  % * inputs 
  %
  % * txt_par: text vector for the presentation of results
  % * par: structure with parameters (see below)
  % * chem: structure with biochemical parameters
  % * metapar: structure with field T_ref for reference temperature
  % * txt_data: text vector for the presentation of results
  % * data: structure with data
  
  %% Remarks
  % Called from estim_pars and printmat
  
  % get predictions
  Prd_data = data;              % copy data to Prd_data
  t = linspace(0, 25, 100)';    % set independent variable
  Prd_data.tXC_pro99 = t; 
  Prd_data.tXN_pro99 = t;
  Prd_data.tXP_pro99 = t;
  Prd_data.tV_pro99= t;
  Prd_data.tXC_LowN = t; 
  Prd_data.tXN_LowN = t;
  Prd_data.tXP_LowN = t;
  Prd_data.tV_LowN= t;
  Prd_data.tXC_LowP = t; 
  Prd_data.tXN_LowP = t;
  Prd_data.tXP_LowP = t;
  Prd_data.tV_LowP = t;
  
  % overwrite Prd_data to obtain dependent variables
  [Prd_data] = predict_Prochlorococcus_marinus(par, chem, metapar.T_ref, Prd_data);
 
  v2struct(data)
  
  % unpack data & predictions
%   Pt       = Prd_data.nut(:,1); % predictions (dependent variable) first set
%   Pnut     = Prd_data.nut(:,2:4); % predictions (dependent variable) second set
%   Pbio     = Prd_data.biomass; 
%   Preserve = Prd_data.reserve;
  EXC_pro99 = Prd_data.tXC_pro99;      % predictions (dependent variable) first set
  EXN_pro99 = Prd_data.tXN_pro99;      % predictions (dependent variable) second set 
  EXP_pro99 = Prd_data.tXP_pro99;      % predictions (dependent variable) third set
  V_pro99 = Prd_data.tV_pro99;       % predictions (dependent variable) 7th set
  EXC_LowN = Prd_data.tXC_LowN;      % predictions (dependent variable) first set
  EXN_LowN = Prd_data.tXN_LowN;      % predictions (dependent variable) second set 
  EXP_LowN = Prd_data.tXP_LowN;      % predictions (dependent variable) third set
  V_LowN = Prd_data.tV_LowN;       % predictions (dependent variable) 7th set
  EXC_LowP = Prd_data.tXC_LowP;      % predictions (dependent variable) first set
  EXN_LowP = Prd_data.tXN_LowP;      % predictions (dependent variable) second set 
  EXP_LowP = Prd_data.tXP_LowP;      % predictions (dependent variable) third set
  V_LowP = Prd_data.tV_LowP;       % predictions (dependent variable) 7th set

  close all % remove existing figures, else you get more and more if you retry

  figure(1) % figure to show results of uni-variate data for pro99
  subplot(2,3,1)
  plot(t, EXC_pro99, 'g', tXC_pro99(:,1), tXC_pro99(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Carbon concentration, \mumol L^{-1}')
  subplot(2,3,2)
  plot(t, EXN_pro99, 'g', tXN_pro99(:,1), tXN_pro99(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Nitrogen concentration, \mumol L^{-1}')
  title('PRO99 medium experiment')
  %print -dpng results_Prochlorococcus_marinus_01.png
  subplot(2,3,3)
  plot(t, EXP_pro99, 'g', tXP_pro99(:,1), tXP_pro99(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Phosphorous concentration, \mumol L^{-1}')
  subplot(2,3,4)
  plot(t, V_pro99, 'g', tV_pro99(:,1), tV_pro99(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Biomass, mol L^{-1}')  
  
  figure(2) % figure to show results of uni-variate data for LowN
  subplot(2,3,1)
  plot(t, EXC_LowN, 'g', tXC_LowN(:,1), tXC_LowN(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Carbon concentration, \mumol L^{-1}')
  subplot(2,3,2)
  plot(t, EXN_LowN, 'g', tXN_LowN(:,1), tXN_LowN(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Nitrogen concentration, \mumol L^{-1}')
  title('Low N medium experiment')
  %print -dpng results_Prochlorococcus_marinus_01.png
  subplot(2,3,3)
  plot(t, EXP_LowN, 'g', tXP_LowN(:,1), tXP_LowN(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Phosphorous concentration, \mumol L^{-1}')
  subplot(2,3,4)
  plot(t, V_LowN, 'g', tV_LowN(:,1), tV_LowN(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Biomass, mol L^{-1}')  
  
  figure(3) % figure to show results of uni-variate data for LowP
  subplot(2,3,1)
  plot(t, EXC_LowP, 'g', tXC_LowP(:,1), tXC_LowP(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Carbon concentration, \mumol L^{-1}')
  subplot(2,3,2)
  plot(t, EXN_LowP, 'g', tXN_LowP(:,1), tXN_LowP(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Nitrogen concentration, \mumol L^{-1}')
  title('Low P medium experiment')
%print -dpng results_Prochlorococcus_marinus_01.png
  subplot(2,3,3)
  plot(t, EXP_LowP, 'g', tXP_LowP(:,1), tXP_LowP(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Phosphorous concentration, \mumol L^{-1}')
  subplot(2,3,4)
  plot(t, V_LowP, 'g', tV_LowP(:,1), tV_LowP(:,2), '.r', 'markersize', 20, 'linewidth', 4)
  set(gca, 'Fontsize', 15, 'Box', 'on')
  xlabel('time, days')
  ylabel('Biomass, mol L^{-1}')  
  
%   for i=4:6
%    subplot(3,3,i)
%    plot(Pt, Preserve(:,i-3), 'g','linewidth', 4)
%    set(gca, 'Fontsize', 15, 'Box', 'on')
%    xlabel('time, days')
%    ylabel('Reserve density, mol molM_V^{-1}')
%   end
