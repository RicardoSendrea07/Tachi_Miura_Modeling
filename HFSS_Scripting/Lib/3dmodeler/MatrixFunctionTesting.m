% Points = [-2 -2 -3 -5; 3 -1 -1 3; 0 0 1 2];
% Points = [1/2 1/2 0 0; 0 1 0 1; 0 0 1 1];
Points = [1/8 1/8 0 0; 0 1 0 1; 0 0 1 1];

%Transform this figure by using a Rotation Matrix
%Making rotation matrix using a class
RMatrix1 = RotationMatrix(0,90,90);
Transformation = RMatrix1.doATransformation(1,1,1,Points);

%Now we want to plot it 
axis([-10 10 -10 10 -10 10]); %Set-up axis
grid on
xlabel('X')
ylabel('Y')
zlabel('Z')

%Actual Show
patch(Points(1,:),Points(2,:),Points(3,:),'red'); %Original Points
hold on;
patch(Transformation(1,:),Transformation(2,:),Transformation(3,:),'yellow '); %Plot  Final Transformation

%Use functionToFindTransformation 
[RMatrix, T] = findRotationMatrix(Points, Transformation);

%Check = RMatrix * Points + T;
Check2 = applyTransformation(RMatrix, T, Points);
disp(Transformation);
%disp(Check);
disp(Check2);