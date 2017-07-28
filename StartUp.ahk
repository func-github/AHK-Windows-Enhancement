if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

;RegDelete, HKEY_LOCAL_MACHINE, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, "%A_ScriptName%"

RegRead, OutputVar, HKEY_LOCAL_MACHINE, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, "%A_ScriptName%"
if errorlevel
{
   msgbox, 4, , Do you want this script to run automatically at startup?
   IfMsgBox, Yes
	{
	RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run, "%A_ScriptName%", "C:\Program Files\AutoHotkey\AutoHotkey.exe" "%A_ScriptFullPath%"	
	}
}