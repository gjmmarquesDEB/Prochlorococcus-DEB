%% mydata_Prochlorococcus_marinus
% Sets referenced data

%%
function [data, txt_data, metadata] = mydata_Prochlorococcus_marinus 
  % created by Starrlight Augustine, Bas Kooijman, Dina Lika, Goncalo Marques and Laure Pecquerie 2015/03/31
  
  %% Syntax
  % [data, txt_data, metadata] = <../mydata_my_pet.m *mydata_my_pet*>
  
  %% Description
  % Sets data, pseudodata, metadata, explanatory text, weight coefficients.
  % Meant to be a template in add_my_pet
  %
  % Output
  %
  % * data: structure with data
  % * txt_data: text vector for the presentation of results
  % * metadata: structure with info about this entry
  
  %% To do (remove these remarks after editing this file)
  % * copy this template; replace 'my_pet' by the name of your species
  % * fill in metadata fields with the proper information
  % * insert references for the data (an example is given)
  % * edit fact-list for your species, where you can add species and/or data properties
  % * edit real data; remove all data that to not belong to your pet
  % * complete reference list
  % * OPTIONAL : add discussion points / comments before the reference list

%% set metadata

T_C = 273.15; % K, temperature at 0 degrees C (used in T_typical)

metadata.phylum     = 'Cyanobacteria'; 
metadata.class      = 'No_Class_Listed'; 
metadata.order      = 'Prochlorales'; 
metadata.family     = 'Prochlorococcaceae';
metadata.species    = 'Prochlorococcus_marinus'; 
metadata.species_en = 'Prochlorococcus_marinus'; 
metadata.T_typical  = T_C + 24;                     % K
metadata.data_0     = {'r_max';'td';'ssc_before';'ssc_after'};           % tags for different types of zero-variate data
metadata.data_1     = {'tV_pro99','tXC_pro99','tXN_pro99','tXP_pro99','tV_LowP','tV_LowN','tXC_LowP','tXC_LowN','tXN_LowP','tXN_LowN','tXP_LowP','tXP_LowN' }; % tags for different types of uni-variate data

metadata.COMPLETE = 2.5; % using criteria of LikaKear2011   %%%%%there is no value for bacteria.....%%%%%

metadata.author   = {'Michal Grossowicz'};                  % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place 
metadata.date_acc = [2015 06 16];                           % [year month day], date of entry is accepted into collection
metadata.email    = {'micgros@gmail.com'};                  % e-mail of corresponding author
metadata.address  = {'University of Haifa, Israel'};        % affiliation, postcode, country of the corresponding authorxdot9312

% uncomment and fill in the following fields when the entry is updated:
% metadata.author_mod_1  = {'author2'};                       % put names as authors as separate strings:  {'author1','author2'} , with corresponding author in first place 
% metadata.date_mod_1    = [2017 09 18];                      % [year month day], date modified entry is accepted into the collection
% metadata.email_mod_1   = {'myname@myuniv.univ'};            % e-mail of corresponding author
% metadata.address_mod_1 = {'affiliation, zipcode, country'}; % affiliation, postcode, country of the corresponding author

%% set data
% zero-variate data;
% typically depend on scaled functional response f.
% here assumed to be equal for all real data; the value of f is specified in pars_init_Prochlorococcus_marinus.

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
num_cell=[1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27; % d
1754635926.33333,2394074659,3800938268.33333,6268700239.66667,8913236905,12062016467.6667,18656993333.3333,25159459690,42345979906.6667,NaN,NaN,84212049396.6667,99678226233.3333,115853927333.333,125774919633.333,NaN,128245957966.667,140004626933.333,150628522700,NaN,182797495333.333,194309929633.333,196468349666.667,188475845866.667,NaN,NaN,193718057433.333;  % number of cells Pro99
1828618028,2446997656.33333,3761556710.33333,5973119269.33333,8787150556.00000,NaN,19730530976.6667,30485374666.6667,45238369350.0000,NaN,NaN,94656578873.3333,113364980300,105064539230,106869621046.667,NaN,95548373070,83357458866.6667,86170495413.3333,79699554053.3333,NaN,68758067026.6667,55670242706.6667,45490674773.3333,39334444950,32789781543.3333,27733307170; % number of cells LowN
1620361604,2517297619.33333,3669190547,5743513045.33333,8551777213.66667,14097897100,20526110290.0000,30864751766.6667,NaN,NaN,NaN,79596827553.3333,108700047370,119873072400,129545111096.667,135437811333.333,NaN,163467726866.667,160695078233.333,152140636033.333,158249856233.333,152815945500.000,149824798866.667,140130516266.667,NaN,105259762653.333,96666778030]'; % number of cells LowP
% units.num_cell={'days','# L^{-1}'}; label.num_cell={'time','Number of cells per liter'};  bibkey.num_cell='Anon2015';  temp.num_cell=T_C+24;

