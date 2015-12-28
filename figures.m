load('for_plots.mat')
 [data, auxData, metaData, txtData, weights] = mydata_Prochlorococcus_marinus;
 v2struct(data)
 v2struct(auxData)
 
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultTextFontName', 'Times New Roman')

h = figure;
subplot(4,3,1)
title('PRO99 medium experiment')
plot(t, EXC_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXC_pro99(:,1), tXC_pro99(:,2), SD.tXC_pro99, '.k', 'markersize', 16)
xlim([0, 25])
ylabel('Carbon concentration, \mumol L^{-1}')
set(gca,'xticklabel',[])
  
subplot(4,3,2)
title('Low N medium experiment')
plot(t, EXC_LowN, 'k', 'linewidth', .5)
hold on
errorbar(tXC_LowN(:,1), tXC_LowN(:,2), SD.tXC_LowN, '.k', 'markersize', 16)
xlim([0, 25])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
  
subplot(4,3,3)
title('Low P medium experiment')
plot(t, EXC_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXC_pro99(:,1), tXC_pro99(:,2), SD.tXC_pro99, '.k', 'markersize', 16)
xlim([0, 25])
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
  
subplot(4,3,4)
plot(t, EXN_pro99, 'k', 'linewidth', .5)
hold on
errorbar(tXN_pro99(:,1), tXN_pro99(:,2), SD.tXN_pro99, '.k', 'markersize', 16)
axis([0, 25, 0, 1100])
set(gca,'xticklabel',[])
ylabel('Nitrogen concentration, \mumol L^{-1}')

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
ylabel('Phosphate concentration, \mumol L^{-1}')
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
xlabel('time, days')
ylabel('Biomass, mol L^{-1}')  

subplot(4,3,11)
plot(t, V_LowN, 'k', 'linewidth', .5)
hold on
errorbar(tV_LowN(:,1), tV_LowN(:,2), SD.tV_LowN, '.k', 'markersize', 16)
axis([0, 25, 0, 1e-3])
xlabel('time, days')
set(gca,'yticklabel',[])

subplot(4,3,12)
plot(t, V_LowP, 'k', 'linewidth', .5)
hold on
errorbar(tV_LowP(:,1), tV_LowP(:,2), SD.tV_LowP, '.k', 'markersize', 16)
axis([0, 25, 0, 1e-3])
xlabel('time, days')
set(gca,'yticklabel',[])

% saveas(h,Fig2,epsc) 

h2 = figure(2);
figure(4) % figure to show results of uni-variate data for pro99
subplot(2,2,1)
plot(t, Es_MV_Pro99(:,1), 'g', t, Es_MV_LowN(:,1), 'b', t, Es_MV_LowP(:,1), 'k')
ylabel('Carbon density reserve, mol E_C/ mol V')
  
subplot(2,2,2)
plot(t, Es_MV_Pro99(:,2), 'g', t, Es_MV_LowN(:,2), 'b', t, Es_MV_LowP(:,2), 'k')
ylabel('Nitrogen density reserve, mol E_N/ mol V')

subplot(2,2,3)
plot(t, Es_MV_Pro99(:,3), 'g', t, Es_MV_LowN(:,3), 'b', t, Es_MV_LowP(:,3), 'k')
xlabel('time, days')
ylabel('Phosphate density reserve, mol E_P/ mol V')
legend('Pro 99','Low N','Low P')

subplot(2,2,4)
plot(t, Es_MV_Pro99(:,4), 'g', t, Es_MV_LowN(:,4), 'b', t, Es_MV_LowP(:,4), 'k')
xlabel('time, days')
ylabel('Structure, mol')

h3 = figure(3);
subplot(2,1,1)
plot(t, CtoN_Pro99, 'g', t, CtoN_LowN, 'b', t, CtoN_LowP, 'k')
ylabel('Nitrogen Redfield ratio proportion, -')
  
subplot(2,1,2)
plot(t, CtoP_Pro99, 'g', t, CtoP_LowN, 'b', t, CtoP_LowP, 'k')
xlabel('time, days')
ylabel('Phosphate Redfield ratio proportion, -')
legend('Pro 99','Low N','Low P')
  