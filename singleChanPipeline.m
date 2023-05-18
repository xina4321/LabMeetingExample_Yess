function [] = singleChanPipeline(chanFiles, idx)

%% set frequency parameters for the power calculation
frex = logspace(log10(2),log10(80),100);
numfrex = length(frex); 
stds = linspace(2,5,numfrex);



%% load the data


chanDat = load([chanFiles(idx).folder '/' chanFiles(idx).name]).chanDat; 


disp(['data loaded: ' chanDat.subID ' ' num2str(chanDat.chi)])

%% needs time points! hard coded for plotting...ideally, these should have been added in the splitting pipeline

chanDat.enctim = [-1000:3500];
chanDat.retOtim = [-1000:3000];

%% from here, you can really do any analysis you want. 
%our goal is to get time frequency for encoding and retrieval and split it
%into hits/misses

%I've written a chanPower function that requires input in the following
%temp format: 
temp = struct; 
temp.data = chanDat.enc; 
temp.srate = chanDat.fsample; 
pow = chanPower(temp, frex, numfrex, stds); 

%% split pow into subsequent hit and miss trials, take the mean across trials, store the results into chanDat

%your code here
%note: in encoding data col 1 of trial info indicates whether
%indoor/outdoor was correct: 
%1 = correct, use this trial
%2 = incorrect, don't use this trial
%column 2 indicates: 
%1 = subsequent hit
%2 = subsequent miss

%% repeat the process for the retrieval data

% your code here
%note: in retrieval data col 1 of trial info is as follows: 
%1 = hit
%2 = miss
%3 = CR
%4 = FA
%5 = NAN/do not use trial


%% save chanDat over itself to update it with the results of this analysis

%your code here





end