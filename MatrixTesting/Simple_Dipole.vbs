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

oProject.InsertDesign "HFSS", "Dipole", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("Dipole")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "-0.0050m", "Y:=", "0.0295m", "Z:=", "0.0000m"), _
			Array("NAME:PLPoint", "X:=", "0.0050m", "Y:=", "0.0295m", "Z:=", "0.0000m"), _
			Array("NAME:PLPoint", "X:=", "0.0050m", "Y:=", "-0.0295m", "Z:=", "0.0000m"), _
			Array("NAME:PLPoint", "X:=", "-0.0050m", "Y:=", "-0.0295m", "Z:=", "0.0000m"), _
			Array("NAME:PLPoint", "X:=", "-0.0050m",   "Y:=", "0.0295m",   "Z:=", "0.0000m")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Dipole", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CoverLines _
Array("NAME:Selections", _
"Selections:=", "Dipole", _
"NewPartsModelFlag:=", _
"Model")

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "-0.0041m", "Y:=", "0.0241m", "Z:=", "0.9827m"), _
			Array("NAME:PLPoint", "X:=", "0.0041m", "Y:=", "0.0270m", "Z:=", "0.9877m"), _
			Array("NAME:PLPoint", "X:=", "0.0041m", "Y:=", "-0.0241m", "Z:=", "1.0173m"), _
			Array("NAME:PLPoint", "X:=", "-0.0041m", "Y:=", "-0.0270m", "Z:=", "1.0123m"), _
			Array("NAME:PLPoint", "X:=", "-0.0041m",   "Y:=", "0.0241m",   "Z:=", "0.9827m")_
			), _ 
		Array("NAME:PolylineSegments", _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 0, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 1, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 2, "NoOfPoints:=", 2), _
			Array("NAME:PLSegment", "SegmentType:=",  "Line", "StartIndex:=", 3, "NoOfPoints:=", 2) _
			) _
		), _
Array("NAME:Attributes", _
"Name:=", "Dipole2", _
"Flags:=", "", _
"Color:=", "(0 0 0)", _
"Transparency:=", 0.800000, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CoverLines _
Array("NAME:Selections", _
"Selections:=", "Dipole2", _
"NewPartsModelFlag:=", _
"Model")
