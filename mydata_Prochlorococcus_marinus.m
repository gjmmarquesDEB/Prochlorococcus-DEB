%% mydata_Prochlorococcus_marinus
% Sets referenced data

%%
function [data, auxData, metaData, txtData, weights] = mydata_Prochlorococcus_marinus 

%% set metadata

T_C = 273.15; % K, temperature at 0 degrees C (used in T_typical)

metaData.phylum     = 'Cyanobacteria'; 
metaData.class      = 'No_Class_Listed'; 
metaData.order      = 'Prochlorales'; 
metaData.family     = 'Prochlorococcaceae';
metaData.species    = 'Prochlorococcus_marinus'; 
metaData.species_en = 'Prochlorococcus_marinus'; 
metaData.T_typical  = T_C + 24;                     % K
metaData.data_0     = {'r_max';'td';'ssc_before';'ssc_after'};           % tags for different types of zero-variate data
metaData.data_1     = {'tV_pro99','tXC_pro99','tXN_pro99','tXP_pro99','tV_LowP','tV_LowN','tXC_LowP','tXC_LowN','tXN_LowP','tXN_LowN','tXP_LowP','tXP_LowN' }; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011   %%%%%there is no value for bacteria.....%%%%%

metaData.author   = {'Michal Grossowicz'};                  % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place 
metaData.date_acc = [2015 06 16];                           % [year month day], date of entry is accepted into collection
metaData.email    = {'micgros@gmail.com'};                  % e-mail of corresponding author
metaData.address  = {'University of Haifa, Israel'};        % affiliation, postcode, country of the corresponding authorxdot9312


%% set data
% zero-variate data;

% % growth rates
% data.r_max=0.71;   units.r_max='day^{-1}';   label.r_max='maximum growth rate';  bibkey.r_max='Anon2015'; temp.r_max = T_C+22; % Lin et al. 2013
%  
% % division
% data.td=1;     units.td='day^{-1}';    label.td='time of division';  bibkey.td='Anon2015'; temp.td=T_C+22;  
% 
% % cell size before and after split
% data.ssc_before=0.051;   units.ssc_before='SSC';   label.ssc_before='cell size before split';  bibkey.ssc_before='Anon2015'; temp.ssc_before = T_C+22; % Lin et al. 2013
% data.ssc_after=0.0253;   units.ssc_after='SSC';   label.ssc_after='cell size ater split';  bibkey.ssc_after='Anon2015'; temp.ssc_after = T_C+22; % Lin et al. 2013

% uni-variate data
% uni-variate data at f = ? (this value should be added in pars_init_Prochlorococcus_marinus as a parameter f_tL) 

% Cell density
num_cell=[0 1	2	3	4	5	6	7	8	9	10	11	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27; % d
1419426944.00000,1754635926.33333,2394074659.00000,3800938268.33333,6268700239.66667,8913236905.00000,12062016467.6667,18656993333.3333,25159459690.0000,42345979906.6667,54389094740.0000,84212049396.6667,99678226233.3333,115853927333.333,125774919633.333,103610000000.000,128245957966.667,140004626933.333,150628522700.000,181870000000.000,182797495333.333,194309929633.333,196468349666.667,188475845866.667,161970000000.000,184310000000.000,193718057433.333;  % number of cells Pro99
1307055054.00000,1828618028.00000,2446997656.33333,3761556710.33333,5973119269.33333,8787150556.00000,12704000000.0000,19730530976.6667,30485374666.6667,45238369350.0000,70336826860.0000,94656578873.3333,113364980300.000,105064539230.000,106869621046.667,77660181200.0000,95548373070.0000,83357458866.6667,86170495413.3333,79699554053.3333,78872000000.0000,68758067026.6667,55670242706.6667,45490674773.3333,39334444950.0000,32789781543.3333,27733307170.0000; % number of cells LowN
1038100000.00000,1620361604.00000,2517297619.33333,3669190547.00000,5743513045.33333,8551777213.66667,14097897100.0000,20526110290.0000,30864751766.6667,38494966660.0000,48679776050.0000,79596827553.3333,108700047370.000,119873072400.000,129545111096.667,135437811333.333,136480000000.000,163467726866.667,160695078233.333,152140636033.333,158249856233.333,152815945500.000,149824798866.667,140130516266.667,128330000000.000,105259762653.333,96666778030.0000; % number of cells LowP
0,89641529.1290984,220202043.633235,699599460.452502,1196900221.84569,2183902952.80206,2301397877.85983,6177225231.89887,6926488680.51664,9525467328.18216,0,17485147864.4875,15772457945.7664,18126817292.0686,13167617574.6247,15984000000.0000,18752805015.3460,20547219320.5832,25853207092.7839,19892000000.0000,21354899481.6183,11977866677.8219,11023233736.8842,24059989434.8694,5338100000.00000,30379000000.0000,30536110726.2364;
164490563.562652,97258986.6115434,151211060.778527,556398657.948174,704532456.717958,1101392733.72024,1560300000.00000,2355329794.34976,9005408673.97790,8810329518.17906,0,5767713715.04979,3265299402.11872,12622730754.4232,11140939152.7850,0,7123270830.43816,2074242102.48932,10482074115.6434,7947490560.44554,7680400000.00000,8404789891.68722,6292425313.52882,9798274309.74665,6327638781.94501,3559776766.32198,4134571755.78986
264910000,104102438.190575,87376255.4686667,203972694.676025,454018361.757912,1096864643.94959,3146527548.07415,3124489623.76648,6774421510.41991,0,0,1791113235.54939,16017472899.4294,20240214951.6686,27182736395.0399,21250048907.3814,13480000000.0000,8136334018.47599,11223112981.1668,18926361189.5848,10570671813.7392,8498608490.22714,4303696233.65706,10991320060.3561,13358000000.0000,11331446876.9925,33707085930.1974]'; 
% units.num_cell={'days','# L^{-1}'}; label.num_cell={'time','Number of cells per liter'};  bibkey.num_cell='Anon2015';  temp.num_cell=T_C+24;

