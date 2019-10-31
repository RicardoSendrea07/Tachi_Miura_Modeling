% This code creates a simple patch antenna, simulates it, and returns the
% S11 

%% Clean up workspace 
clc;
clear all;
close all;

%% Add paths
% Add the paths to all the needed .m files THERE CANNOT BE ANY SPACES IN
% THE FILE PATHS
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\3dmodeler'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\analysis'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\boundary'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\fieldsCalculator'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\general'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\mesh'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\radiation'); % add manually the API root directory.
addpath('F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Lib\reporter'); % add manually the API root directory.

% HFSS executable path
hfssExePath = 'C:\Program Files\AnsysEM\AnsysEM19.0\Win64\ansysedt.exe';

% Define all the relevent directors 
Dir = pwd; % this is the current working directory in MATLAB 
tmpPrjFile    = [Dir,'\HFSSFiles' '\tmpDipole.aedt']; % create an HFSS project called this
tmpDataFile   = [Dir, '\tmpData']; % export data to this file
hfssScriptFile = [Dir, '\PatchAntenna.vbs']; % generate a vbs script file here
DesignName = 'Patch'; % name the design which will be created in HFSS

%% User defined values for the patch 
L = 23.75; % define the length of the patch in mm 
W = 31.66; % define the width of the patch in mm

SubstrateLW = 62; % define the length and width of the substrate in mm
SubH = 0.76; % define the height of the substrate in mm

PortW = 0.75; % define the width of the lumped port in mm

fc = 3.35 * 10^9; % define the operating freuqency in Hz

fhigh = 4; % define the upper frequency of the frequency sweep 
flow = 3; % define the lower frequency of the freuqency sweep 
nPoints = 401; % define the number of points in the sweep 

%% Create the patch

% Create a new vbs script 
fid = fopen(hfssScriptFile, 'wt'); 

% Create a new HFSS Project and insert a new design
hfssNewProject(fid);
hfssInsertDesign(fid, DesignName); 

% Create the patch.
hfssRectangle(fid, 'Patch', 'z', [-W/2, -L/2, 0], W, L, 'mm'); % W in the X axis and L in the Y axis
hfssSetColor(fid, 'Patch', [255, 128, 0]);
hfssSetTransparency(fid, {'Patch'}, 0);

% Create the substrate below the patch 
hfssBox(fid, 'Substrate', [-SubstrateLW/2, -SubstrateLW/2, 0], [SubstrateLW, SubstrateLW, -SubH], 'mm');
hfssAssignMaterial(fid, 'Substrate', 'Rogers RO3003 (tm)');
hfssSetColor(fid, 'Substrate', [0, 128, 0]);
hfssSetTransparency(fid, {'Substrate'}, 0);

% Create the ground plane below the patch 
hfssRectangle(fid, 'GND', 'z', [-SubstrateLW/2, -SubstrateLW/2, -SubH], SubstrateLW, SubstrateLW, 'mm'); % W in the X axis and L in the Y axis
hfssSetColor(fid, 'GND', [255, 128, 0]);
hfssSetTransparency(fid, {'GND'}, 0);

% Create a rectangle for the lumped port
hfssRectangle(fid, 'Port', 'y', [-PortW/2, L/2, -SubH], SubH, PortW, 'mm'); 
hfssSetColor(fid, 'Port', [0, 255, 0]);
hfssSetTransparency(fid, {'Port'}, 0);

% Assign PEC boundary to patch 
hfssAssignPE(fid, 'PECPatchBoundary', 0, {'Patch'})

% Assign PEC boundary to GND plane 
hfssAssignPE(fid, 'PECGNDBoundary', 0, {'GND'})

% Assign a lumped port
hfssAssignLumpedPort(fid, 'Port1', 'Port', [0, L/2, -SubH], [0, L/2, 0], 'mm', 50, 0)
 
% Construct a radiation box
lambda = (3*10^8)/fc * 10^3;
AirBoxXYZ = SubstrateLW+2*lambda;
 
hfssBox(fid, 'AirBox', [-AirBoxXYZ/2, -AirBoxXYZ/2, -AirBoxXYZ/2], [AirBoxXYZ, AirBoxXYZ, AirBoxXYZ], 'mm');
hfssSetColor(fid, 'AirBox', [0, 255, 255]);
hfssSetTransparency(fid, {'AirBox'}, 0.5);

% Assign a radiation boundary to the radiation box
hfssAssignRadiation(fid, 'RadiationBox', 'AirBox');

% Set up frequency sweep 
hfssInsertSolution(fid, 'Setup1', fhigh);
hfssInterpolatingSweep(fid, 'Sweep1', 'Setup1', flow, fhigh, nPoints);

% Save the project to a temporary file and solve it.
hfssSaveProject(fid, tmpPrjFile, true);
hfssSolveSetup(fid, 'Setup1');

% Create a report of the S11
hfssCreateReport(fid, 'Imaginary Input Impedance', 1, 1, 'Setup1', 'Sweep1', [], 'Sweep', {'Freq'}, {'Freq', 'im(Z(Port1,Port1))'});

% Export the report of S11
hfssExportToFile(fid, 'Imaginary Input Impedance', tmpDataFile, 'csv');

fclose(fid); % close the vbs file 

% Run the generated vbs file
runScript = ['cscript' ' ' hfssScriptFile];
system(runScript);

% Plot the S11
DataFile   = [Dir, '\tmpData' '.csv'];

data = xlsread(DataFile);

plot(data(:,1),data(:,2),'LineWidth',2);
xlabel('Freq (GHz)');
ylabel('S11 (dB)')
grid on;
set(gca,'FontSize', 26);

Fres = min(abs(data(:,2))); % this is the resonant frequency 
% optimization algorithm will minimize the magnitude between the difference
% of this frequency and the desired frequency to achieve resonance at the
% desired freuqency 









