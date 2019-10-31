function hfssCreateRelativeCS(fid, Name, Origin, Normal, YVector, Units)
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
	if (nargin < 5)
		error('Insufficient number of arguments !');
	end;

	% Preamble.
	fprintf(fid, '\n');
	fprintf(fid, 'oEditor.CreateRelativeCS _\n');

	% CS Parameters
	fprintf(fid, 'Array("NAME:RelativeCSParameters", _\n');
	fprintf(fid, '"OriginX:=", "%.4f%s", _\n', Origin(1), Units);
	fprintf(fid, '"OriginY:=", "%.4f%s", _\n', Origin(2), Units);
	fprintf(fid, '"OriginZ:=", "%.4f%s", _\n', Origin(3), Units);
	fprintf(fid, '"XAxisXvec:=", "%.4f%s", _\n', Normal(1), Units);
	fprintf(fid, '"XAxisYvec:=", "%.4f%s", _\n', Normal(2), Units);
	fprintf(fid, '"XAxisZvec:=", "%.4f%s", _\n', Normal(3), Units);
	fprintf(fid, '"YAxisXvec:=", "%.4f%s", _\n',YVector(1) , Units);
	fprintf(fid, '"YAxisYvec:=", "%.4f%s", _\n',YVector(2) , Units);
	fprintf(fid, '"YAxisZvec:=", "%.4f%s"), _\n',YVector(3) , Units);

	% CS Attributes
	fprintf(fid, 'Array("NAME:Attributes", _\n');
	fprintf(fid, '"Name:=", "%s")\n', Name);