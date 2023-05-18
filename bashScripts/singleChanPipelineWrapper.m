



%simulated HPC looping input from shell script

%testing: input = 1;


%% file path control 

%local path prefix: 
% prefix = 'R:\MSS\Johnson_Lab\';
%HPC path prefix: 
prefix = '/projects/p31578/';


%% code paths

addpath([prefix 'dtf8829\GitHub\LabMeetingHPCtutorial'])
addpath([prefix 'dtf8829\GitHub\myFrequentUse'])

%% initialize 
%look at how much simpler this is now! no need for that horrible
%getAllDataStruct function. Now all the meta data are already tabulated and
%stowed away in the channel files

datFolder = [prefix '\dtf8829\LABMEETINGDAT\'];
chanFiles = dir(datFolder);
test = cellfun(@(x) length(x)>0, strfind({chanFiles.name}, '.mat'));
chanFiles = chanFiles(test); 


%% down select to current subject

%this section of code isn't strictly necessary for our current purpose, but
%it identifies the subject ID from which the current channel was taken, it
%identifies the index of the current channel within the channel list for
%this subject alone (rather than across ALL channels), and it downselects
%the total list of channels to only those associated with this subject
%this is really useful if you're ever doing measurement between electrodes
%within a subject

curChan = chanFiles(input).name; 
subID = split(curChan, '_'); 
subID = subID{2}; 
test = cellfun(@(x) length(x)>0, strfind({chanFiles.name}, subID)); 
idx = 1:length(chanFiles); 
chanFiles = chanFiles(test);
idx = idx(test); 
curChani = find(idx == input);

%% run the pipeline

disp(['going for ' subID ' ' num2str(curChani)] )
tic
singleChanPipeline(chanFiles, curChani); 
toc

