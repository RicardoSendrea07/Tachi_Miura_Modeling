%%Clean Project
clc;
clear all;
%% Attempt at creating some matrix and transforming it 

%Points = [0 0 2 2 0 0 2 2; 0 0 0 0 2 2 2 2; 0 2 2 0 0 2 2 0]; %Points of a shape (CUBE)
%Points = [-2 -5 -6; 3 1 3; 0 0 1];
c = length(Points);
%test with plane
%Transform this figure by using a Rotation Matrix
%Making rotation matrix using a class
RMatrix1 = RotationMatrix(30,60,0);
Transformation = RMatrix1.doATransformation(1,2,3,Points); %Apply Rotation then translate points 

%Now we want to plot it 
%Set-up graph
axis([-10 10 -10 10 -10 10]); 
grid on
xlabel('X')
ylabel('Y')
zlabel('Z')

%Actual Fix
patch(Points(1,:),Points(2,:),Points(3,:),'red'); %Original Points
hold on;
patch(Transformation(1,:),Transformation(2,:),Transformation(3,:),'yellow '); %Plot  Final Transformation

%% Use new function to solve R
[RotateMatrix1, T] = findRotationMatrix(Points, Transformation);

%Verify Answer
Check = (RotateMatrix1 * Points) + T;
disp(isequal(Transformation, Check)); %Should return 1, which means they are equal 
disp(Check); 
disp(Transformation);

disp(RotateMatrix1);
disp(RMatrix1.fRotation);

disp(T);