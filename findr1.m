function  y=findr1(r,par,m_EC,m_EN,m_EP)

v2struct(par)

% mobilisation rates
j_EC_G=m_EC*(k_E-r)-j_EC_M;
j_EN_G=m_EN*(k_E-r)-j_EN_M;
j_EP_G=m_EP*(k_E-r)-j_EP_M;

j_G=1/(sum([y_EC_V/j_EC_G y_EN_V/j_EN_G y_EP_V/j_EP_G])-(sum([j_EC_G/y_EC_V j_EN_G/y_EN_V j_EP_G/y_EP_V]))^-1);
% j_VM=[j_EC_M j_EN_M j_EP_M]-min([m_EC m_EN m_EP]*(k_E-r),[j_EC_M j_EN_M j_EP_M])./[y_EC_V y_EN_V y_EP_V];
j_VM=[j_EC_M-min(m_EC*(k_E-r),j_EC_M)/y_EC_V,j_EN_M-min(m_EN*(k_E-r),j_EN_M)/y_EN_V,j_EP_M-min(m_EP*(k_E-r),j_EP_M)/y_EP_V];
j_VM=max(j_VM);  % or j_VM=sum(j_VM);

y=j_G-j_VM-r;