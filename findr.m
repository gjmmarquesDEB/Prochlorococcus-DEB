function  y=findr(r,pars,m_E)

v2struct(pars)

% mobilisation rates
j_E_G=m_E*(k_E-r)-j_E_M;
j_G=1/(sum(y_E_V./j_E_G)-(sum(j_E_G./y_E_V))^-1);
j_VM=j_E_M-min(m_E*(k_E-r),j_E_M)./y_E_V ;
j_VM=max(j_VM);  % or j_VM=sum(j_VM);

y=j_G-j_VM-r;