%% results_my_pet
% presents results of univariate data graphically

%%
function results_Prochlorococcus_marinus(par, metaPar, data, txtData, auxData)
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
  prdData = data;              % copy data to prdData
  t = linspace(0, 25, 100)';    % set independent variable
  prdData.tXC_pro99 = t; 
  prdData.tXN_pro99 = t;
  prdData.tXP_pro99 = t;
  prdData.tV_pro99= t;
  prdData.tXC_LowN = t; 
  prdData.tXN_LowN = t;
  prdData.tXP_LowN = t;
  prdData.tV_LowN= t;
  prdData.tXC_LowP = t; 
  prdData.tXN_LowP = t;
  prdData.tXP_LowP = t;
  prdData.tV_LowP = t;
  
  % overwrite prdData to obtain dependent variables
  prdData = predict_Prochlorococcus_marinus(par, prdData, auxData);
 
  v2struct(data)
  
  % unpack data & predictions
%   Pt       = prdData.nut(:,1); % predictions (dependent variable) first set
%   Pnut     = prdData.nut(:,2:4); % predictions (dependent variable) second set
%   Pbio     = prdData.biomass; 
%   Preserve = prdData.reserve;
  EXC_pro99 = prdData.tXC_pro99;      % predictions (dependent variable) first set
  EXN_pro99 = prdData.tXN_pro99;      % predictions (dependent variable) second set 
  EXP_pro99 = prdData.tXP_pro99;      % predictions (dependent variable) third set
  V_pro99 = prdData.tV_pro99;       % predictions (dependent variable) 7th set
  EXC_LowN = prdData.tXC_LowN;      % predictions (dependent variable) first set
  EXN_LowN = prdData.tXN_LowN;      % predictions (dependent variable) second set 
  EXP_LowN = prdData.tXP_LowN;      % predictions (dependent variable) third set
  V_LowN = prdData.tV_LowN;       % predictions (dependent variable) 7th set
  EXC_LowP = prdData.tXC_LowP;      % predictions (dependent variable) first set
  EXN_LowP = prdData.tXN_LowP;      % predictions (dependent variable) second set 
  EXP_LowP = prdData.tXP_LowP;      % predictions (dependent variable) third set
  V_LowP = prdData.tV_LowP;       % predictions (dependent variable) 7th set

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
