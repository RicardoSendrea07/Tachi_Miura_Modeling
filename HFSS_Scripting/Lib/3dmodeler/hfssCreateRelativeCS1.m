function hfssCreateRelativeCS1(fid, Name, Origin)
%% How to call the function?

% hfssCreateRelativeCS(fid, "Name", [{'-sub_h'}, {'-dy/2'}, {'h1'}]);


%% Script

	% Preamble.
	fprintf(fid, '\n');
	fprintf(fid, 'oEditor.CreateRelativeCS _\n');

	% CS Parameters
	fprintf(fid, 'Array("NAME:RelativeCSParameters", _\n');

	fprintf(fid, '"OriginX:=", "%s", _\n', Origin{1});
	fprintf(fid, '"OriginY:=", "%s", _\n', Origin{2});
	fprintf(fid, '"OriginZ:=", "%s", _\n', Origin{3});
    
    fprintf(fid, '"XAxisXvec:=", "1%s", _\n', "mm");
	fprintf(fid, '"XAxisYvec:=", "0%s", _\n', "mm");
	fprintf(fid, '"XAxisZvec:=", "0%s", _\n', "mm");
	fprintf(fid, '"YAxisXvec:=", "0%s", _\n', "mm");
	fprintf(fid, '"YAxisYvec:=", "1%s", _\n', "mm");
	fprintf(fid, '"YAxisZvec:=", "0%s"), _\n', "mm");

	% CS Attributes
	fprintf(fid, 'Array("NAME:Attributes", _\n');
	fprintf(fid, '"Name:=", "%s")\n', Name);
    
    
end