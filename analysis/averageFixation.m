%% averageFixation
% Charles Xu @ UCSD, v1, 20221112
% Average across subjects against time for each trial under a selected condition

%% Import data

clear
formatSpec = '%d %f %f %f\n';
sizeA = [4 Inf];

conditionFolder = uigetdir;
condition = strsplit(conditionFolder, filesep);

subject = dir(fullfile(conditionFolder, '20*'));
subjectID = {subject.name};
nSubject = numel(subject);

trialID = repmat(subjectID,2,1);
rawData = repmat(subjectID,2,1);
% Assemble trialID rawData for each subject
for i = 1:nSubject % For each subject
   iTrial = dir(fullfile(subject(i).folder, subject(i).name, "*.txt"));
   inTrial = numel(iTrial);
   
   iTrialID = {iTrial.name};
   trialID{2,i} = iTrialID;
   
   iTrialDir = fullfile({iTrial.folder}, {iTrial.name});
   
   iTrialData = repmat(iTrialID,2,1);
   % Assemble iTrialData for each trial
   for f = 1:inTrial % For each trial
      fileID = fopen(iTrialDir{f});
      fFile = fscanf(fileID, formatSpec, sizeA);
      iTrialData{2,f} = fFile;
   end
   rawData{2,i} = iTrialData;
end

clearvars -except condition subjectID trialID rawData

%% Average across subjects for each trial

%% Compile data to struct

averagedFixation.condition = condition;
averagedFixation.subjectID = subjectID;
averagedFixation.trialID = trialID;
averagedFixation.rawData = rawData;
averagedFixation.averagedData