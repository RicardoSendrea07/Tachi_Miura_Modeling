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

oProject.InsertDesign "HFSS", "Patch", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("Patch")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-20.000000mm", _
"YPosition:=", "-20.000000mm", _
"ZPosition:=", "0.000000mm", _
"XSize:=", "40.000000mm", _
"YSize:=", "40.000000mm", _
"ZSize:=", "-0.787400mm"), _
Array("NAME:Attributes", _
"Name:=", "Substrate", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.AssignMaterial _
	Array("NAME:Selections", _
		"Selections:=", "Substrate"), _
	Array("NAME:Attributes", _
		"MaterialName:=", "Rogers RO4350 (tm)", _
		"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Substrate"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 143, "G:=", 175, "B:=", 143) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Substrate"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.800000) _
			) _
		) _
	)

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "-20.000000mm", _
"YStart:=", "-20.000000mm", _
"ZStart:=", "0.000000mm", _
"Width:=", "40.000000mm", _
"Height:=", "40.000000mm", _
"WhichAxis:=", "Z"), _
Array("NAME:Attributes", _
"Name:=", "Ground", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Ground"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 143, "G:=", 175, "B:=", 143) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Ground"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "-3.750000mm", _
"YStart:=", "-5.000000mm", _
"ZStart:=", "0.000000mm", _
"Width:=", "7.500000mm", _
"Height:=", "10.000000mm", _
"WhichAxis:=", "Z"), _
Array("NAME:Attributes", _
"Name:=", "Patch", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Patch"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 255, "G:=", 128, "B:=", 0) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Patch"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "1.150000mm", _
"YStart:=", "-1.400000mm", _
"ZStart:=", "0.000000mm", _
"Width:=", "2.600000mm", _
"Height:=", "2.800000mm", _
"WhichAxis:=", "Z"), _
Array("NAME:Attributes", _
"Name:=", "Gap", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Gap"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 255, "G:=", 128, "B:=", 0) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Gap"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Patch", _
"Tool Parts:=", _
"Gap"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "1.150000mm", _
"YStart:=", "-0.880000mm", _
"ZStart:=", "0.000000mm", _
"Width:=", "4.600000mm", _
"Height:=", "1.760000mm", _
"WhichAxis:=", "Z"), _
Array("NAME:Attributes", _
"Name:=", "feedLine", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "feedLine"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 255, "G:=", 128, "B:=", 0) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","feedLine"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "Patch,feedLine"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "5.750000mm", _
"YStart:=", "-0.880000mm", _
"ZStart:=", "0.000000mm", _
"Width:=", "1.760000mm", _
"Height:=", "-0.787400mm", _
"WhichAxis:=", "X"), _
Array("NAME:Attributes", _
"Name:=", "Source", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Source"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 0, "G:=", 128, "B:=", 255) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Source"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-50.000000mm", _
"YPosition:=", "-50.000000mm", _
"ZPosition:=", "-50.000000mm", _
"XSize:=", "100.000000mm", _
"YSize:=", "100.000000mm", _
"ZSize:=", "100.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "Air", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Air"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 0, "G:=", 255, "B:=", 255) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Air"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.500000) _
			) _
		) _
	)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignPerfectE _
Array("NAME:PECPatchBoundary", _
"Objects:=", _
Array("Patch"), _ 
"InfGroundPlane:=", false _ 
)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignPerfectE _
Array("NAME:PECGNDBoundary", _
"Objects:=", _
Array("Ground"), _ 
"InfGroundPlane:=", false _ 
)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignLumpedPort _
Array("NAME:P1", _
      Array("NAME:Modes", _
             Array("NAME:Mode1", _
                   "ModeNum:=", 1, _
                   "UseIntLine:=", true, _
                   Array("NAME:IntLine", _
                          "Start:=", Array("5.750000mm", "0.000000mm", "0.000000mm"), _
                          "End:=",   Array("5.750000mm", "0.000000mm", "-0.787400mm") _
                         ), _
                   "CharImp:=", "Zpi" _
                   ) _
            ), _
      "Resistance:=", "50.000000Ohm", _
      "Reactance:=", "0.000000Ohm", _
      "Objects:=", Array("Source") _
      )
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignRadiation _
Array("NAME:RadiationBox", _
"Objects:=", Array("Air"), _
"UseAdaptiveIE:=", false)

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "HfssDriven", _
Array("NAME:Setup1", _
"Frequency:=", "4.000000GHz", _
"PortsOnly:=", false, _
"maxDeltaS:=", 0.020000, _
"UseMatrixConv:=", false, _
"MaximumPasses:=", 25, _
"MinimumPasses:=", 1, _
"MinimumConvergedPasses:=", 1, _
"PercentRefinement:=", 20, _
"ReducedSolutionBasis:=", false, _
"DoLambdaRefine:=", true, _
"DoMaterialLambda:=", true, _
"Target:=", 0.3333, _
"PortAccuracy:=", 2, _
"SetPortMinMaxTri:=", false)

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertDrivenSweep _
"Setup1", _
Array("NAME:Sweep1", _
"Type:=", "Interpolating", _
"InterpTolerance:=", 0.500000, _
"InterpMaxSolns:=", 101, _
"SetupType:=", "LinearCount", _
"StartFreq:=", "3.000000GHz", _
"StopFreq:=", "4.000000GHz", _
"Count:=", 401, _
"SaveFields:=", false, _
"ExtrapToDC:=", false)

oDesign.Solve _
    Array("Setup1") 

Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "S Parameters", _
"Terminal S Parameters", _
"Rectangular Plot", _
"Setup1 : Sweep1", _
Array("Domain:=", "Sweep"), _
Array("Freq:=", Array("All")), _
Array("X Component:=", "Freq", _
"Y Component:=", Array("im(Y(Port1,Port1))")), _
Array()
