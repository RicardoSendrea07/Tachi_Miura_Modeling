# ----------------------------------------------
# Script Recorded by ANSYS Electronics Desktop Version 2018.0.0
# 15:15:37  Jul 24, 2019
# ----------------------------------------------
import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("Project2")
oDesign = oProject.SetActiveDesign("MuiraFold_2")
oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.CreateRelativeCS(
	[
		"NAME:RelativeCSParameters",
		"Mode:="		, "Axis/Position",
		"OriginX:="		, "1.73205080756888mm",
		"OriginY:="		, "1.68252198471217mm",
		"OriginZ:="		, "0.5mm",
		"XAxisXvec:="		, "-0.577350269189626mm",
		"XAxisYvec:="		, "-0.816496580927726mm",
		"XAxisZvec:="		, "0mm",
		"YAxisXvec:="		, "-2.22044604925031e-016mm",
		"YAxisYvec:="		, "0.866025403784438mm",
		"YAxisZvec:="		, "-0.5mm"
	], 
	[
		"NAME:Attributes",
		"Name:="		, "RelativeCS4"
	])
