function hfssDuplicateAroundAxis(fid, ObjectList, Axis, Angle, Number)

%% How to call the function?
    % DuplicateAroundAxis(fid, {'Object_Name'}, 'AxesNameInCaps', 'RotationAngle', NumberOfDuplicates);

%% Script

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.DuplicateAroundAxis _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Object Selections.
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects
    fprintf(fid, '%s', ObjectList{iObj});
    if (iObj ~= nObjects)
        fprintf(fid, ',');
    end
end
fprintf(fid, '", _\n');
fprintf(fid, '"NewPartsModelFlag:=", "Model"), _\n');


fprintf(fid, 'Array("NAME:DuplicateAroundAxisParameters", _\n');
fprintf(fid, '"CreateNewObjects:=", true, _\n');
fprintf(fid, '"WhichAxis:=", "%s", _\n', upper(Axis));
fprintf(fid, '"AngleStr:=", "%s%s",_\n', Angle,"deg");
fprintf(fid, '"NumClones:=", "%f"), _\n', Number);

fprintf(fid, 'Array("NAME:Options", _\n');
fprintf(fid, '"DuplicateAssignments:=", false), _\n');
fprintf(fid, 'Array("CreateGroupsForNewObjects:=", false) _\n');

end


