%PLOT FORCE FIGURE

clear
clc
close all

folders = dir('S*');
folders = folders([folders.isdir]); % 只保留文件夹
folders = folders(~ismember({folders.name}, {'.', '..'})); % 排除. 和..文件夹

% 设置参数
frameRate = 5;  % 每秒帧数
maxDuration = 120; % 最大时间，单位秒
maxFrames = maxDuration * frameRate; % 最大帧数：120秒 * 30帧/秒

% 初始化一个空的矩阵来存储所有force数据
forceData = NaN(length(folders), maxFrames); % 使用NaN填充
timeData = (0:maxFrames-1) / frameRate; % 生成时间轴

% 遍历每个文件夹，加载force.mat
for i = 1:length(folders)
    folderName = folders(i).name;
    matFile = fullfile(folders(i).folder, folderName, 'new_time_force_locomotiondata.mat');
    
    if exist(matFile, 'file')
        % 加载force.mat文件
        data = load(matFile);
        
        % 假设force变量为列向量
        force = data.forceData';
        
        % 如果force信号的帧数大于最大帧数，则截取前maxFrames帧
        % 如果force信号的帧数小于maxFrames，则补充NaN
        if length(force) > maxFrames
            force = force(1:maxFrames);
        elseif length(force) < maxFrames
            force = [force; NaN(maxFrames - length(force), 1)];
        end
        % force=normalize(force);
        % 存储force数据
        forceData(i, :) = force'; % 注意force要转置成行向量
    else
        disp(['警告: ' matFile ' 文件不存在！']);
    end
end

% 绘制二维图
imagesc(timeData, 1:length(folders), forceData);
caxis([0 70]); % 设置颜色条的范围为 0 到 50

colorbar; % 显示颜色条
xlabel('时间 (秒)');
title('力信号的二维图');
colormap jet; % 设置颜色映射（可以根据需要调整）

% 根据需要调整坐标轴的显示范围
axis tight;