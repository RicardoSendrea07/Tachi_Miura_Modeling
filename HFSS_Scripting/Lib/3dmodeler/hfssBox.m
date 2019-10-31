function hfssBox(fid, Name, Start, Size)

%% How to call the function?

% Start: start position of the Box
% Size: length, width and height of the Box

% hfssBox(fid, 'BoxName', [{'(port_x/2)+tap_w'}, {'-Wd/2'}, {'h1+sub_h'}], [{'L1'}, {'Wd'}, {'t'}]);



%% Script
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateBox _\n');

% Box Parameters.
fprintf(fid, 'Array("NAME:BoxParameters", _\n');
fprintf(fid, '"XPosition:=", "%s", _\n', Start{1});
fprintf(fid, '"YPosition:=", "%s", _\n', Start{2});
fprintf(fid, '"ZPosition:=", "%s", _\n', Start{3});
fprintf(fid, '"XSize:=", "%s", _\n', Size{1});
fprintf(fid, '"YSize:=", "%s", _\n', Size{2});
fprintf(fid, '"ZSize:=", "%s"), _\n', Size{3});

% Box Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0.75, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');


end