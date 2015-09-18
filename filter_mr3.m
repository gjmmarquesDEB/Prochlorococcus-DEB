%% filter_mr3
% filters for allowable parameters of DEB model with 3 reserves

%%
function [filter flag] = filter_mr3(par, chem)
% created 2015/06/19 by Goncalo Marques

%% Syntax
% [filter flag] = <../filter_mr3.m *filter_mr3*> (par, chem)

%% Description
% Checks if parameter values are in the allowable part of the parameter
%    space of DEB model with 3 reserves
% Meant to be run in the estimation procedure
%
% Input
%
% * par: structure with parameters (see below)
% * chem: structure with biochemical parameters
%  
% Output
%
% * filter: 0 for hold, 1 for pass
% * flag: indicator of reason for not passing the filter
%
%     0: parameters pass the filter
%     1: some parameter is negative
%     2: some kappa is larger than 1

%% Remarks
%  The theory behind boundaries is discussed in 
%    <http://www.bio.vu.nl/thb/research/bib/LikaAugu2013.html LikaAugu2013>.


  filter = 0; flag = 0; % default setting of filter and flag
  
  % unpack par, chem
  v2struct(par); v2struct(chem);

  parvec = [K_C; K_N; K_P; j_EC_Am; j_EN_Am; j_EP_Am; y_EC_V; y_EN_V; y_EP_V; j_EC_M; j_EN_M; j_EP_M; kappaEC; kappaEN; kappaEP];
  
  if sum(parvec <= 0) > 0 % all pars must be positive
    flag = 1;
    return;
  end

  parvec = [kappaEC; kappaEN; kappaEP];
  
  if sum(parvec >= 1) > 0 
    flag = 2;
    return;
  end
 
  filter = 1;
