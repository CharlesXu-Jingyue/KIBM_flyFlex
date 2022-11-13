clear;
% addpath('../figure_tools')

formatSpec = '%d %f %f %f\n';
sizeA = [4 Inf];

foldername = uigetdir('C:\Users\dgrover\Desktop');
D = dir(fullfile([foldername filesep 'flycave*vra*.txt']));

for n = 1:numel(D)

    fileID = fopen(fullfile(foldername, D(n).name), 'r');

    A = fscanf(fileID, formatSpec, sizeA);
    ind = find(A(2,:) > 0 & A(3,:) > 0 );

    ind2 = find(A(4,ind) > 180);
    A(4,ind2) = A(4,ind2) - 360.0;

    figure; plot(A(4, ind), 'b.');
    title((D(n).name));

    ylim([-180 180]);
    
    yline(-90,'k--');
    yline(90,'k--');
    %hline(0,'k--');
    
    %set(gca, 'XTickLabel', [])
    xticks([0 500 1000 1500 2000]);
    xticklabels([0 5 10 15 20]);
    
    yticks([-180 -90 0 90 180]);
    
    xlabel('Time (sec)');
    ylabel('Bar position (deg)');
    
    
    view([90 90]);

    fclose(fileID);

end
