%% Clears Workspace
clc;
clear all;
close all;

%% Setting up directories
%Add paths for MATLAB to HFSS API
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\3dmodeler');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\analysis');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\boundary');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\fieldsCalculator');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\general');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\mesh');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\radiation');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting\Lib\reporter');
addpath('C:\Users\rsend002\Documents\MATLAB\MatrixTesting');
%HFSS Executable path
hfssExePath = 'C:\Program Files\AnsysEM\AnsysEM19.0\Win64\ansysedt.exe';

%Directors used for working directories
Dir = pwd; %current work space in MATLAB
hfssScriptFile = [Dir, '\Muira_2.vbs']; % generate a vbs script in dir
DesignName = 'MuiraFold_2'; % name of the design in HFSS
tmpDataFile   = [Dir, '\tmpData']; % export data to this file
%% Setup Variables - For Muira
% Create a new vbs script 
fid = fopen(hfssScriptFile, 'wt'); 

% Create a new HFSS Project and insert a new design
hfssNewProject(fid);
hfssInsertDesign(fid, DesignName); 

%Make variables H S L V%
%H = height, S = width, L= length, V=arrowLength%
% Length of rhombus- a and b, a = b%
% theta = folding angle, gamma =45%

% double H; double S; double L; double V;
% double a; double b; double V_0;
% double gamma; double theta;
 
hfssAddVariable(fid, 'a', '1', 'mm');
hfssAddVariable(fid, 'b', '1', 'mm');

hfssAddVariable(fid, 'gamma1', '45', 'deg');
hfssAddVariable(fid, 'theta1', '25', 'deg');

hfssAddVariable(fid, 'H', 'a*sin(theta1)*sin(gamma1)', '');
hfssAddVariable(fid,'S','b*((cos(theta1)*tan(gamma1))/(sqrt(1 + cos(theta1)^2 * tan(gamma1)^2)))','');
hfssAddVariable(fid,'L','a*(sqrt(1 - sin(theta1)^2 * sin(gamma1)^2))','');
hfssAddVariable(fid,'V','b*(1/(sqrt(1 + cos(theta1)^2 * tan(gamma1)^2)))','');
hfssAddVariable(fid,'V_0','b*(1/(sqrt(1 + cos(0)^2 * tan(gamma1)^2)))','');
%Needed for a constant V distance for new points, such that they depend on
%one changing V not two
%% Setting up Points
double c2;
c2 = 0;
%Calculate 15 Points, 8 Polygon

Point1 = [{'0'},{'0'},{'0'}];
Point2 = [{'0'},{'L'},{'H'}]; 
%Point3 = [{'0'},{'2*L'},{'0'}];

Point4 = [{'S'},{'V'},{'0'}];
Point5 = [{'S'},{'L+V'},{'H'}];
Point6 = [{'S'},{'2*L+V'},{'0'}];

Point7= [{'2*S'},{'0'},{'0'}];
Point8= [{'2*S'},{'L'},{'H'}];
%Point9= [{'2*S'},{'2*L'},{'0'}];

Point10 = [{'3*S'},{'V'},{'0'}];
Point11 = [{'3*S'},{'L+V'},{'H'}];
Point12 = [{'3*S'},{'2*L+V'},{'0'}];



%Point3 and Point9 must be changed using Unit Vector 
%Calculate Unit Vectors v1, v2 to find missing points
hfssAddVariable(fid,'vector1X','V_0 * (0 - 0)/sqrt((0 - 0)^2+(2*L-L)^2+(0-H)^2)','');
hfssAddVariable(fid,'vector1Y','V_0 * (2*L - L)/sqrt((0 - 0)^2+(2*L-L)^2+(0-H)^2)','');
hfssAddVariable(fid,'vector1Z','V_0 * (0-H)/sqrt((0 - 0)^2+(2*L-L)^2+(0-H)^2)','');

Point3 = [{'0+vector1X'},{'2*L+vector1Y'},{'0+vector1Z'}];
Point9 =[{'2*S+vector1X'},{'2*L+vector1Y'},{'0+vector1Z'}];
% %Point13 and Point14 will be made using a different Unit Vector
%hfssAddVariable(fid,'vector2','V * ((Point4 - Point5)/norm(Point4 - Point5))','');
hfssAddVariable(fid,'vector2X','V_0 * (S - S)/sqrt((S - S)^2+(V-(L+V))^2+(0-H)^2)','');
hfssAddVariable(fid,'vector2Y','V_0 * (V -(L+V))/sqrt((S - S)^2+(V-(L+V))^2+(0-H)^2)','');
hfssAddVariable(fid,'vector2Z','V_0 * (0 - H)/sqrt((S - S)^2+(V-(L+V))^2+(0-H)^2)','');
 
Point13 =[{'S+vector2X'},{'V+vector2Y'},{'0-vector2Z'}];
Point14 =[{'3*S+vector2X'},{'V+vector2Y'},{'0-vector2Z'}];

%%Origin point for new CS, used for transformations
%This point was chosen, such that it is relative to global AND allows for
%proper structure duplication and placement
originPoint = [{'1.5*S'},{'(V+vector2Y)/2'},{'(0-vector2Z)/2'}];
%originPoint = [{'-3*S'},{'0+vector2Y'},{'0-vector2Z'}];
%% Plotting it 
%Rhombuses first
%Face 1
hfssPolyline(fid,"Line_"+c2,[Point1; Point2; Point5; Point4; Point1],'meter');
c2=c2+1;

%Face 2
hfssPolyline(fid,"Line_"+c2,[Point2; Point3;Point6;Point5;Point2],'meter');
c2=c2+1;

%Face 3
hfssPolyline(fid,"Line_"+c2,[Point4; Point5;Point8;Point7;Point4],'meter');
c2=c2+1;

