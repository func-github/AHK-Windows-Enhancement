; Automatically Restore Previous Window Size/Pos

#SingleInstance Force
#Persistent
#NoEnv
#NoTrayIcon
SetWinDelay, 50
Process, Priority, , Normal
DetectHiddenWindows, Off

#Include *i StartUp.ahk
   
MatchList := ""

; Build the MatchList
WinGet, id, list,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
	if (MatchList = "")
	MatchList := this_id
	else
	MatchList := MatchList . "," . this_id
}

; ExclusionList
ExclusionList = ShellExperienceHost.exe,SearchUI.exe

; The main program loop, which manages window positions/sizes and saves their last known configuration to an ini file in the script directory.
Loop,
{
	Sleep, 350
	WinGet, active_id, ID, A
	OwnerID := DllCall("GetWindow", "uint", active_id, "uint", "4") ; GW_OWNER = 4
	if (OwnerID <> 0) {
		continue
	}
	if active_id not in %MatchList% ; Then this is a new window ID! So, check if it has a configuration saved.
	{
		MatchList := MatchList . "," . active_id ; This window ID is not new anymore!
		WinGet, AProcessName, ProcessName, A
		WinGetClass, AClass, A
		WinGet, AStyle, Style, A
		WinGet, AExStyle, ExStyle, A
		IniRead, savedSizePos, %A_ScriptDir%\WindowSizePosLog.ini, Process Names, %AProcessName%%AClass%%AStyle%%AExStyle%
		if (savedSizePos != "ERROR" AND AClass != "MultitaskingViewFrame" AND AClass != "Shell_TrayWnd") ; Then a saved configuration exists, size/move the window!
		{
			StringSplit OutputArray, savedSizePos,`,
			if (AProcessName = "explorer.exe" AND AClass != "CabinetWClass")
			{
				
			}
			else
			{
				WinMove, A,, OutputArray1, OutputArray2, OutputArray3, OutputArray4
			}
		}
		else ; No saved configuration exists, save the current window size/pos as a configuration instead!
		{
			WinGetPos X, Y, Width, Height, A
			WinGet, AProcessName, ProcessName, A
			WinGetClass, AClass, A
			WinGet, AStyle, Style, A
			WinGet, AExStyle, ExStyle, A
			WinGet, WinState, MinMax, ahk_class A
			If (WinState == -1) {
				Continue
			}
			If (X != "" AND Y != "" AND Width != "" AND Height != "" AND Width > 0 AND Height > 0 AND AClass != "MultitaskingViewFrame" AND AClass != "Shell_TrayWnd")
			{
				if (AProcessName = "explorer.exe" AND AClass != "CabinetWClass")
				{
					
				}
				else if AProcessName not in %ExclusionList%
				{
					IniWrite %X%`,%Y%`,%Width%`,%Height%, %A_ScriptDir%\WindowSizePosLog.ini, Process Names, %AProcessName%%AClass%%AStyle%%AExStyle%
				}
			}
		}
	}
	else ; Save/overwrite the active window size and position to a file with a link to the processname, for later use.
	{
		WinGetPos X, Y, Width, Height, A
		WinGet, AProcessName, ProcessName, A
		WinGetClass, AClass, A
		WinGet, AStyle, Style, A
		WinGet, AExStyle, ExStyle, A
		WinGet, WinState, MinMax, A
		If (WinState == -1) {
			Continue
		}
		If (X != "" AND Y != "" AND Width != "" AND Height != "" AND Width > 0 AND Height > 0 AND AClass != "MultitaskingViewFrame" AND AClass != "Shell_TrayWnd")
		{
			if (AProcessName = "explorer.exe" AND AClass != "CabinetWClass")
			{
				
			}
			else if AProcessName not in %ExclusionList%
			{
				IniWrite %X%`,%Y%`,%Width%`,%Height%, %A_ScriptDir%\WindowSizePosLog.ini, Process Names, %AProcessName%%AClass%%AStyle%%AExStyle%
			}
		}
	}
}
Return 
