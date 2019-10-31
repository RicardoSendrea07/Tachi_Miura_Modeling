function hfssCreateRelativeCSNew(fid, Name, Origin)
	% Create a relative coordinate system "origin" point relative to the
	% Global Coordinate System.
	%
	% Parameters :
	% fid:		file identifier of the HFSS script file.
	% Name:		Name of the relative coordinate system.
	% Origin:	point relative to the Global Coordinate System where the Relative Coordinate System will be created.
	% Units:	units of the points (specify using either 'in', 'mm', 'meter' or anything else defined in HFSS).
	% 
	% @note Use this function to facilitate drawing stuff. To return to use
	% another CS (i.e. the Global CS), you can use the function hfssSetWCS
	%
	% Example :
	% @code
	% fid = fopen('myantenna.vbs', 'wt');
	% ...
	% hfssInsertDesign(fid, 'Dipole_SingleElement');
	% @endcode
	%
	% @author Daniel R. Prado, danysan@gmail.com / drprado@tsc.uniovi.es
	% @date 20 September 2012

	% arguments processor.
	if (nargin < 3)
		error('Insufficient number of arguments !');
	end;

	% Preamble.
	fprintf(fid, '\n');
	fprintf(fid, 'oEditor.CreateRelativeCS _\n');

	% CS Parameters
	fprintf(fid, 'Array("NAME:RelativeCSParameters", _\n');
	fprintf(fid, '"OriginX:=", "%s", _\n', Origin{1});
	fprintf(fid, '"OriginY:=", "%s", _\n', Origin{2});
	fprintf(fid, '"OriginZ:=", "%s", _\n', Origin{3});
	
    fprintf(fid, '"XAxisXvec:=", "0%s", _\n', "mm");
	fprintf(fid, '"XAxisYvec:=", "2*S*3*L %s", _\n', "meter");
	fprintf(fid, '"XAxisZvec:=", "-2*S*3*H %s", _\n', "meter");
	fprintf(fid, '"YAxisXvec:=", "0%s", _\n', "mm");
	fprintf(fid, '"YAxisYvec:=", "1%s", _\n', "mm");
	fprintf(fid, '"YAxisZvec:=", "0%s"), _\n', "mm");
%2*S*3*L*10^3 ,-2*S*3*H*10^3
	% CS Attributes
	fprintf(fid, 'Array("NAME:Attributes", _\n');
	fprintf(fid, '"Name:=", "%s")\n', Name);