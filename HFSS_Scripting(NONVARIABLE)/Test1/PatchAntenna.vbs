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

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "-15.830000mm", _
"YStart:=", "-11.875000mm", _
"ZStart:=", "0.000000mm", _
"Width:=", "31.660000mm", _
"Height:=", "23.750000mm", _
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

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-31.000000mm", _
"YPosition:=", "-31.000000mm", _
"ZPosition:=", "0.000000mm", _
"XSize:=", "62.000000mm", _
"YSize:=", "62.000000mm", _
"ZSize:=", "-0.760000mm"), _
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
		"MaterialName:=", "Rogers RO3003 (tm)", _
		"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Substrate"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 0, "G:=", 128, "B:=", 0) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Substrate"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "-31.000000mm", _
"YStart:=", "-31.000000mm", _
"ZStart:=", "-0.760000mm", _
"Width:=", "62.000000mm", _
"Height:=", "62.000000mm", _
"WhichAxis:=", "Z"), _
Array("NAME:Attributes", _
"Name:=", "GND", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "GND"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 255, "G:=", 128, "B:=", 0) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","GND"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
			) _
		) _
	)

oEditor.CreateRectangle _
Array("NAME:RectangleParameters", _
"IsCovered:=", true, _
"XStart:=", "-0.375000mm", _
"YStart:=", "11.875000mm", _
"ZStart:=", "-0.760000mm", _
"Width:=", "0.760000mm", _
"Height:=", "0.750000mm", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "Port", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 7.500000e-01, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "Port"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 0, "G:=", 255, "B:=", 0) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","Port"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.000000) _
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
Array("GND"), _ 
"InfGroundPlane:=", false _ 
)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignLumpedPort _
Array("NAME:Port1", _
      Array("NAME:Modes", _
             Array("NAME:Mode1", _
                   "ModeNum:=", 1, _
                   "UseIntLine:=", true, _
                   Array("NAME:IntLine", _
                          "Start:=", Array("0.000000mm", "11.875000mm", "-0.760000mm"), _
                          "End:=",   Array("0.000000mm", "11.875000mm", "0.000000mm") _
                         ), _
                   "CharImp:=", "Zpi" _
                   ) _
            ), _
      "Resistance:=", "50.000000Ohm", _
      "Reactance:=", "0.000000Ohm", _
      "Objects:=", Array("Port") _
      )

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-120.552239mm", _
"YPosition:=", "-120.552239mm", _
"ZPosition:=", "-120.552239mm", _
"XSize:=", "241.104478mm", _
"YSize:=", "241.104478mm", _
"ZSize:=", "241.104478mm"), _
Array("NAME:Attributes", _
"Name:=", "AirBox", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.ChangeProperty _
	Array("NAME:AllTabs", _
		Array("NAME:Geometry3DAttributeTab", _
			Array("NAME:PropServers", "AirBox"), _
			Array("NAME:ChangedProps",  _
				Array("NAME:Color", "R:=", 0, "G:=", 255, "B:=", 255) _
			) _
		) _
	) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
	Array("NAME:Geometry3DAttributeTab", _
		Array("NAME:PropServers","AirBox"), _
		Array("NAME:ChangedProps", _
			Array("NAME:Transparent", "Value:=",  0.500000) _
			) _
		) _
	)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignRadiation _
Array("NAME:RadiationBox", _
"Objects:=", Array("AirBox"), _
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

oProject.SaveAs _
    "F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Test1\HFSSFiles\tmpDipole.aedt", _
    true

oDesign.Solve _
    Array("Setup1") 

Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Imaginary Input Impedance", _
"Modal S Parameter", _
"Rectangular Plot", _
"Setup1 : Sweep1", _
Array("Domain:=", "Sweep"), _
Array("Freq:=", Array("All")), _
Array("X Component:=", "Freq", _
"Y Component:=", Array("im(Z(Port1,Port1))")), _
Array()

Set oModule = oDesign.GetModule("ReportSetup")
oModule.ExportToFile "Imaginary Input Impedance", "F:\Nicholas\Classes\Spring_2019\Electromagnetic_Modeling\Project\HFSS_Scripting\Test1\tmpData.csv"
