function [] = organizeAndSplitPipeline(subDat, saveFolder, chanFolder)


%% load in the data

% your code here
% load in the encoding and retrieval data using the directory and path
% information available in the subDat struct
% name these variables dat and dat2
% key function: load


%% check that there's an elecpos field available in the dat.elec struct

%your code here
%key function: isfield()
%if there's no elecpos field, is the information contained elsewhere? could
%you make an elecpos field? 




%% get sampling rate and put it into the subDat
%your code here
%find the sampling rate in the data and put it into subDat in a field named
%fsample

%% get the behavioral data and put it into the subDat struct

%your code here
%make sure you grab both the encoding and the retrieval behavioral data
%let's call them encInfo and retInfo




%% get the electrode positions, original labels, and standardized labels

%your code here
%get the electrode positions in 3d coordinates and store into a field of
%subDat called elecpos
%check if any of the coordinates are nan values, note the indices of these
%nan values and store in subDat field called badTrodes
%remove positions from subDat.elecpos that are bad using the indices you
%just found

%get the standardized labels from anatomy notes: 
%the getLabs function can be found in the myFrequentUse github repo
[subDat.labels, subDat.labErrors] = getLabs(dat.elec, subDat.elecNotes);

%% that's it for metadata gathering
%at this point, all metadata have been assembled, we have subject info,
%data file paths, behavioral info, and electrode info

%% save the subject level metadata
%your code here
%use save function to save the subDat struct 
%put it in the folder specified by saveFolder
%determine the file name dynamically so that every subject will have a unique,
%meaningful, and reproducible file name




%% time to deal with the actual data

%% create a channels X trials X time array of data for encoding data only 

%keep in mind that not all data are sampled at 1000 hz, so I'm going to
%suggest resampling to 1000 hz regardless of input: 

trials = dat.trial; 
times = dat.time; 
sampRate = subDat.fsample; 
if sampRate ~= 1000
    %upsample the data
    for tt = 1:length(trials)
            [n,d] = rat(1000 / sampRate);
            test = resample(trials{tt}', n,d);
            upTim = resample(times{tt}, n,d); 
            trials{tt} = test'; 
            times{tt} = upTim; 

    end

end

%now, say you want 1000 ms before and 3500 ms after the image onset for
%encoding
%initialize the array: 
%make it channels X time X trials
encodingData = %make an array of nan to put the data into; your code here

%note, trials are sometimes different lengths, but you'll need to get a standardized
%amount of data, otherwise it won't be possible to make it into an array

%loop over channels and populate your array, make sure you anchor to the
%zero point of the trial in time
for tt = 1:%how many trials are there? your code here
    
    curTrial = trials{tt}; %get the current trial out

    padDat = mirrorPad(curTrial); %pad it with forward and backward reflection, 
    % guarantees that we won't overhang the end of the data

    %% times are in seconds, can you get out the times for this trial and
    %convert to ms? whole numbers only please

    %your code here
    %name your variable curTime

    %% find the index of the onset of the image (index where 0ms happens) and the length of the trial in data points
    %your code here
    %key functions: find, size
    %name your variables onset and L

    %% take out the center chunk of data from padDat that corresponds to your target epoch of 1000ms before to 3500ms after image onset
    %your code here
    %store the data into encodingData
    %consider how long padDat is in units of L? 
    %what is the index of the onset of the image in padDat? 


end

%% can you do the same thing for the retrieval data image onset? 
%This time, get only 3000ms after image onset
%trial lengths are highly variable! this is where the use of padDat really
%shines 
%store into a matrix called retrievalDat

%% exercise for later: can you package all this epoch extraction code into one or more functions in order to make your code cleaner? 

%% now time to save the individual channel data files
%note the major difference that the subDat file included no data
%only put data into channel files, this saves a lot of space

%% loop over channels
for ch = 1: % how many channels are there? your code here

    %% check that this channel isn't a bad channels
    % remember up above where we noted down badTrodes? 
    if %check that it's a good channel
        %% make a struct that has 100% of the information in subDat 
        %your code here
        %hint this is a very simply one line

        %% add in three key pieces of information: raw encoding, raw retrieval, and channel number
        %name these: enc, retOn, and chi
        
        %% save the data, put it into your channel folder
        %make sure that if the channel number is less than 10, then you put
        %two leeding zeros in its file name
        %if it's greater than 9 but less than 100, then put one leeding
        %zero in its file name
        %otherwise no leeding zeros are needed
        %the file name has to be dynamically specified to include the
        %subject ID and the channel number

        %your code here

    end

end

%record that the chan split has been done
subDat.chanSplit = 1; 
%% save subDat again

%your code here






end



