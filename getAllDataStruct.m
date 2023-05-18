function [allData] = getAllDataStruct(datFolder, masterSheet, task)


%% make a directory of all the folders inside the datFolder. These are collection locations

% your code here
% Key function: dir()
% name your directory datDirs

%% initialize variables for looping across the collection location directories

%your code here
%output variable is an empty struct
%need an index variable that keeps track of your index in the output, call
%this si

%% loop on data collection sites
for ii = 1:length(datDirs) %why use ii as iterator variable rather than i? 

    %% make a directory of the subject level folders inside the location folder

    %your code here
    %key function: dir()
    %key idea: dynamic file path creation with the bits available in datDirs
    %name your directory curDir

    
    %% loop on subjects within the current collection site
    for jj = 1: %how to know how many subjects? your code here
        
        %% find subject in masterSheet
        %We are currently examining the jj subject within the ii collection
        %site, but what is the index of this subject in the masterSheet? 

        %your code here
        %look up the subject's index (row number) in the
        %masterSheet
        %name this variable masteri


        %% create directory of tasks done by this particular subject
        % your code here
        % name your directory subDir

        %% check if the subject has done the target task && has ready data
        %if so, then we're going to finally get to add something to the
        %output! 
        if %your code here, need to assess the two conditions linked with && 
            
            %% look up the index of the task within the subject's task directory
            %your code here
            %name this variable ti

            %% make the directory of preprocessed data files for the target task 
            %your code here
            %name this variable taskDir
            
            %% populate the output struct for this participant
            %your code here
            %we want to populate the following fields: 
            %site, subID, dataDir, taskFile1, taskFile2, taskFile3,
            %elecNotes, type, age, sex, datNote, expNote


            %% iterate your output struct index variable
            % si

            

        end % end of if subject has necessary task data and is ready



    end % end of loop on subjects from this collection site

end % end of loop on collection sites


end % end of function

