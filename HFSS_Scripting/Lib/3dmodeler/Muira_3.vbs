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
			Array("NAME:PLPoint", 