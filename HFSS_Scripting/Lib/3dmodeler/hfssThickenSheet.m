function hfssThickenSheet(fid,ObjectList,Thickness)

%% How to call the function?

% assign thickness to one sheet
    % hfssThickenSheet(fid,{'RightTriangle'}, '-t');
% assign thickness to multiple sheets
    % hfssThickenSheet(fid,{'RightTriangle', 'LeftTriangle'}, '-t');

%% Script

	nObjects = length(ObjectList);

	% Preamble.
	fprintf(fid, '\n');
	fprintf(fid, 'oEditor.ThickenSheet _\n');
	fprintf(fid, 'Array("NAME:Selections", _\n');

	% Object Selections.
	fprintf(fid, '"Selections:=", "');
	for iObj = 1:nObjects,
		fprintf(fid, '%s', ObjectList{iObj});
		if (iObj ~= nObjects)
			fprintf(fid, ',');
		end;
	end;
	fprintf(fid, '", _\n');

	% set parameters
	fprintf(fid, '"NewPartsModelFlag:=", _\n');
	fprintf(fid, '"Model"), _\n');
	fprintf(fid, 'Array("NAME:SheetThickenParameters", _\n');
	fprintf(fid, '"Thickness:=", "%s", _\n', Thickness);
	fprintf(fid, '"BothSides:=", false)\n');