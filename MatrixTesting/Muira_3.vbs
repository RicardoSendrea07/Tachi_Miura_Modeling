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

oProject.InsertDesign "HFSS", "Muira_Dipole", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("Muira_Dipole")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oEditor.CreatePolyline _
	Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=", false, _
		Array("NAME:PolylinePoints", _
			Array("NAME:PLPoint", "X:=", "0.0000meter", "Y:=", "0.0000meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.0000meter", "Y:=", "0.8660meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "1.6825meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "0.8165meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.0000meter",   "Y:=", "0.0000meter",   "Z:=", "0.0000meter")_
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
			Array("NAME:PLPoint", "X:=", "0.0000meter", "Y:=", "0.8660meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "0.0000meter", "Y:=", "2.3444meter", "Z:=", "-0.3536meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "2.5485meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "1.6825meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "0.0000meter",   "Y:=", "0.8660meter",   "Z:=", "0.5000meter")_
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
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "0.8165meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "1.6825meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.8660meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.0000meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter",   "Y:=", "0.8165meter",   "Z:=", "0.0000meter")_
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
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "1.6825meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "2.5485meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "2.3444meter", "Z:=", "-0.3536meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.8660meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter",   "Y:=", "1.6825meter",   "Z:=", "0.5000meter")_
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
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.0000meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.8660meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "1.7321meter", "Y:=", "1.6825meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "1.7321meter", "Y:=", "0.8165meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter",   "Y:=", "0.0000meter",   "Z:=", "0.0000meter")_
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
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.8660meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "2.3444meter", "Z:=", "-0.3536meter"), _
			Array("NAME:PLPoint", "X:=", "1.7321meter", "Y:=", "2.5485meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "1.7321meter", "Y:=", "1.6825meter", "Z:=", "0.5000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter",   "Y:=", "0.8660meter",   "Z:=", "0.5000meter")_
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
			Array("NAME:PLPoint", "X:=", "0.0000meter", "Y:=", "0.0000meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "0.2041meter", "Z:=", "0.3536meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "0.8165meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.0000meter",   "Y:=", "0.0000meter",   "Z:=", "0.0000meter")_
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
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "0.8165meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter", "Y:=", "0.2041meter", "Z:=", "0.3536meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.0000meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "0.5774meter",   "Y:=", "0.8165meter",   "Z:=", "0.0000meter")_
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
			Array("NAME:PLPoint", "X:=", "1.1547meter", "Y:=", "0.0000meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "1.7321meter", "Y:=", "0.2041meter", "Z:=", "0.3536meter"), _
			Array("NAME:PLPoint", "X:=", "1.7321meter", "Y:=", "0.8165meter", "Z:=", "0.0000meter"), _
			Array("NAME:PLPoint", "X:=", "1.1547meter",   "Y:=", "0.0000meter",   "Z:=", "0.0000meter")_
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
