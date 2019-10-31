function hfssAddVariable(fid, variable, value, units)


%% How to call the function?

% units = mm
%   hfssAddVariable(fid, 'dx', '10', 'mm');
% units = um
%   hfssAddVariable(fid, 't', '18', 'um');
% '' is to avoid having units ('mm' or 'um')
%   hfssAddVariable(fid, 'gap_w', '(Wd - 2*W1 - W3)/2', '');

%% Script

fprintf(fid, '\n');

fprintf(fid, 'oDesign.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers",  _\n');
fprintf(fid, '"LocalVariables"), _\n');
fprintf(fid, 'Array("NAME:NewProps", _\n');

fprintf(fid, 'Array("NAME:%s", _\n', variable);
fprintf(fid, '"PropType:=", _\n');
fprintf(fid, '"VariableProp", _\n');
fprintf(fid, '"UserDef:=", _\n');
fprintf(fid, 'true, _\n');
fprintf(fid, '"Value:=", "%s%s"))))\n', value, units);

