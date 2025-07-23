%PLOT FORCE FIGURE
clear
clc
close all

folders = dir('S*');
folders = folders([folders.isdir]); 
folders = folders(~ismember({folders.name}, {'.', '..'})); 


frameRate = 5;  
maxDuration = 120; 
maxFrames = maxDuration * frameRate; 


forceData = NaN(length(folders), maxFrames); 
timeData = (0:maxFrames-1) / frameRate;

for i = 1:length(folders)
    folderName = folders(i).name;
    matFile = fullfile(folders(i).folder, folderName, 'new_time_force_locomotiondata.mat');
    if exist(matFile, 'file')
        data = load(matFile);
        force = data.forceData';
        if length(force) > maxFrames
            force = force(1:maxFrames);
        elseif length(force) < maxFrames
            force = [force; NaN(maxFrames - length(force), 1)];
        end
        forceData(i, :) = force'; 
    else
        disp(['wanrning: ' matFile ' No file！']);
    end
end
imagesc(timeData, 1:length(folders), forceData);
caxis([0 70]);

colorbar; 
xlabel('Time(s)');
title('');
colormap jet; 
axis tight;