% Biomass
data.tV_pro99=[num_cell(:,1),num_cell(:,2)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_pro99={'days','mol L^{-1}'}; label.tV_pro99={'time','Biomass in C-moles'};  bibkey.tV_pro99='Anon2015';  temp.tV_pro99=T_C+24;

data.tV_LowN=[num_cell(:,1),num_cell(:,3)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowN={'days','mol L^{-1}'}; label.tV_LowN={'time','Biomass in C-moles'};  bibkey.tV_LowN='Anon2015';  temp.tV_LowN=T_C+24;

data.tV_LowP=[num_cell(:,1),num_cell(:,4)*4.5639e-15]; % q_C = 3.83e-15; % mol cell-1, average C quota, q_N = 6.71e-16; % mol cell-1, average N quota, q_P = 6.29e-17; % mol cell-1, average P quota 4.5639e-15=sum qs
units.tV_LowP={'days','mol L^{-1}'}; label.tV_LowP={'time','Biomass in C-moles'};  bibkey.tV_LowP='Anon2015';  temp.tV_LowP=T_C+24;

nut = [0 2	4	6	8  9 11	13	14	15	16	18	23; % d
800  797.1556  942.9961  910.0131 728.8052  478.8497   811.8588  502.2954  606.8078  557.9294  542.4314  618.7294  491.1686; % ammunium concentration uM
50   43.3333   54.5614   53.1579  41.7544   21.0526    46.1404   29.0058   36.3158   33.1579   31.4035   34.2105   32.2807;
116.572549,98.35294119,117.427450966667,132.329411766667,101.333333346667,58.8130718933333,51.1832679766667,49.8520261433333,18.5976470600000,0,0,0,0;
46.6081871333333,29.7192982466667,41.6491228066667,42.5029239733333,36.92397661,32.7368421033333,33.2397660833333,32.7625730966667,37.9415204666667,24.97076023,35.0292397666667,22.8947368433333,27.1929824566667;
810.666666666667,676.350326766667,909.615686266667,865.5058824,697.8091503,644.1620915,667.2104575,487.9895425,423.6130719,513.819607833333,546.0078431,425.858823533333,442.6875817;
5.8889,4.947368421, 5.47368421033333,5.61403508766667,4.912280702,3.61403508766667,2.947368421,1.06842105233333,0.526315789666667,0,0,0,0]'; % phosphate concentration uM

Carbon=[0 7 13 19;
   2367.9 3193.9 3445.6 3624.2;
   2524,3478.06666666667,3617.5,4252.03333333333;
   2971.7,3500.66666666667,3736.83333333333,2396.43333333333]'; % carbonate system uM

data.tXC_pro99=Carbon(:,[1 2]) ;  units.tXC_pro99 = {'days','\mu mol L^{-1}'};   label.tXC_pro99 = {'time','C concentration'};   bibkey.tXC_pro99 = 'Anon2015';
temp.tXC_pro99 = T_C + 24; 

data.tXC_LowN=Carbon(:,[1 3]) ;  units.tXC_LowN = {'days','\mu mol L^{-1}'};   label.tXC_LowN = {'time','C concentration'};   bibkey.tXC_LowN = 'Anon2015';
temp.tXC_LowN = T_C + 24; 

data.tXC_LowP=Carbon(:,[1 4]) ;  units.tXC_LowP = {'days','\mu mol L^{-1}'};   label.tXC_LowP = {'time','C concentration'};   bibkey.tXC_LowP = 'Anon2015';
temp.tXC_LowP = T_C + 24; 

data.tXN_pro99 = nut(:,[1 2]);     units.tXN_pro99 = {'days','\mu mol L^{-1}'};   label.tXN_pro99 = {'time','N concentration'};   bibkey.tXN_pro99 = 'Anon2015';
temp.tXN_pro99 = T_C + 24; 

data.tXP_pro99 = nut(:,[1 3]);     units.tXP_pro99 = {'days','\mu mol L^{-1}'};   label.tXP_pro99 = {'time','P concentration'};   bibkey.tXP_pro99 = 'Anon2015';
temp.tXP_pro99 = T_C + 24; 

data.tXN_LowN = nut(:,[1 4]);     units.tXN_LowN = {'days','\mu mol L^{-1}'};   label.tXN_LowN = {'time','N concentration'};   bibkey.tXN_LowN = 'Anon2015';
temp.tXN_LowN = T_C + 24; 

data.tXP_LowN = nut(:,[1 5]);     units.tXP_LowN = {'days','\mu mol L^{-1}'};   label.tXP_LowN = {'time','P concentration'};   bibkey.tXP_LowN = 'Anon2015';
temp.tXP_LowN = T_C + 24; 

data.tXN_LowP = nut(:,[1 6]);     units.tXN_LowP = {'days','\mu mol L^{-1}'};   label.tXN_LowP = {'time','N concentration'};   bibkey.tXN_LowP = 'Anon2015';
temp.tXN_LowP = T_C + 24; 

data.tXP_LowP = nut(:,[1 7]);     units.tXP_LowP = {'days','\mu mol L^{-1}'};   label.tXP_LowP = {'time','P concentration'};   bibkey.tXP_LowP = 'Anon2015';
temp.tXP_LowP = T_C + 24; 


%% set weights for all real data
weight = setweights(data, []);

%% overwriting weights (remove these remarks after editing the file)
% the weights were set automatically with the function setweigths,
% if one wants to ovewrite one of the weights it should always present an explanation example:
%
% zero-variate data:
% weight.Wdi = 100 * weight.Wdi; % Much more confidence in the ultimate dry
%                                % weight than the other data points
% uni-variate data: 
% weight.tL = 2 * weight.tL;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weight.psd)
% [data, units, label, weight]=addpseudodata(data, units, label, weight);

%% overwriting pseudodata and respective weights (remove these remarks after editing the file)
% the pseudodata and respective weights were set automatically with the function setpseudodata
% if one wants to ovewrite one of the values it should always present an explanation
% example:
% data.psd.p_M = 1000;                    % my_pet belongs to a group with high somatic maint 
% weight.psd.kap = 10 * weight.psd.kap;   % I need to give this pseudo data a higher weight

%% pack data and txt_data for output
data.weight=weight;
data.temp=temp;
txt_data.units=units;
txt_data.label=label;
txt_data.bibkey=bibkey;

%% References
  bibkey = 'Wiki'; type = 'Misc'; bib = ...
  'URL = {http://en.wikipedia.org/wiki/Prochlorococcus}';   % replace my_pet by latin species name
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
  %
%   bibkey = 'This study'; type = 'Article'; bib =[...
%  'author = {Grossowicz, M., Marques, G., van Voorn, G.A.K.}, ' ... 
%   'year = {2016}, ' ...
%   'title = {Studying nutrient cycles in the oligotrophic ocean through a dynamic energy budget (DEB) model for the marine cyanobacterium Prochlorococcus}, ' ...
%   'journal = {Unpublished}, '...
%   'volume = {}, ' ...
%   'pages = {}'];
%   eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
  %
  bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
  'author = {Kooijman, S.A.L.M.}, ' ...
  'year = {2010}, ' ...
  'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
  'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
  'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
  'URL = {http://www.bio.vu.nl/thb/research/bib/Kooy2010.html}'];
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);
  %
  bibkey = 'Anon2015'; type = 'Misc'; bib = [ ...
  'author = {Anonymous}, ' ...
  'year = {2015}, ' ...
  'URL = {http://www.fishbase.org/summary/Rhincodon-typus.html}'];
  eval(['metadata.biblist.' bibkey, '= ''@', type, '{', bibkey, ', ' bib, '}'';']);

%% Facts
% * Standard model with egg (not foetal) development and no acceleration
  
%% Discussion points
% pt1 = 'Author_mod_1: I found information on the number of eggs per female as a function of length in Anon2013 that was much higher than in Anon2015 but chose to not include it as the temperature was not provided';
% pt2 = 'Author_mod_1: I was surprised to observe that the weight coefficient for ab changed so much the parameter values';     
% metadata.discussion = {pt1; pt2}; 

