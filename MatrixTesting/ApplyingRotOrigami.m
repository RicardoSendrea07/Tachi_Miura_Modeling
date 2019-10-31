%% Variables decide where miura goes - Original Points on theta 25
a =1;
b =a;
H1 = a*sind(25)*sind(45);
S1 = b*((cosd(25)*tand(45))/(sqrt(1 + cosd(25)^2 * tand(45)^2)));
L1 = a*(sqrt(1 - sind(25)^2 * sind(45)^2));
V1 = b*(1/(sqrt(1 + cosd(25)^2 * tand(45)^2)));

%% Moved points/ plane on 45
H2 = a*sind(45)*sind(45);
S2 = b*((cosd(45)*tand(45))/(sqrt(1 + cosd(45)^2 * tand(45)^2)));
L2 = a*(sqrt(1 - sind(45)^2 * sind(45)^2));
V2 = b*(1/(sqrt(1 + cosd(45)^2 * tand(45)^2)));

%% Original Points on a plane
Points = [0 S1 S1; L1 L1+V1 2*L1+V1; H1 H1 0];
MovedPoints = [0 S2 S2; L2 L2+V2 2*L2+V2; H2 H2 0];

[RMatrix, T] = findRotationMatrix(Points, MovedPoints);

% Check = applyTransformation(RMatrix, T, Points);
% 
% disp(MovedPoints);
% disp(Check);

%% Make a dipole 
lamda = (3.0*10^8) / (2.54*10^9);
Dipole = [-0.005 0.005 -0.005 0.005; lamda/4 lamda/4 -lamda/4 -lamda/4; 0 0 0 0];

mDipole = applyTransformation(RMatrix, T, Dipole);
disp(Dipole);
disp(mDipole)


