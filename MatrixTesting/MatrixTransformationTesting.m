%%Clean Project
clc;
clear all;
%% Attempt at creating some matrix and transforming it 
Points = [{1,1,0};{-1,1,0};{-1,-1,0};{1,-1,0}]; %Points on a square
c = length(Points);

%Set-up empty X zero vectors
X = zeros(1,c);
Y = zeros(1,c);
Z = zeros(1,c);

%We have a square / 4 vertex shape
%Now we want to plot it 

for i = 1: 1: c
    X(1,i) = cell2mat(Points(i,1));
    Y(1,i) = cell2mat(Points(i,2));
    Z(1,i) = cell2mat(Points(i,3));
end
axis([-3 3 -3 3 -3 3]);
patch(X,Y,Z,'r');

