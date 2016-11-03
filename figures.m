load('for_plots.mat')
[data, auxData, ~, ~, ~] = mydata_Prochlorococcus_marinus;
v2struct(data)
v2struct(auxData)
 
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultTextFontName', 'Times New Roman')

figure
subplot(4,3,1)
title('PRO99 medium experiment')
plot(t, EXC_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXC_pro99(:,1), tXC_pro99(:,2), SD.tXC_pro99, '.k', 'markersize', 16)
axis([0, 25, 0, 5000])
ylabel('Carbon concentration, \mumol L^{-1}')
set(gca,'xticklabel',[])
  
subplot(4,3,2)
title('Low N medium experiment')
plot(t, EXC_LowN, 'k', 'linewidth', .5)
hold on
errorbar(tXC_LowN(:,1), tXC_LowN(:,2), SD.tXC_LowN, '.k', 'markersize', 16)
axis([0, 25, 0, 5000])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
  
subplot(4,3,3)
title('Low P medium experiment')
plot(t, EXC_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXC_pro99(:,1), tXC_pro99(:,2), SD.tXC_pro99, '.k', 'markersize', 16)
axis([0, 25, 0, 5000])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
  
subplot(4,3,4)
plot(t, EXN_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXN_pro99(:,1), tXN_pro99(:,2), SD.tXN_pro99, '.k', 'markersize', 16)
axis([0, 25, 0, 1100])
set(gca,'xticklabel',[])
ylabel('N concentration, \mumol L^{-1}')

subplot(4,3,5)
plot(t, EXN_LowN, 'k', 'linewidth', .5)
hold on
errorbar(tXN_LowN(:,1), tXN_LowN(:,2), SD.tXN_LowN, '.k', 'markersize', 16)
axis([0, 25, 0, 1100])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(4,3,6)
plot(t, EXN_LowP, 'k', 'linewidth', .5)
hold on
errorbar(tXN_LowP(:,1), tXN_LowP(:,2), SD.tXN_LowP, '.k', 'markersize', 16)
axis([0, 25, 0, 1100])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(4,3,7)
plot(t, EXP_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXP_pro99(:,1), tXP_pro99(:,2), SD.tXP_pro99, '.k', 'markersize', 16)
axis([0, 25, 0, 60])
ylabel('P concentration, \mumol L^{-1}')
set(gca,'xticklabel',[])

subplot(4,3,8)
plot(t, EXP_LowN, 'k', 'linewidth', .5)
hold on
errorbar(tXP_LowN(:,1), tXP_LowN(:,2), SD.tXP_LowN, '.k', 'markersize', 16)
axis([0, 25, 0, 60])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(4,3,9)
plot(t, EXP_LowP, 'k', 'linewidth', .5)
hold on
errorbar(tXP_LowP(:,1), tXP_LowP(:,2), SD.tXP_LowP, '.k', 'markersize', 16)
axis([0, 25, 0, 60])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(4,3,10)
plot(t, V_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tV_pro99(:,1), tV_pro99(:,2), SD.tV_pro99, '.k', 'markersize', 16)
axis([0, 25, 0, 1e-3])
xlabel('Time, days')
ylabel('Biomass, mol L^{-1}')  

subplot(4,3,11)
plot(t, V_LowN, 'k', 'linewidth', .5)
hold on
errorbar(tV_LowN(:,1), tV_LowN(:,2), SD.tV_LowN, '.k', 'markersize', 16)
axis([0, 25, 0, 1e-3])
xlabel('Time, days')
set(gca,'yticklabel',[])

subplot(4,3,12)
plot(t, V_LowP, 'k', 'linewidth', .5)
hold on
errorbar(tV_LowP(:,1), tV_LowP(:,2), SD.tV_LowP, '.k', 'markersize', 16)
axis([0, 25, 0, 1e-3])
xlabel('Time, days')
set(gca,'yticklabel',[])

% saveas(h,'Fig2.eps','epsc') 

figure
subplot(2,2,1)
plot(t, Es_MV_Pro99(:,1), 'k', t, Es_MV_LowN(:,1), '-.k', t, Es_MV_LowP(:,1), '--k')
ylabel('C reserve density, mol E_C mol V^{-1}')
axis([0, 25, 0, 1.5])
set(gca,'xticklabel',[])
  
subplot(2,2,2)
plot(t, Es_MV_Pro99(:,2), 'k', t, Es_MV_LowN(:,2), '-.k', t, Es_MV_LowP(:,2), '--k')
ylabel('N reserve density, mol E_N V^{-1}')
axis([0, 25,0, 0.2])
set(gca,'xticklabel',[])

subplot(2,2,3)
plot(t, Es_MV_Pro99(:,3), 'k', t, Es_MV_LowN(:,3), '-.k', t, Es_MV_LowP(:,3), '--k')
xlabel('Time, days')
ylabel('P reserve density, mol E_P V^{-1}')
axis([0, 25, 0, 6e-3])
legend('Pro 99','Low N','Low P')

subplot(2,2,4)
plot(t, Es_MV_Pro99(:,4), 'k', t, Es_MV_LowN(:,4), '-.k', t, Es_MV_LowP(:,4), '--k')
xlabel('Time, days')
ylabel('Structure, mol')
axis([0, 25, 0, 3e-3])

% figure
% subplot(2,1,1)
% plot(t, CtoN_Pro99, 'k', t, CtoN_LowN, '-.k', t, CtoN_LowP, '--k')
% ylabel('N Redfield ratio proportion, -')
% set(gca,'xticklabel',[])
%  
% subplot(2,1,2)
% plot(t, CtoP_Pro99, 'k', t, CtoP_LowN, '-.k', t, CtoP_LowP, '--k')
% xlabel('Time, days')
% ylabel('P Redfield ratio proportion, -')
% legend('Pro 99','Low N','Low P')

figure
subplot(2,1,1)
plot(t, 1./CtoN_Pro99, 'k', t, 1./CtoN_LowN, '-.k', t, 1./CtoN_LowP, '--k')
ylabel('N Redfield ratio proportion, -')
set(gca,'xticklabel',[])
 
subplot(2,1,2)
plot(t, 1./CtoP_Pro99, 'k', t, 1./CtoP_LowN, '-.k', t, 1./CtoP_LowP, '--k')
xlabel('Time, days')
ylabel('P Redfield ratio proportion, -')
legend('Pro 99','Low N','Low P')
  