%Face 4
hfssPolyline(fid,"Line_"+c2,[Point5; Point6;Point9;Point8;Point5],'meter');
c2=c2+1;

%Face 5
hfssPolyline(fid,"Line_"+c2,[Point7; Point8;Point11;Point10;Point7],'meter');
c2=c2+1;

%Face 6
hfssPolyline(fid,"Line_"+c2,[Point8; Point9;Point12;Point11;Point8],'meter');
c2=c2+1;

%Triangle 1
hfssPolyline(fid,"Line_"+c2,[Point1; Point13; Point4; Point1],'meter');
c2=c2+1;

%Triangle 2 
hfssPolyline(fid,"Line_"+c2,[Point4; Point13; Point7; Point4],'meter');
c2=c2+1;

%Triangle 3 
hfssPolyline(fid,"Line_"+c2,[Point7; Point14; Point10; Point7],'meter');

%Cover these Faces
Objectlist = [{'Line_0'};{'Line_1'};{'Line_2'};{'Line_3'};{'Line_4'};{'Line_5'};{'Line_6'};{'Line_7'};{'Line_8'}];
hfssCoverLines(fid, Objectlist);

%% Completing the structure
%This is done along the edge of the points, to mirror properly 
%Mirror Along Base P6 to Normal of P5
hfssDuplicateMirror(fid, Objectlist,[{'0+vector1X'},{'2*L+vector1Y'},{'0+vector1Z'}],[{'0'},{'L'},{'-H'}]);
 
%Half of tachi is made - combine all faces 
Objectlist2 = [{'Line_0'};{'Line_0_1'};{'Line_1'};{'Line_1_1'};{'Line_2'};{'Line_2_1'};{'Line_3'};{'Line_3_1'};{'Line_4'};{'Line_4_1'};{'Line_5'};{'Line_5_1'};{'Line_6'};{'Line_6_1'};{'Line_7'};{'Line_7_1'};{'Line_8'};{'Line_8_1'}];
hfssUnite(fid, Objectlist2);

% In order to make the other half, we need to duplicate and rotate the
% figure 180 degrees for the two separate sheets to connect properly

%Use new Origin point to make a CS for duplication/rotation
hfssCreateRelativeCSNew(fid,'New_Origin', originPoint);  

%Use function to duplication and mirror half-tachi, 180 degrees on the
%X-axis, 2 indicates the ammount of copies
hfssDuplicateAroundAxis(fid, {'Line_0'}, 'X', '180', 2);

%% Tachi-Miura Level Extension 
%Unite the two halfs then extend them by one module
hfssUnite(fid, {"Line_0","Line_0_2"});
hfssSetWCS(fid,'Global');
soN = 1;
S = 0;
N = 2; %How many total number of tachi miura levels 
firstObject = {"Line_0"};
secondObject = {"Line_0_3"};
objectList3 = [firstObject; secondObject];
for i = 0:1:N-2
        if(S > 1)
            secondObject = secondObject + "_1";
            soN = soN + 1;
            objectList3 = [objectList3; {secondObject}];
        end
        xPoint = "*-S+(vector1X)";
        xPoint = S + xPoint;
        hfssDuplicateMirror(fid,firstObject,[{xPoint},{'2*L+vector1Y'},{'0+vector1Z'}],[{'-S'},{'0'},{'0'}]);
        firstObject = secondObject;
        S = S + 3;
       
end
%Unite all the Miura Levels
hfssUnite(fid,objectList3);

%% Test Dipole Movement on Tachi
%%Moved points/ plane on 45
a =1;
b =a;
H1 = a*sind(45)*sind(45);
S1 = b*((cosd(45)*tand(45))/(sqrt(1 + cosd(45)^2 * tand(45)^2)));
L1 = a*(sqrt(1 - sind(45)^2 * sind(45)^2));
V1 = b*(1/(sqrt(1 + cosd(45)^2 * tand(45)^2))); 

%%Original Points on a plane
hfssSetWCS(fid, 'Global');

%% Make a dipole 
lamda = 0.22;

%Dipole on the 45 theta 
Dipole = [-0.005 0.005 0.005 -0.005 -0.005; lamda/4 lamda/4 -lamda/4 -lamda/4 lamda/4; 0 0 0 0 0];%Using rotation, move it to the 1 theta
%Move a Dipole to each face inside loop
d = 1; %Dipole Number
for i = 2:-1:-3*N+3
   if(mod(i,2) == 0) %Even faces
       MovedPoints = [i*S1 (i+1)*S1 (i+1)*S1; L1 L1+V1 2*L1+V1; H1 H1 0];
   end
   
   if(mod(i,2) == 1) %Odd faces
       MovedPoints = [(i+1)*S1 i*S1 i*S1; L1 L1+V1 2*L1+V1; H1 H1 0];
   end
   
   %Once we have the plane, we find the transformation
   [RMatrix, T] = findRotationMatrix(Dipole, MovedPoints);
   mDipole = applyTransformation(RMatrix, T, Dipole);
   
   %Find what dipole number its going to be 
   DipoleNumber = "Dipole";
   DipoleNumber = DipoleNumber + d;
   
   %Plot this Dipole
   hfssPolylineNew(fid, DipoleNumber, transpose(mDipole),'mm'); %Dipole at origin
   hfssCoverLines(fid, {DipoleNumber});

   %Move dipole count by one
   d = d+1;
end

% hfssPolylineNew(fid, DipoleNumber, transpose(mDipole),'mm'); %Dipole moved to theta 45
% hfssCoverLines(fid, {DipoleNumber});
%% Finalize File to close
fclose(fid); % close the vbs file 

% Run the generated vbs file
runScript = ['cscript' ' ' hfssScriptFile];
system(runScript);