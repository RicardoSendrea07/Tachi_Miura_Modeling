function hfssRotate(fid, ObjectList, Axis, Angle)

%% How to call the function?
    % hfssRotate(fid, {'Object_Name'}, 'Z', 'angle');

%% Script

	nObjects = length(ObjectList);

	% Preamble.
	fprintf(fid, '\n');
	fprintf(fid, 'oEditor.Rotate _\n');
	fprintf(fid, 'Array("NAME:Selections", _\n');

	% Object Selections.
	fprintf(fid, '"Selections:=", "');
	for iObj = 1:nObjects,
		fprintf(fid, '%s', ObjectList{iObj});
		if (iObj ~= nObjects)
			fprintf(fid, ',');
		end;
	end;
	fprintf(fid, '"), _\n');

	% Transalation Vector.
	fprintf(fid, 'Array("NAME:RotateParameters", _\n');
	fprintf(fid, '"RotateAxis:=", "%s", _\n', upper(Axis));
	fprintf(fid, '"RotateAngle:=", "%s%s%")\n', Angle,"deg");
