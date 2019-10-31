function hfssRectangle(fid, Name, Axis, Start, Size)

%% How to call the function?
% Start: start position of the rectangle 
% Size: length and width of the rectangle

%   hfssRectangle(fid, 'Ground', 'z', [{'-dx/2'}, {'-dy/2'}, {'0'}], [{'dx'}, {'dy'}]);

%% Script
	Transparency = 0.75;

	% Preamble.
	fprintf(fid, '\n');
	fprintf(fid, 'oEditor.CreateRectangle _\n');

	% Rectangle Parameters.
	fprintf(fid, 'Array("NAME:RectangleParameters", _\n');
	fprintf(fid, '"IsCovered:=", true, _\n');
    
    fprintf(fid, '"XStart:=", "%s", _\n', Start{1});
	fprintf(fid, '"YStart:=", "%s", _\n', Start{2});
	fprintf(fid, '"ZStart:=", "%s", _\n', Start{3});
    
	fprintf(fid, '"Width:=", "%s", _\n', Size{1});
	fprintf(fid, '"Height:=", "%s", _\n', Size{2});

	fprintf(fid, '"WhichAxis:=", "%s"), _\n', upper(Axis));

	% Rectangle Attributes.
	fprintf(fid, 'Array("NAME:Attributes", _\n');
	fprintf(fid, '"Name:=", "%s", _\n', Name);
	fprintf(fid, '"Flags:=", "", _\n');
	fprintf(fid, '"Color:=", "(132 132 193)", _\n');
	fprintf(fid, '"Transparency:=", %d, _\n', Transparency);
	fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
	fprintf(fid, '"MaterialName:=", "vacuum", _\n');
	fprintf(fid, '"SolveInside:=", true)\n');
