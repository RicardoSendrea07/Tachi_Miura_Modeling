function hfssDuplicateAlongLine(fid, ObjectList, dVector, nClones)

%% How to call the function?
    % hfssDuplicateAlongLine(fid,{'Object_Name'},[{'x'}, {'y'}, {'z'}], 20);

%% Script

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.DuplicateAlongLine _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Object Selections.
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects
    fprintf(fid, '%s', ObjectList{iObj});
    if (iObj ~= nObjects)
        fprintf(fid, ',');
    end
end
fprintf(fid, '"), _\n');

% Duplication Vectors.
fprintf(fid, 'Array("NAME:DuplicateToAlongLineParameters", _\n');
fprintf(fid, '"XComponent:=", "%s", _\n', dVector{1});
fprintf(fid, '"YComponent:=", "%s", _\n', dVector{2});
fprintf(fid, '"ZComponent:=", "%s", _\n', dVector{3});
fprintf(fid, '"NumClones:=", %d), _\n', nClones);

% Duplication Boundaries.
fprintf(fid, 'Array("NAME:Options", _\n');
fprintf(fid, '"DuplicateBoundaries:=", true)\n');


end
