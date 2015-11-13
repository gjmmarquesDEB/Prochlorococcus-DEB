function y = findr1(r, p, m_EC, m_EN, m_EP)

% mobilisation rates
j_EC_G = m_EC * (p.k_E - r) - p.j_EC_M;
j_EN_G = m_EN * (p.k_E - r) - p.j_EN_M;
j_EP_G = m_EP * (p.k_E - r) - p.j_EP_M;

j_G = 1/(sum([p.y_EC_V/ j_EC_G, p.y_EN_V/ j_EN_G, p.y_EP_V/ j_EP_G]) - (sum([j_EC_G/ p.y_EC_V, j_EN_G/p.y_EN_V, j_EP_G/ p.y_EP_V]))^-1);
% j_VM=[j_EC_M j_EN_M j_EP_M]-min([m_EC m_EN m_EP]*(k_E-r),[j_EC_M j_EN_M j_EP_M])./[y_EC_V y_EN_V y_EP_V];
j_VM = [p.j_EC_M - min(m_EC * (p.k_E - r), p.j_EC_M)/ p.y_EC_V, p.j_EN_M - min(m_EN * (p.k_E - r), p.j_EN_M)/ p.y_EN_V, p.j_EP_M - min(m_EP * (p.k_E - r), p.j_EP_M)/ p.y_EP_V];
j_VM = max(j_VM);  % or j_VM=sum(j_VM);

y = j_G - j_VM - r;