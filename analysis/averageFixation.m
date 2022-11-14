%% averageFixation
% Charles Xu @ UCSD, v1, 20221113
% Average across subjects against time for each trial under a selected condition

%% Read in compiled data

clear
[file,path] = uigetfile;
load(fullfile(path,file))

trialLength = compiledFixation.trialLength;
trialNumber = compiledFixation.trialNumber;
nSubject = compiledFixation.nSubject;
rawDataMat = compiledFixation.rawDataMat;

average = zeros(4,trialLength,trialNumber);
error = zeros(4,trialLength,trialNumber);
for i = 1:trialNumber
    iTrialRaw = nan(4,trialLength,nSubject);
    for s = 1:nSubject
        %??
        iTrialRaw(:,:,s) = rawDataMat{2,s}(:,:,i);
    end
    
    iTrialMean = mean(iTrialRaw,3);
    average(:,:,i) = iTrialMean;
    iTrialStd = std(iTrialRaw,0,3);
    error(:,:,i) = iTrialStd;
end

%% Compile data to struct

compiledFixation.average = average;
compiledFixation.error = error;

args = input('Save data? yes/no (y/n)','s');
if (args == "yes") | (args == 'y') %#ok<OR2>
    save(fullfile(path,erase(file,".mat")+"_average.mat"), 'compiledFixation');
end