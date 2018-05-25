% Copyright 2018, All Rights Reserved
% Code by Yuying Liu
clear; close all; clc;
addpath('../DATA/');

%% read the data
load('motion.mat');  % X
%X = X_dmd;
T = size(X,2);
dt = 1/120;

%% Animate
figure; grid on; 
hold on; rotate3d on;
view([45,10]);
ax = gca;
ob = Ax3DPose(ax, zeros(18,3));
% set limits
r = 50;
xyz = real(reshape(X,18,3,T));
xmin= min(min(xyz(:,1,:))); 
ymin = min(min(xyz(:,2,:))); 
zmin = min(min(xyz(:,3,:)));
xmax = max(max(xyz(:,1,:))); 
ymax = max(max(xyz(:,2,:))); 
zmax = max(max(xyz(:,3,:)));
%
xlim([-r+xmin, r+xmax]);
ylim([-r+ymin, r+ymax]);
zlim([-r+zmin, r+zmax]);
%

for t = 1:T
    title(sprintf('t=%fs',t*dt),'Fontsize',14);
    ob.update(xyz(:,:,t));
    pause(0.001);
end
close; 



