function [diff_DEB] = ProDEB(t,statVar,pars)

v2struct(pars);

% global source_C source_index 

diff_DEB=statVar;
m_E(1:3)=statVar(1:3); % [C N P] reserves
X(1:3)=statVar(4:6); % [C N P] substrates
M_V=statVar(7); % structure

% calculated rates: growth (r), j_VM, and....
j_E_A(1)=C_assim_1(X(1),j_L,K(1),j_CO2_Am,j_E_Am(1));
j_E_A(2:3)=j_E_Am(2:3).*X(2:3)./(X(2:3)+K(2:3));

% finding r...
fun=@(r) findr(r,pars,m_E); % function
r0=0; %[0 r_max]; % initial point
r=fzero(fun,r0);

% mobilisation rates
j_E_C=m_E*(k_E-r); 
j_E_R=j_E_C-j_E_M-y_E_V*r;

% the differential equatons
diff_DEB(1:3)=j_E_A-j_E_C+kappaE.*j_E_R-r.*m_E;
diff_DEB(4)=-j_E_A(1)+(y_E_V(1)-nV(1,1))*r*M_V; % +(1-kappaE(1))*j_E_R(1), an option to add: -deltaC/tau. that will difference between the actual DIC and DICsat with the exchange time scale for carbon dioxide (=h/Kg or h/Kg DIC/B[?CO?_2^*], sec)
diff_DEB(5)=-j_E_A(2)+(y_E_V(2)-nV(1,4))*r*M_V; % +(1-kappaE(2))*j_E_R(2)
diff_DEB(6)=-j_E_A(3)+(y_E_V(3)-nV(1,5))*r*M_V; % +(1-kappaE(3))*j_E_R(3)
diff_DEB(7)=r*M_V;

% source_index=source_index+1;
% source_C(source_index,1)=(y_E_V(1)-nV(1,1))*r*M_V;
% source_C(source_index,2)=t;

% ===========

% Checking graphs
% figure(2)
% plot(statVar(4),j_E_A(1),'ob')
% hold on