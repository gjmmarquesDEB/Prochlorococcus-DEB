function [diff_DEB] = ProDEB1(t,statVar,par)

v2struct(par);

% [C N P] substrates
diff_DEB=statVar;
C=statVar(1); % [C N P] substrates
N=statVar(2); % [C N P] substrates
P=statVar(3); % [C N P] substrates
m_EC=statVar(4); % [C N P] reserves
m_EN=statVar(5); % [C N P] reserves
m_EP=statVar(6); % [C N P] reserves
M_V=statVar(7); % structure


I = 20 * exp(- k_ss * M_V) ; % light intensity

% calculated rates: growth (r), j_VM, and....
j_EC_A=C_assim_1(C,alph*I,K_C,j_CO2_Am,j_EC_Am);
j_EN_A=j_EN_Am*N./(N+K_N);
j_EP_A=j_EP_Am*P./(P+K_P);

% finding r...
fun=@(r) findr1(r,par,m_EC,m_EN,m_EP); % function
r0=0; % initial point
r=fzero(fun,r0);


% mobilisation rates
j_EC_C=m_EC*(k_E-r); j_EN_C=m_EN*(k_E-r); j_EP_C=m_EP*(k_E-r); 
j_EC_G = j_EC_C - j_EC_M; j_EN_G = j_EN_C - j_EN_M; j_EP_G = j_EP_C - j_EP_M;
j_VG = 1/(sum([y_EC_V/ j_EC_G, y_EN_V/ j_EN_G, y_EP_V/ j_EP_G]) - (sum([j_EC_G/ y_EC_V, j_EN_G/ y_EN_V, j_EP_G/ y_EP_V]))^-1);
j_EC_R=j_EC_C-j_EC_M-y_EC_V*j_VG; j_EN_R=j_EN_C-j_EN_M-y_EN_V*j_VG; j_EP_R=j_EP_C-j_EP_M-y_EP_V*j_VG;

n_O = [1,        1,   0,   0;  % C/C, equals 1 by definition
           263/106,  2,   4,   0;  % H/C  these values show that we consider dry-mass
          10/106,   1,   0,   4;  % O/C
          16/106,   0,   1,   0;    % N/C
          1/106,    0,   0,   1];
   
% the differential equatons
diff_DEB(1) = 0; 
diff_DEB(2) = (-j_EN_A + (y_EN_V-n_O(4,1))*r + kappaXN * (1-kappaEN)*j_EN_R) * M_V; 
diff_DEB(3) = (-j_EP_A + (y_EP_V-n_O(5,1))*r + kappaXP * (1-kappaEP)*j_EP_R) * M_V; 
diff_DEB(4) = j_EC_A - j_EC_C + kappaEC*j_EC_R - r*m_EC;
diff_DEB(5) = j_EN_A - j_EN_C + kappaEN*j_EN_R - r*m_EN;
diff_DEB(6) = j_EP_A - j_EP_C + kappaEP*j_EP_R - r*m_EP;
diff_DEB(7) = r*M_V; % - 0.1 * 5e4 *max(M_V - 5e-4, 0)^2;

