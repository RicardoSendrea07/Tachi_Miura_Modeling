%% Lets make a Dipole 
%% Clears Workspace
clc;
clear all;
close all;

%% Setting up directories
%Add paths for MATLAB to HFSS API
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\3dmodeler');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\analysis');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\boundary');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\fieldsCalculator');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\general');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\mesh');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\radiation');
addpath('C:\Users\rsend002\Documents\MATLAB\HFSS_Scripting(NONVARIABLE)\Lib\reporter');
addpath('C:\Users\rsend002\Documents\MATLAB\MatrixTesting');

%HFSS Executable path
hfssExePath = 'C:\Program Files\AnsysEM\AnsysEM19.0\Win64\ansysedt.exe';

%Directors used for working directories
Dir = pwd; %current work space in MATLAB
hfssScriptFile = [Dir, '\Simple_Dipole.vbs']; % generate a vbs script in dir
DesignName = 'Dipole'; % name of the design in HFSS
tmpDataFile   = [Dir, '\tmpData']; % export data to this file
%% Setup Variables - For Muira
% Create a new vbs script 
fid = fopen(hfssScriptFile, 'wt'); 

% Create a new HFSS Project and insert a new design
hfssNewProject(fid);
hfssInsertDesign(fid, DesignName);

%% Variables decide where miura goes  - Original Points on theta 25
a =1;
b =a;
H1 = a*sind(0)*sind(45);
S1 = b*((cosd(0)*tand(45))/(sqrt(1 + cosd(0)^2 * tand(45)^2)));
L1 = a*(sqrt(1 - sind(0)^2 * sind(0)^2));
V1 = b*(1/(sqrt(1 + cosd(0)^2 * tand(45)^2)));

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
Dipole = [-0.005 0.005 0.005 -0.005 -0.005; lamda/4 lamda/4 -lamda/4 -lamda/4 lamda/4; 0 0 0 0 0];

mDipole = applyTransformation(RMatrix, T, Dipole);

hfssPolyline(fid, 'Dipole', transpose(Dipole),'mm');
hfssCoverLines(fid, {'Dipole'});

hfssPolyline(fid, 'Dipole2', transpose(mDipole),'mm');
hfssCoverLines(fid, {'Dipole2'});


%% Finalize File to close
fclose(fid); % close the vbs file 

% Run the generated vbs file
runScript = ['cscript' ' ' hfssScriptFile];
system(runScript);