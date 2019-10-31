function hfssPolyline(fid, Name, Points, Closed, segmentType, Color, Transparency)

%% How to call the function?

% Define the points first (note that the points are also in terms of variables)
    % point1 = [{'port_x/2'}, {'port_y/2'}, {'h1+sub_h'}]; 
    % point2 = [{'(port_x/2)+tap_w'}, {'Wd/2'}, {'h1+sub_h'}];
    % point3 = [{'(port_x/2)+tap_w'}, {'-Wd/2'}, {'h1+sub_h'}];
    % point4 = [{'port_x/2'}, {'-port_y/2'}, {'h1+sub_h'}];
    % point5 = [{'port_x/2'}, {'port_y/2'}, {'h1+sub_h'}];

% Concatenate the points in one array
    % points = [point1;point2;point3;point4;point5];

% Call the function
    % hfssPolyline(fid, 'RightTriangle', points, 'true', 'Line', Orange, 0.25);

%% Script
if (nargin < 5)
    Closed = [];
    segmentType = [];
    Color = [];
    Transparency = [];
elseif (nargin < 6)
    segmentType = [];
    Color = [];
    Transparency = [];
elseif (nargin < 7)
    Color = [];
    Transparency = [];
elseif (nargin < 8)
    Transparency = [];
end

if isempty(Closed)
    Closed = 'false';
end
if isempty(segmentType)
    segmentType = 'Line';
end
if isempty(Color)
    Color = [0, 0, 0];
end
if isempty(Transparency)
    Transparency = 0.8;
end

nPoints = length(Points(:, 1));

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreatePolyline _\n');
fprintf(fid, '\tArray("NAME:PolylineParameters", ');
fprintf(fid, '"IsPolylineCovered:=", true, ');
fprintf(fid, '"IsPolylineClosed:=", %s, _\n', Closed);

% Enter the Points.
fprintf(fid, '\t\tArray("NAME:PolylinePoints", _\n');
for iP = 1:nPoints-1
    fprintf(fid, '\t\t\tArray("NAME:PLPoint", ');
    fprintf(fid, '"X:=", "%s", ', Points{iP, 1});
    fprintf(fid, '"Y:=", "%s", ', Points{iP, 2});
    fprintf(fid, '"Z:=", "%s"), _\n', Points{iP, 3});
end
fprintf(fid, '\t\t\tArray("NAME:PLPoint", ');
fprintf(fid, '"X:=", "%s",   ', Points{nPoints, 1});
fprintf(fid, '"Y:=", "%s",   ', Points{nPoints, 2});
fprintf(fid, '"Z:=", "%s")_\n', Points{nPoints, 3});
fprintf(fid, '\t\t\t), _ \n');

% Create Segments.
fprintf(fid, '\t\tArray("NAME:PolylineSegments", _\n');
for iP = 1:nPoints-2
    fprintf(fid, '\t\t\tArray("NAME:PLSegment", ');
    fprintf(fid, '"SegmentType:=",  "%s", ', segmentType);
    fprintf(fid, '"StartIndex:=", %d, ', iP-1);
    fprintf(fid, '"NoOfPoints:=", 2), _\n');
end
fprintf(fid, '\t\t\tArray("NAME:PLSegment", ');
fprintf(fid, '"SegmentType:=",  "%s", ', segmentType);
fprintf(fid, '"StartIndex:=", %d, ', iP);
fprintf(fid, '"NoOfPoints:=", 2) _\n');
fprintf(fid, '\t\t\t) _\n');
fprintf(fid, '\t\t), _\n');

% Polyline Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(%d %d %d)", _\n', Color(1), Color(2), Color(3));
fprintf(fid, '"Transparency:=", %f, _\n', Transparency);
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');
