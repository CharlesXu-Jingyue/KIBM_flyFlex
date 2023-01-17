%% averageFixation
% Charles Xu @ UCSD, v1, 20221202
% Plot fixation time across all trials for a selected fly

%% Import data

clear
close all
formatSpec = '%d %f %f %f\n';
sizeA = [4 Inf];

% User specify
foldername = uigetdir;
D = dir(fullfile([foldername filesep 'flycave*vra*.txt']));
tolerance = 45;

%% Plot

fixationTime = zeros(numel(D), 2);

for i = 1:numel(D)
    fileID = fopen(fullfile(foldername, D(i).name), 'r');
    A = fscanf(fileID, formatSpec, sizeA);
    
    ind = find(A(2,:) > 0 & A(3,:) > 0 );
    ind2 = find(A(4,ind) > 180);
    A(4,ind2) = A(4,ind2) - 360.0;
    indFixation = find(A(4,ind) > -tolerance & A(4,ind) < tolerance);
    
    fixationTime(i,1) = numel(indFixation)/100;
    fixationTime(i,2) = numel(indFixation)/numel(ind);
end

figure
hold on
plot(fixationTime(:,1), 'b.', 'MarkerSize',12)
plot(1:2, fixationTime(1:2,1), 'b')
plot(3:16, fixationTime(3:16,1), 'b')
plot(17:20, fixationTime(17:20,1), 'b')
hold off
title("Fixation Time")
xlim([1 20])
ylim([1 30])
xline(2.5,'k--');
xline(16.5,'k--');
xticks([0 5 10 15 20])
xlabel("Trial number")
ylabel("Time (sec)")

figure
hold on
plot(fixationTime(:,2), 'b.', 'MarkerSize',12)
plot(1:2, fixationTime(1:2,2), 'b')
plot(3:16, fixationTime(3:16,2), 'b')
plot(17:20, fixationTime(17:20,2), 'b')
title("Proportion of Fixation Time")
xlim([1 20])
ylim([0 1])
xline(2.5,'k--');
xline(16.5,'k--');
xticks([0 5 10 15 20]);
xlabel("Trial number");
ylabel("Proportion");
hold off
