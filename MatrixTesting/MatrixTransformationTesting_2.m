%%Clean Project
clc;
clear all;
%% Attempt at creating some matrix and transforming it 
Points = [0 2 2 0; 0 0 2 2; 2 2 2 2;]; %Points of a line
c = length(Points);
%Points2 = [2 6 0; 8 1 0]; %Points of a second line
%Transform this figure by using a Rotation Matrix
% Set thetas here
thetaZ = 60 ; %Z theta
thetaY = 20; %Y theta
thetaX = 90; %X theta

%Making rotation matrix using a class
RMatrix1 = RotationMatrix(thetaX,thetaY,thetaZ);
Transformation = RMatrix1.doATransformation(5,7,1,Points);
%Now we want to plot it 
axis([-10 10 -10 10 -10 10]); %Set-up axis
grid on
xlabel('X')
ylabel('Y')
zlabel('Z')


patch(Points(1,:),Points(2,:),Points(3,:),'red'); %Original Points
hold on;
patch(Transformation(1,:),Transformation(2,:),Transformation(3,:),'yellow '); %Plot  Final Transformation

%% Attempt rotation using Matrix Properties
% OPoints = Points; %Some plane P
% %Get three points of these
% P(:,1) = OPoints(:,1);
% P(:,2) = OPoints(:,2);
% P(:,3) = OPoints(:,3);
% 
% MPoints = Transformation; %Some plane Q
% 
% Q(:,1) = MPoints(:,1);
% Q(:,2) = MPoints(:,2);
% Q(:,3) = MPoints(:,3);

%First find their respective normal vectors
% Ri = (P(:,2)-P(:,1));
% Si = (P(:,2)-P(:,3));
% Normali = cross(Ri,Si);
% 
% Pi = [Ri, Si, Normali];
% 
% Rf = (Q(:,2)-Q(:,1));
% Sf = (Q(:,2)-Q(:,3));
% Normalf = cross(Rf,Sf); 
% 
% Pf = [Rf,Sf,Normalf];

%Get the inverse of P and multiply (from the right) to Q
% RotationMatrix = Q *(P)^-1; 

%% Attempt this by aligning two vectors
%We need normal to be perpendicular to the plane of rotation 
%We fold around one axis X, Y or Z

%Angle = acosd(dot(Normali, Normalf)/(norm(Normali)*norm(Normalf)));


%% Use new function 
RotateMatrix1 = findRotationMatrix(Points, Transformation);
PTest = RotateMatrix1 * Points;