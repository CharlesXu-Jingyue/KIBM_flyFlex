clear;
%addpath('../figure_tools')

formatSpec = '%d %f %f %f\n';
sizeA = [4 Inf];

[filename, pathname] = uigetfile('*.txt', 'Select a vr angle txt file');
fileID = fopen(fullfile(pathname, filename), 'r');

A = fscanf(fileID, formatSpec, sizeA);
ind = find(A(2,:) > 0 & A(3,:) > 0 );

ind2 = find(A(4,ind) > 180);
A(4,ind2) = A(4,ind2) - 360.0;

figure; plot(A(4, ind), 'b.');
title(filename);

ylim([-180 180]);

yline(-90,'k--');
yline(90,'k--');
yline(0,'k--');

set(gca, 'XTickLabel', [])

xlabel('Time');
ylabel('Bar position');

view([90 90]);

fclose(fileID);