% Biomass
data.tV_pro99=[num_cell(:,1),num_cell(:,2)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_pro99={'days','mol L^{-1}'}; label.tV_pro99={'time','Biomass in C-moles'};  bibkey.tV_pro99='Anon2015';  temp.tV_pro99=T_C+24;

data.tV_pro99_SD=num_cell(:,5)*4.5639e-15; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_pro99_SD={'mol L^{-1}'}; label.tV_pro99_SD={'Biomass in C-moles'};  bibkey.tV_pro99_SD='Anon2015';  temp.tV_pro99_SD=T_C+24;

data.tV_LowN=[num_cell(:,1),num_cell(:,3)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowN={'days','mol L^{-1}'}; label.tV_LowN={'time','Biomass in C-moles'};  bibkey.tV_LowN='Anon2015';  temp.tV_LowN=T_C+24;

data.tV_LowN_SD=num_cell(:,6)*4.5639e-15; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowN_SD={'mol L^{-1}'}; label.tV_LowN_SD={'Biomass in C-moles'};  bibkey.tV_LowN_SD='Anon2015';  temp.tV_LowN_SD=T_C+24;

data.tV_LowP=[num_cell(:,1),num_cell(:,4)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowP={'days','mol L^{-1}'}; label.tV_LowP={'time','Biomass in C-moles'};  bibkey.tV_LowP='Anon2015';  temp.tV_LowP=T_C+24;

data.tV_LowP_SD=num_cell(:,7)*4.5639e-15; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowP_SD={'mol L^{-1}'}; label.tV_LowP_SD={'Biomass in C-moles'};  bibkey.tV_LowP_SD='Anon2015';  temp.tV_LowP_SD=T_C+24;

% nutrients
nut = [0 2	4	6	8  9 11	13	14	15	16	18	23; % d
800  797.1556  942.9961  910.0131 728.8052  478.8497   811.8588  502.2954  606.8078  557.9294  542.4314  618.7294  491.1686; % ammunium concentration uM
50   43.3333   54.5614   53.1579  41.7544   21.0526    46.1404   29.0058   36.3158   33.1579   31.4035   34.2105   32.2807;
116.572549,98.35294119,117.427450966667,132.329411766667,101.333333346667,58.8130718933333,51.1832679766667,49.8520261433333,18.5976470600000,0,0,0,0;
46.6081871333333,29.7192982466667,41.6491228066667,42.5029239733333,36.92397661,32.7368421033333,33.2397660833333,32.7625730966667,37.9415204666667,24.97076023,35.0292397666667,22.8947368433333,27.1929824566667;
810.666666666667,676.350326766667,909.615686266667,865.5058824,697.8091503,644.1620915,667.2104575,487.9895425,423.6130719,513.819607833333,546.0078431,425.858823533333,442.6875817;
5.8889,4.947368421, 5.47368421033333,5.61403508766667,4.912280702,3.61403508766667,2.947368421,1.06842105233333,0.526315789666667,0,0,0,0; % phosphate concentration uM
46.1771666662871,83.9716344549021,53.2214926551406,101.839320998194,126.735489182494,31.3229621166219,50.0705882500000,121.086600408443,54.0166787595015,103.161184748963,33.8034812014045,104.318834623755,84.3319327074876;
27.9802946970920,10.0184502002258,4.22147698692699,1.89765856793133,11.7373534626076,2.78500138285299,7.66929578945724,11.1818309618392,3.28684104947099,11.2019982347705,2.99275826777030,14.2397360606317,6.43168518797026;
27.3612336878508,29.4380682568888,2.73157454088069,20.6229354748878,21.5579410275525,28.0874619447298,27.9090346544119,43.1817718622328,17.3449605590607,35.6776036619770,0,0,0;
17.5844559563483,10.9677610325073,9.51239654096279,12.2912402568809,7.45367004306671,10.9407874930327,8.42224650243672,16.7208284611603,7.27681852093647,9.39920910612717,6.70426455845110,6.18840842838078,6.27913339289295;
133.882984275665,115.886804568974,112.663554235876,136.469419923859,158.755431211973,206.282182990624,61.9042111423316,110.770128084146,72.8029545380420,66.1727605507434,164.724848198865,85.6878086422880,50.9336143774505;
36.9742214839305,1.06830437535584,0.557000276003652,1.19710330599432,1.35349484349805,0.700876644200650,1.42397360658062,1.28044097310306,0.397359706987060,0,0,0,0.820445119617826]';

Carbon=[0 7 13 19;
   2367.9 3193.9 3445.6 3624.2;
   2524,3478.06666666667,3617.5,4252.03333333333;
   2971.7,3500.66666666667,3736.83333333333,2396.43333333333;
   0  213.5183  184.7214  214.4101;
   0,226.604641023377,223.088704330811,62.8444375687563;
   5.56949485777108e-13,275.737127230508,327.597837803203,246.330354064077]'; % carbonate system uM

data.tXC_pro99=Carbon(:,[1 2]) ;  units.tXC_pro99 = {'days','\mu mol L^{-1}'};   label.tXC_pro99 = {'time','C concentration'};   bibkey.tXC_pro99 = 'Anon2015';
temp.tXC_pro99 = T_C + 24; 

data.tXC_pro99_SD=Carbon(:,5) ;  units.tXC_pro99_SD = {'\mu mol L^{-1}'};   label.tXC_pro99_SD = {'C concentration SD'};   bibkey.tXC_pro99_SD = 'Anon2015';
temp.tXC_pro99_SD = T_C + 24; 

data.tXC_LowN=Carbon(:,[1 3]) ;  units.tXC_LowN = {'days','\mu mol L^{-1}'};   label.tXC_LowN = {'time','C concentration'};   bibkey.tXC_LowN = 'Anon2015';
temp.tXC_LowN = T_C + 24; 

data.tXC_LowN_SD=Carbon(:,6) ;  units.tXC_LowN_SD = {'\mu mol L^{-1}'};   label.tXC_LowN_SD = {'C concentration SD'};   bibkey.tXC_LowN_SD = 'Anon2015';
temp.tXC_LowN_SD = T_C + 24; 

data.tXC_LowP=Carbon(:,[1 4]) ;  units.tXC_LowP = {'days','\mu mol L^{-1}'};   label.tXC_LowP = {'time','C concentration'};   bibkey.tXC_LowP = 'Anon2015';
temp.tXC_LowP = T_C + 24; 

data.tXC_LowP_SD=Carbon(:,7) ;  units.tXC_LowP_SD = {'\mu mol L^{-1}'};   label.tXC_LowP_SD = {'C concentration SD'};   bibkey.tXC_LowP_SD = 'Anon2015';
temp.tXC_LowP_SD = T_C + 24; 

data.tXN_pro99 = nut(:,[1 2]);     units.tXN_pro99 = {'days','\mu mol L^{-1}'};   label.tXN_pro99 = {'time','N concentration'};   bibkey.tXN_pro99 = 'Anon2015';
temp.tXN_pro99 = T_C + 24; 

data.tXN_pro99_SD=nut(:,8) ;  units.tXN_pro99_SD = {'\mu mol L^{-1}'};   label.tXN_pro99_SD = {'N concentration SD'};   bibkey.tXN_pro99_SD = 'Anon2015';
temp.tXN_pro99_SD = T_C + 24; 

data.tXP_pro99 = nut(:,[1 3]);     units.tXP_pro99 = {'days','\mu mol L^{-1}'};   label.tXP_pro99 = {'time','P concentration'};   bibkey.tXP_pro99 = 'Anon2015';
temp.tXP_pro99 = T_C + 24; 

data.tXP_pro99_SD=nut(:,9) ;  units.tXN_pro99_SD = {'\mu mol L^{-1}'};   label.tXN_pro99_SD = {'P concentration SD'};   bibkey.tXN_pro99_SD = 'Anon2015';
temp.tXP_pro99_SD = T_C + 24; 

data.tXN_LowN = nut(:,[1 4]);     units.tXN_LowN = {'days','\mu mol L^{-1}'};   label.tXN_LowN = {'time','N concentration'};   bibkey.tXN_LowN = 'Anon2015';
temp.tXN_LowN = T_C + 24; 

data.tXN_LowN_SD=nut(:,10) ;  units.tXN_LowN_SD = {'\mu mol L^{-1}'};   label.tXN_LowN_SD = {'N concentration SD'};   bibkey.tXN_LowN_SD = 'Anon2015';
temp.tXN_LowN_SD = T_C + 24; 

data.tXP_LowN = nut(:,[1 5]);     units.tXP_LowN = {'days','\mu mol L^{-1}'};   label.tXP_LowN = {'time','P concentration'};   bibkey.tXP_LowN = 'Anon2015';
temp.tXP_LowN = T_C + 24; 

data.tXP_LowN_SD=nut(:,11) ;  units.tXP_LowN_SD = {'\mu mol L^{-1}'};   label.tXP_LowN_SD = {'P concentration SD'};   bibkey.tXP_LowN_SD = 'Anon2015';
temp.tXP_LowN_SD = T_C + 24; 

data.tXN_LowP = nut(:,[1 6]);     units.tXN_LowP = {'days','\mu mol L^{-1}'};   label.tXN_LowP = {'time','N concentration'};   bibkey.tXN_LowP = 'Anon2015';
temp.tXN_LowP = T_C + 24; 

data.tXN_LowP_SD=nut(:,12) ;  units.tXN_LowP_SD = {'\mu mol L^{-1}'};   label.tXN_LowP_SD = {'N concentration SD'};   bibkey.tXN_LowP_SD = 'Anon2015';
temp.tXN_LowP_SD = T_C + 24; 

data.tXP_LowP = nut(:,[1 7]);     units.tXP_LowP = {'days','\mu mol L^{-1}'};   label.tXP_LowP = {'time','P concentration'};   bibkey.tXP_LowP = 'Anon2015';
temp.tXP_LowP = T_C + 24; 

data.tXP_LowP_SD=nut(:,13) ;  units.tXN_LowP_SD = {'\mu mol L^{-1}'};   label.tXN_LowP_SD = {'P concentration SD'};   bibkey.tXN_LowP_SD = 'Anon2015';
temp.tXN_LowP_SD = T_C + 24; 

%% set weights for all real data
weights = setweights(data, []);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
if exist('comment','var')
  txtData.comment = comment;
end

% %% Discussion points
% D1 = 'Author_mod_1: I found information on the number of eggs per female as a function of length in Anon2013 that was much higher than in Anon2015 but chose to not include it as the temperature was not provided';
% % optional bibkey: metaData.bibkey.D1 = 'Anon2013';
% D2 = 'Author_mod_1: I was surprised to observe that the weights coefficient for ab changed so much the parameter values';     
% % optional bibkey: metaData.bibkey.D2 = 'Kooy2010';
% metaData.discussion = struct('D1', D1, 'D2', D2);
% 
% %% Facts
% % list facts: F1, F2, etc.
% % make sure each fact has a corresponding bib key
% % do not put any DEB modelling assumptions here, only relevant information on
% % biology and life-cycles etc.
% F1 = 'The larval stage lasts 202 days and no feeding occurs';
% metaData.bibkey.F1 = 'Wiki'; % optional bibkey
% metaData.facts = struct('F1',F1);

%% References
  bibkey = 'Wiki'; type = 'Misc'; bib = ...
  'URL = {http://en.wikipedia.org/wiki/Prochlorococcus}';   % replace my_pet by latin species name
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
%   bibkey = 'This study'; type = 'Article'; bib =[...
%  'author = {Grossowicz, M., Marques, G., van Voorn, G.A.K.}, ' ... 
%   'year = {2016}, ' ...
%   'title = {Studying nutrient cycles in the oligotrophic ocean through a dynamic energy budget (DEB) model for the marine cyanobacterium Prochlorococcus}, ' ...
%   'journal = {Unpublished}, '...
%   'volume = {}, ' ...
%   'pages = {}'];
%   metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
  'author = {Kooijman, S.A.L.M.}, ' ...
  'year = {2010}, ' ...
  'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
  'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
  'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
  'URL = {http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  %
  bibkey = 'Anon2015'; type = 'Misc'; bib = [ ...
  'author = {Anonymous}, ' ...
  'year = {2015}, ' ...
  'URL = {http://www.fishbase.org/summary/Rhincodon-typus.html}'];
  metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

