

% testing: input = 1; 



%% file path control 

%local path prefix: 
% prefix = 'R:\MSS\Johnson_Lab\';
%HPC path prefix: 
prefix = '/projects/p31578/';

%% code paths

addpath([prefix 'dtf8829\GitHub\LabMeetingHPCtutorial'])
addpath([prefix 'dtf8829\GitHub\myFrequentUse'])


%% initialize meta data about target data
task = 'MemDev';
datFolder = [prefix '\DATA\'];
masterSheet = readtable([prefix 'dtf8829\GitHub\LabMeetingHPCtutorial\memDevDat.csv']);

saveFolder = [prefix 'MSS\Johnson_Lab\dtf8829\SUMDAT\']; %this is where you want to save subject level metadata
chanFolder = [prefix 'MSS\Johnson_Lab\dtf8829\LABMEETINGDAT\']; %this is where you want to save channel level physiological data AND metadata

allData = getAllDataStructTut(datFolder, masterSheet, task);

clear masterSheet task datFolder



%% run pipeline


tic
organizeAndSplitPipeline(allData(input), saveFolder, chanFolder);
toc
