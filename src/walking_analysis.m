% Copyright 2018, All Rights Reserved
% Code by Yuying Liu
%%
clear; close all; clc;
addpath('../DATA/');

load('dataset.mat');
dt = 1/120; T = size(data,2); r = 10;

%% visualize
vis_pts_series(data);

%% First level DMD
% 
[mu,Phi] = dmd(data(:,1:end-1),data(:,2:end),r);
w = log(mu)/dt;
% visualize frequencies
plot(w,'r*','Markersize',12); grid on; axis equal;
title('frequency distribution','Fontsize',16);
pause; close;
% 
[~, order] = sort(abs(w));
mu = mu(order);
w = w(order);
Phi = Phi(:,order);
b = Phi\data(:,1);
Psi = zeros(r,T);
%
for iter = 1:T
    Psi(:,iter) = b.*mu.^(iter-1);
end
% visualize reconstruct
X = Phi(:,1:2)*Psi(1:2,:)+Phi(:,5:6)*Psi(5:6,:);
vis_pts_series(data,X);
save('../DATA/motion.mat','X');

