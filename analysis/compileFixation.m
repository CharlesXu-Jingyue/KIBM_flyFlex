%% averageFixation
% Charles Xu @ UCSD, v1, 20221112
% Compile fixation data of one selected condition

%% Import data

clear
formatSpec = '%d %f %f %f\n';
sizeA = [4 Inf];

% User specify
trialLength = 3000; % Max length of trials in 10 ms
trialNumber = 20; % Designed number of trials for each subject
conditionFolder = uigetdir;

sizeTrial = [4 trialLength];
condition = strsplit(conditionFolder, filesep);
condition = string(condition{end});

subject = dir(fullfile(conditionFolder, '20*'));
subjectID = {subject.name};
nSubject = numel(subject);

trialID = repmat(subjectID,2,1);
nTrial = repmat(subjectID,2,1);
rawData = repmat(subjectID,2,1);
rawDataMat = repmat(subjectID,2,1);
% Assemble trialID rawData for each subject
for i = 1:nSubject % For each subject
   iTrial = dir(fullfile(subject(i).folder, subject(i).name, "*.txt"));
   inTrial = numel(iTrial);
   nTrial{2,i} = inTrial;

   iTrialID = {iTrial.name};
   trialID{2,i} = iTrialID;
   
   iTrialDir = fullfile({iTrial.folder}, {iTrial.name});
   
   iTrialData = repmat(iTrialID,2,1);
   [iTrialData{2,:}] = deal(nan(sizeTrial));
   % Assemble iTrialData for each trial
   for f = 1:inTrial % For each trial
      fileID = fopen(iTrialDir{f});
      fFile = fscanf(fileID, formatSpec, sizeA);
      iTrialData{2,f}(1:size(fFile,1),1:size(fFile,2)) = fFile;
   end
   rawData{2,i} = iTrialData;
   
   iTrialDataMat = cat(3,iTrialData{2,1:end});
   rawDataMat{2,i} = iTrialDataMat;
end

%% Compile data to struct

compiledFixation.trialLength = trialLength;
compiledFixation.trialNumber = trialNumber;
compiledFixation.condition = condition;
compiledFixation.subjectID = subjectID;
compiledFixation.nSubject = nSubject;
compiledFixation.trialID = trialID;
compiledFixation.nTrial = nTrial;
compiledFixation.rawData = rawData;
compiledFixation.rawDataMat = rawDataMat;

clearvars -except compiledFixation

args = input('Save data? yes/no (y/n)','s');
if (args == "yes") | (args == 'y') %#ok<OR2>
    save(fullfile(conditionFolder,"compiledFixation_"+condition+".mat"), 'compiledFixation');
end
