function hfssDuplicateMirror(fid, ObjectList, Base, Normal)

%% How to call the function?
    % hfssDuplicateMirror(fid, {'Object_Name'}, [{'Bx'}, {'By'}, {'Bz'}], [{'Nx'}, {'Ny'}, {'Nz'}]);

%% Script

nObjects = length(ObjectList);

fprintf(fid, 'oEditor.DuplicateMirror _\n');
fprintf(fid, '\tArray("NAME:Selections", "Selections:=", "');

% Object Selections.
for iObj = 1:nObjects
    fprintf(fid, '%s', ObjectList{iObj});
    if (iObj ~= nObjects)
        fprintf(fid, ',');
    end
end
fprintf(fid, '"), _\n');

fprintf(fid, '\tArray("NAME:DuplicateToMirrorParameters", _\n');
fprintf(fid, '\t\t"DuplicateMirrorBaseX:=",  "%s", _\n', Base{1});
fprintf(fid, '\t\t"DuplicateMirrorBaseY:=", "%s", _\n', Base{2});
fprintf(fid, '\t\t"DuplicateMirrorBaseZ:=", "%s", _\n', Base{3});
fprintf(fid, '\t\t"DuplicateMirrorNormalX:=",  "%s", _\n', Normal{1});
fprintf(fid, '\t\t"DuplicateMirrorNormalY:=", "%s", _\n', Normal{2});
fprintf(fid, '\t\t"DuplicateMirrorNormalZ:=", "%s" _\n', Normal{3});
fprintf(fid, '\t\t), _\n');
fprintf(fid, '\tArray("NAME:Options", "DuplicateBoundaries:=", true) \n\n');
end
