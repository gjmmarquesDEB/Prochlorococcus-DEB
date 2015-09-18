function TC = tcorr1 (T,T_1,Tpars)
% TC = tcorr (T,T_1,Tpars)
% function tcorr.m called from arrhenius.m
% Last update: 2008/10/28
% Description: auxiliar function used to compute the correction factor Tcorr 
% used in the Arrhenius relantionship. It uses three inputs:
  % T: vector with new temperatures
  % T_1: scalar with reference temperature
  % Tpars: 1-, 3- or 5-vector with temperature parameters:

  T_A = Tpars(1);    % Tcorr calculated with one parameter
  if length(Tpars) == 1
    TC = exp(T_A./T_1 - T_A./T);
  
  elseif length(Tpars) == 3  % Tcorr calculated with three parameters
    T_L = Tpars(2); % Lower temp boundary
    T_AL = Tpars(3); % Arrh. temp for lower boundary
    TC = exp(T_A/ T_1 - T_A./ T) * (1 + exp(T_AL./ T_1 - T_AL/ T_L)) ./ ...
         (1 + exp(T_AL./ T - T_AL/ T_L));
  
  else % Tcorr calculated with five parameters
    T_L = Tpars(2); % Lower temp boundary
    T_H = Tpars(3); % Upper temp boundary
    T_AL = Tpars(4); % Arrh. temp for lower boundary
    T_AH = Tpars(5); % Arrh. temp for upper boundary

    TC = exp(T_A/ T_1 - T_A./ T) * ...
	(1 + exp(T_AL./ T_1 - T_AL/ T_L) + exp(T_AH/ T_H - T_AH./ T_1))./ ...
	(1 + exp(T_AL./ T - T_AL/ T_L) + exp(T_AH/ T_H - T_AH./ T));
  
  end
end
