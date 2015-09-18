function j_EC_A = C_assim_1(X,j_L,K,j_CO2_Am,j_E_Am)

% calculated rates: growth (r), j_VM, and....
j_CO2_A = j_CO2_Am.*X./(X+K);
j_EC_A  = 1./(j_E_Am.^(-1)+j_CO2_A.^(-1)+ j_L^(-1)-(j_CO2_A+j_L).^(-1));



