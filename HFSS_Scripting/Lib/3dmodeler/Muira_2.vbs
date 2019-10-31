Dim oHfssApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule

Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oHfssApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject
Set oProject = oDesktop.GetActiveProject

oProject.InsertDesign "HFSS", "MuiraFold_2", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("MuiraFold_2")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:a", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "1mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:b", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "1mm"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:gamma1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "45deg"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:theta1", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "25deg"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:H", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "a*sin(theta1)*sin(gamma1)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:S", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "b*((cos(theta1)*tan(gamma1))/(sqrt(1 + cos(theta1)^2 * tan(gamma1)^2)))"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:L", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "a*(sqrt(1 - sin(theta1)^2 * sin(gamma1)^2))"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:V", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "b*(1/(sqrt(1 + cos(theta1)^2 * tan(gamma1)^2)))"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:V_0", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "b*(1/(sqrt(1 + cos(0)^2 * tan(gamma1)^2)))"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:vector1X", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "V_0 * (0 - 0)/sqrt((0 - 0)^2+(2*L-L)^2+(0-H)^2)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:vector1Y", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "V_0 * (2*L - L)/sqrt((0 - 0)^2+(2*L-L)^2+(0-H)^2)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:vector1Z", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "V_0 * (0-H)/sqrt((0 - 0)^2+(2*L-L)^2+(0-H)^2)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:vector2X", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "V_0 * (S - S)/sqrt((S - S)^2+(V-(L+V))^2+(0-H)^2)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:vector2Y", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "V_0 * (V -(L+V))/sqrt((S - S)^2+(V-(L+V))^2+(0-H)^2)"))))

oDesign.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers",  _
"LocalVariables"), _
Array("NAME:NewProps", _
Array("NAME:vector2Z", _
"PropType:=", _
"VariableProp", _
"UserDef:=", _
true, _
"Value:=", "V_0 * (0 - H)/sqrt((S - S)^2+(V-(L+V))^2+(0-H)^2)"))))

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "0", "Y:=", "0", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "0", "Y:=", "L", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "L+V", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "0",   "Y:=", "0",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_0", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "0", "Y:=", "L", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "0+vector1X", "Y:=", "2*L+vector1Y", "Z:=", "0+vector1Z"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "2*L+V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "L+V", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "0",   "Y:=", "L",   "Z:=", "H")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_1", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "L+V", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "L", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "0", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "S",   "Y:=", "V",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_2", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "L+V", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "2*L+V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "2*S+vector1X", "Y:=", "2*L+vector1Y", "Z:=", "0+vector1Z"), _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "L", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "S",   "Y:=", "L+V",   "Z:=", "H")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_3", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "0", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "L", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "3*S", "Y:=", "L+V", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "3*S", "Y:=", "V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "2*S",   "Y:=", "0",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_4", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "L", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "2*S+vector1X", "Y:=", "2*L+vector1Y", "Z:=", "0+vector1Z"), _
			Array("NAME:PLPoint", "X:=", "3*S", "Y:=", "2*L+V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "3*S", "Y:=", "L+V", "Z:=", "H"), _
			Array("NAME:PLPoint", "X:=", "2*S",   "Y:=", "L",   "Z:=", "H")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_5", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "0", "Y:=", "0", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "S+vector2X", "Y:=", "V+vector2Y", "Z:=", "0-vector2Z"), _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "0",   "Y:=", "0",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_6", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "S", "Y:=", "V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "S+vector2X", "Y:=", "V+vector2Y", "Z:=", "0-vector2Z"), _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "0", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "S",   "Y:=", "V",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_7", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "2*S", "Y:=", "0", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "3*S+vector2X", "Y:=", "V+vector2Y", "Z:=", "0-vector2Z"), _
			Array("NAME:PLPoint", "X:=", "3*S", "Y:=", "V", "Z:=", "0"), _
			Array("NAME:PLPoint", "X:=", "2*S",   "Y:=", "0",   "Z:=", "0")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Line_8", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CoverLines _
Array("NAME:Selections", _
"Selections:=", "Line_0,Line_1,Line_2,Line_3,Line_4,Line_5,Line_6,Line_7,Line_8", _
"NewPartsModelFlag:=", _
"Model")
oEditor.DuplicateMirror _
	Array("NAME:Selections", "Selections:=", "Line_0,Line_1,Line_2,Line_3,Line_4,Line_5,Line_6,Line_7,Line_8"), _
	Array("NAME:DuplicateToMirrorParameters", _
		"DuplicateMirrorBaseX:=",  "0+vector1X", _
		"DuplicateMirrorBaseY:=", "2*L+vector1Y", _
		"DuplicateMirrorBaseZ:=", "0+vector1Z", _
		"DuplicateMirrorNormalX:=",  "0", _
		"DuplicateMirrorNormalY:=", "L", _
		"DuplicateMirrorNormalZ:=", "-H" _
		), _
	Array("NAME:Options", "DuplicateBoundaries:=", true) 


oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "Line_0,Line_0_1,Line_1,Line_1_1,Line_2,Line_2_1,Line_3,Line_3_1,Line_4,Line_4_1,Line_5,Line_5_1,Line_6,Line_6_1,Line_7,Line_7_1,Line_8,Line_8_1"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)

oEditor.CreateRelativeCS _
Array("NAME:RelativeCSParameters", _
"OriginX:=", "1.5*S", _
"OriginY:=", "(V+vector2Y)/2", _
"OriginZ:=", "(0-vector2Z)/2", _
"XAxisXvec:=", "0mm", _
"XAxisYvec:=", "2*S*3*L meter", _
"XAxisZvec:=", "-2*S*3*H meter", _
"YAxisXvec:=", "0mm", _
"YAxisYvec:=", "1mm", _
"YAxisZvec:=", "0mm"), _
Array("NAME:Attributes", _
"Name:=", "New_Origin")

oEditor.DuplicateAroundAxis _
Array("NAME:Selections", _
"Selections:=", "Line_0", _
"NewPartsModelFlag:=", "Model"), _
Array("NAME:DuplicateAroundAxisParameters", _
"CreateNewObjects:=", true, _
"WhichAxis:=", "X", _
"AngleStr:=", "180deg",_
"NumClones:=", "2.000000"), _
Array("NAME:Options", _
"DuplicateAssignments:=", false), _
Array("CreateGroupsForNewObjects:=", false) _

oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "Line_0,Line_0_2"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)

oEditor.SetWCS _
Array("NAME:SetWCS Parameter", _
"Working Coordinate System:=", "Global")
oEditor.DuplicateMirror _
	Array("NAME:Selections", "Selections:=", "Line_0"), _
	Array("NAME:DuplicateToMirrorParameters", _
		"DuplicateMirrorBaseX:=",  "0*-S+(vector1X)", _
		"DuplicateMirrorBaseY:=", "2*L+vector1Y", _
		"DuplicateMirrorBaseZ:=", "0+vector1Z", _
		"DuplicateMirrorNormalX:=",  "-S", _
		"DuplicateMirrorNormalY:=", "0", _
		"DuplicateMirrorNormalZ:=", "0" _
		), _
	Array("NAME:Options", "DuplicateBoundaries:=", true) 

oEditor.DuplicateMirror _
	Array("NAME:Selections", "Selections:=", "Line_0_3"), _
	Array("NAME:DuplicateToMirrorParameters", _
		"DuplicateMirrorBaseX:=",  "3*-S+(vector1X)", _
		"DuplicateMirrorBaseY:=", "2*L+vector1Y", _
		"DuplicateMirrorBaseZ:=", "0+vector1Z", _
		"DuplicateMirrorNormalX:=",  "-S", _
		"DuplicateMirrorNormalY:=", "0", _
		"DuplicateMirrorNormalZ:=", "0" _
		), _
	Array("NAME:Options", "DuplicateBoundaries:=", true) 

oEditor.DuplicateMirror _
	Array("NAME:Selections", "Selections:=", "Line_0_3_1"), _
	Array("NAME:DuplicateToMirrorParameters", _
		"DuplicateMirrorBaseX:=",  "6*-S+(vector1X)", _
		"DuplicateMirrorBaseY:=", "2*L+vector1Y", _
		"DuplicateMirrorBaseZ:=", "0+vector1Z", _
		"DuplicateMirrorNormalX:=",  "-S", _
		"DuplicateMirrorNormalY:=", "0", _
		"DuplicateMirrorNormalZ:=", "0" _
		), _
	Array("NAME:Options", "DuplicateBoundaries:=", true) 

oEditor.DuplicateMirror _
	Array("NAME:Selections", "Selections:=", "Line_0_3_1_1"), _
	Array("NAME:DuplicateToMirrorParameters", _
		"DuplicateMirrorBaseX:=",  "9*-S+(vector1X)", _
		"DuplicateMirrorBaseY:=", "2*L+vector1Y", _
		"DuplicateMirrorBaseZ:=", "0+vector1Z", _
		"DuplicateMirrorNormalX:=",  "-S", _
		"DuplicateMirrorNormalY:=", "0", _
		"DuplicateMirrorNormalZ:=", "0" _
		), _
	Array("NAME:Options", "DuplicateBoundaries:=", true) 


oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "Line_0,Line_0_3,Line_0_3_1,Line_0_3_1_1,Line_0_3_1_1_1"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)
