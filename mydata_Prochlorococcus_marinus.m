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
metaData.data_1     = {'tV_pro99','tV_pro99_SD','tV_LowP','tV_LowN','tV_LowP_SD','tV_LowN_SD', ...
                       'tXC_pro99','tXN_pro99','tXP_pro99','tXC_pro99_SD','tXN_pro99_SD','tXP_pro99_SD', ...
                       'tXC_LowN','tXN_LowN','tXP_LowN','tXC_LowN_SD','tXN_LowN_SD','tXP_LowN_SD', ... 
                       'tXC_LowP','tXN_LowP','tXP_LowP','tXC_LowP_SD','tXN_LowP_SD','tXP_LowP_SD'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011   %%%%%there is no value for bacteria.....%%%%%

metaData.author   = {'Michal Grossowicz'};                  % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place 
metaData.date_acc = [2015 06 16];                           % [year month day], date of entry is accepted into collection
metaData.email    = {'micgros@gmail.com'};                  % e-mail of corresponding author
metaData.address  = {'University of Haifa, Israel'};        % affiliation, postcode, country of the corresponding authorxdot9312


%% set data
% zero-variate data;

% % growth rates
% data.r_max = 0.71;   units.r_max = 'day^{-1}';   label.r_max = 'maximum growth rate';  bibkey.r_max = 'Anon2015'; temp.r_max = T_C+22; % Lin et al. 2013
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
num_cell = ...
    [0,               1,               2,               3,               4,               5,               6,               7,               8,               9,               12,              13,              14,              15,              16,              17,              18,              19,              20,              21,              22,              23,              24,              25,              26,              27;
     1419426944.00000,1754635926.33333,2394074659.00000,3800938268.33333,6268700239.66667,8913236905.00000,12062016467.6667,18656993333.3333,25159459690.0000,42345979906.6667,84212049396.6667,99678226233.3333,115853927333.333,125774919633.333,NaN,             128245957966.667,140004626933.333,150628522700.000,NaN,             182797495333.333,194309929633.333,196468349666.667,188475845866.667,NaN,             NaN,             193718057433.333; % number of cells Pro99
     1307055054.00000,1828618028.00000,2446997656.33333,3761556710.33333,5973119269.33333,8787150556.00000,NaN,             19730530976.6667,30485374666.6667,45238369350.0000,94656578873.3333,113364980300.000,105064539230.000,106869621046.667,NaN,             95548373070.0000,83357458866.6667,86170495413.3333,79699554053.3333,NaN,             68758067026.6667,55670242706.6667,45490674773.3333,39334444950.0000,32789781543.3333,27733307170.0000; % number of cells LowN
     1307055054.00000,1620361604.00000,2517297619.33333,3669190547.00000,5743513045.33333,8551777213.66667,14097897100.0000,20526110290.0000,30864751766.6667,NaN,             79596827553.3333,108700047370.000,119873072400.000,129545111096.667,135437811333.333,NaN,             163467726866.667,160695078233.333,152140636033.333,158249856233.333,152815945500.000,149824798866.667,140130516266.667,NaN,             105259762653.333,96666778030.0000; % number of cells LowP
     0,               89641529.1290,   220202043.6332,  699599460.452502,1196900221.84569,2183902952.80206,2301397877.85983,6177225231.89887,6926488680.51664,9525467328.18216,17485147864.4875,15772457945.7664,18126817292.0686,13167617574.6247,NaN,             18752805015.3460,20547219320.5832,25853207092.7839,NaN,             21354899481.6183,11977866677.8219,11023233736.8842,24059989434.8694,NaN,             NaN,             30536110726.2364; % SD of cells Pro99
     164490563.562652,97258986.6115434,151211060.778527,556398657.948174,704532456.717958,1101392733.72024,NaN,             2355329794.34976,9005408673.97790,8810329518.17906,5767713715.04979,3265299402.11872,12622730754.4232,11140939152.7850,NaN,             7123270830.43816,2074242102.48932,10482074115.6434,7947490560.44554,NaN,             8404789891.68722,6292425313.52882,9798274309.74665,6327638781.94501,3559776766.32198,4134571755.78986; % SD of cells LowN
     264910000.000000,104102438.190575,87376255.4686667,203972694.676025,454018361.757912,1096864643.94959,3146527548.07415,3124489623.76648,6774421510.41991,NaN,             1791113235.54939,16017472899.4294,20240214951.6686,27182736395.0399,21250048907.3814,NaN,             8136334018.47599,11223112981.1668,18926361189.5848,10570671813.7392,8498608490.22714,4303696233.65706,10991320060.3561,NaN,             11331446876.9925,33707085930.1974  % SD of cells LowP
    ]';

% units.num_cell={'days','# L^{-1}'}; label.num_cell={'time','Number of cells per liter'};  bibkey.num_cell='Anon2015';  temp.num_cell=T_C+24;

% Biomass
data.tV_pro99=[num_cell(:,1),num_cell(:,2)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_pro99={'days','mol L^{-1}'}; label.tV_pro99={'time','Biomass in C-moles'};  bibkey.tV_pro99='Anon2015';  temp.tV_pro99=T_C+24;

SD.tV_pro99 = num_cell(:,5)*4.5639e-15; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.SD.tV_pro99 = {'mol L^{-1}'}; label.SD.tV_pro99 = {'Biomass in C-moles'};  bibkey.SD.tV_pro99 = 'Anon2015';  temp.SD.tV_pro99 = T_C+24;

data.tV_LowN=[num_cell(:,1),num_cell(:,3)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowN={'days','mol L^{-1}'}; label.tV_LowN={'time','Biomass in C-moles'};  bibkey.tV_LowN='Anon2015';  temp.tV_LowN=T_C+24;

SD.tV_LowN = num_cell(:,6)*4.5639e-15; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.SD.tV_LowN = {'mol L^{-1}'}; label.SD.tV_LowN = {'Biomass in C-moles'};  bibkey.SD.tV_LowN = 'Anon2015';  temp.SD.tV_LowN = T_C+24;

data.tV_LowP=[num_cell(:,1),num_cell(:,4)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowP={'days','mol L^{-1}'}; label.tV_LowP={'time','Biomass in C-moles'};  bibkey.tV_LowP='Anon2015';  temp.tV_LowP=T_C+24;

SD.tV_LowP = num_cell(:,7)*4.5639e-15; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.SD.tV_LowP = {'mol L^{-1}'}; label.SD.tV_LowP = {'Biomass in C-moles'};  bibkey.SD.tV_LowP = 'Anon2015';  temp.SD.tV_LowP = T_C+24;

% nutrients
nut = [0         2	       4	     6	       8         9         12	     13	       14	     15	       16	     18	       23; % d
       880.2091, 797.1555, 942.9960, 910.0130, 728.8052, 478.8496, 811.8588, 502.2954, 606.8078, 557.9294, 542.4313, 618.7294, 491.1686; % ammunium concentration uM Pro99
       37.6842,  43.3333,  54.5614,  53.1578,  41.7543,  21.05263, 46.1403,  29.0058,  36.3157,  33.1578,  31.4035,  34.2105,  32.2807; % phosphate concentration uM Pro99
       186.5725, 98.3529,  117.4274, 132.3294, 101.3333, 58.8130,  51.1832,  49.8520,  18.5976,  55.4412,  0,        NaN,      0; % ammunium concentration uM LowN
       46.6081,  29.7192,  41.6491,  42.50292, 36.9239,  32.7368,  33.2397,  32.7625,  37.9415,  24.9707,  35.0292,  22.8947,  27.1929; % phosphate concentration uM LowN
       810.666,  676.3503, 909.6156, 865.5058, 697.8091, 644.1620, 667.2104, 487.9895, 423.6130, 513.8196, 546.0078, 425.8588, 442.6875; % ammunium concentration uM Low P
       47.1111,  4.9473,   5.4736,   5.6140,   4.9122,   3.6140,   2.9473,   1.0684,   0.5263,   0,        0,        0,        0.4736; % phosphate concentration uM Low P
       46.1771,  83.9716,  53.2214,  101.8393, 126.7354, 31.3229,  50.0705,  121.0866, 54.0166,  103.1611, 33.8034,  104.3188, 84.3319; % ammunium SD uM Pro99
       27.9802   10.0184   4.2214    1.8976    11.7373   2.7850    7.6692    11.1818   3.2868    11.2019   2.9927    14.2397   6.4316; % phosphate SD uM Pro99
       27.3612   29.4380   2.7315    20.6229   21.5579   28.0874   27.9090   43.1817   17.3449   35.6776   0,        NaN       0; % ammunium SD uM Low N
       17.5844   10.9677   9.5123    12.2912   7.4536    10.9407   8.4222    16.7208   7.2768    9.3992    6.7042    6.1884    6.27913339289295; % phosphate SD uM Low N
       133.8829  115.8868  112.6635  136.4694  158.7554  206.2821  61.9042   110.770   72.8029   66.1727   164.7248  85.6878   50.9336; % ammunium SD uM Low P
       36.9742   1.0683    0.5570    1.1971    1.3534    0.7008    1.4239    1.2804    0.3973    0         0         0         0.8204]'; % phosphate SD uM Low P

Carbon = [0         7                13               19;
          2367.9    3193.9           3445.6           3624.2; % Pro99
          2524      3478.06666666667 3617.5           4252.03333333333; % Low N
          2971.7    3500.66666666667 3736.83333333333 2396.43333333333; % Low P
          0         213.5183         184.7214         214.4101; % Pro99 SD
          0         226.604641023377 223.088704330811 62.8444375687563; % Low N SD
          5.569e-13 275.737127230508 327.597837803203 246.330354064077]'; % Low P SD, carbonate system uM

data.tXC_pro99=Carbon(:,[1 2]) ;  units.tXC_pro99 = {'days','\mu mol L^{-1}'};   label.tXC_pro99 = {'time','C concentration'};   bibkey.tXC_pro99 = 'Anon2015';
temp.tXC_pro99 = T_C + 24; 

SD.tXC_pro99 = Carbon(:,5);  units.SD.tXC_pro99 = {'\mu mol L^{-1}'}; label.SD.tXC_pro99 = {'C concentration SD'};  bibkey.SD.tXC_pro99 = 'Anon2015';  
temp.SD.tXC_pro99 = T_C+24;

data.tXC_LowN=Carbon(:,[1 3]) ;  units.tXC_LowN = {'days','\mu mol L^{-1}'};   label.tXC_LowN = {'time','C concentration'};   bibkey.tXC_LowN = 'Anon2015';
temp.tXC_LowN = T_C + 24; 

SD.tXC_LowN = Carbon(:,6);  units.SD.tXC_LowN = {'\mu mol L^{-1}'}; label.SD.tXC_LowN = {'C concentration SD'};  bibkey.SD.tXC_LowN = 'Anon2015';  
temp.SD.tXC_LowN = T_C+24;

data.tXC_LowP=Carbon(:,[1 4]) ;  units.tXC_LowP = {'days','\mu mol L^{-1}'};   label.tXC_LowP = {'time','C concentration'};   bibkey.tXC_LowP = 'Anon2015';
temp.tXC_LowP = T_C + 24; 

SD.tXC_LowP = Carbon(:,7);  units.SD.tXC_LowP = {'\mu mol L^{-1}'}; label.SD.tXC_LowP = {'C concentration SD'};  bibkey.SD.tXC_LowP = 'Anon2015';  
temp.SD.tXC_LowP = T_C+24;

data.tXN_pro99 = nut(:,[1 2]);     units.tXN_pro99 = {'days','\mu mol L^{-1}'};   label.tXN_pro99 = {'time','N concentration'};   bibkey.tXN_pro99 = 'Anon2015';
temp.tXN_pro99 = T_C + 24; 

SD.tXN_pro99 = nut(:,8);  units.SD.tXN_pro99 = {'\mu mol L^{-1}'}; label.SD.tXN_pro99 = {'N concentration SD'};  bibkey.SD.tXN_pro99 = 'Anon2015';  
temp.SD.tXN_pro99 = T_C+24;

data.tXP_pro99 = nut(:,[1 3]);     units.tXP_pro99 = {'days','\mu mol L^{-1}'};   label.tXP_pro99 = {'time','P concentration'};   bibkey.tXP_pro99 = 'Anon2015';
temp.tXP_pro99 = T_C + 24; 

SD.tXP_pro99 = nut(:,9);  units.SD.tXP_pro99 = {'\mu mol L^{-1}'}; label.SD.tXP_pro99 = {'P concentration SD'};  bibkey.SD.tXP_pro99 = 'Anon2015';  
temp.SP.tXN_pro99 = T_C+24;

data.tXN_LowN = nut(:,[1 4]);     units.tXN_LowN = {'days','\mu mol L^{-1}'};   label.tXN_LowN = {'time','N concentration'};   bibkey.tXN_LowN = 'Anon2015';
temp.tXN_LowN = T_C + 24; 

SD.tXN_LowN = nut(:,10);  units.SD.tXN_LowN = {'\mu mol L^{-1}'}; label.SD.tXN_LowN = {'N concentration SD'};  bibkey.SD.tXN_LowN = 'Anon2015';  
temp.SD.tXN_LowN = T_C+24;

data.tXP_LowN = nut(:,[1 5]);     units.tXP_LowN = {'days','\mu mol L^{-1}'};   label.tXP_LowN = {'time','P concentration'};   bibkey.tXP_LowN = 'Anon2015';
temp.tXP_LowN = T_C + 24; 

SD.tXP_LowN = nut(:,11);  units.SD.tXP_LowN = {'\mu mol L^{-1}'}; label.SD.tXP_LowN = {'P concentration SD'};  bibkey.SD.tXP_LowN = 'Anon2015';  
temp.SP.tXN_LowN = T_C+24;

data.tXN_LowP = nut(:,[1 6]);     units.tXN_LowP = {'days','\mu mol L^{-1}'};   label.tXN_LowP = {'time','N concentration'};   bibkey.tXN_LowP = 'Anon2015';
temp.tXN_LowP = T_C + 24; 

SD.tXN_LowP = nut(:,12);  units.SD.tXN_LowP = {'\mu mol L^{-1}'}; label.SD.tXN_LowP = {'N concentration SD'};  bibkey.SD.tXN_LowP = 'Anon2015';  
temp.SD.tXN_LowP = T_C+24;

data.tXP_LowP = nut(:,[1 7]);     units.tXP_LowP = {'days','\mu mol L^{-1}'};   label.tXP_LowP = {'time','P concentration'};   bibkey.tXP_LowP = 'Anon2015';
temp.tXP_LowP = T_C + 24; 

SD.tXP_LowP = nut(:,13);  units.SD.tXP_LowP = {'\mu mol L^{-1}'}; label.SD.tXP_LowP = {'P concentration SD'};  bibkey.SD.tXP_LowP = 'Anon2015';  
temp.SP.tXN_LowP = T_C+24;

%% set weights for all real data
weights = setweights(data, []);
weights.tV_pro99 = weights.tV_pro99 * 100;
weights.tV_LowN  = weights.tV_LowN  * 100;
weights.tV_LowP  = weights.tV_LowP  * 100;

%% pack auxData and txtData for output
auxData.temp = temp; auxData.SD = SD;
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

