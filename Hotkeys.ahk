#SingleInstance Force
#Persistent
#NoTrayIcon
#InstallKeybdHook
#InstallMouseHook

#Include *i StartUp.ahk
#Include FuncFunctions.ahk

Return

SelectModeTimer:
SetTimer, SelectModeTimer, Off
If (DetectContextMenu() = 1) OR (WinExist("ahk_class Chrome_WidgetWin_2") AND WinActive("ahk_exe chrome.exe"))
{
	SetTimer, SelectModeTimer, On
}
else
{
	SelectMode := 0
}
Return

~LWin::
if !Triggered
{
	TimeNow := A_TickCount
	Triggered := 1
}
Return

~LCtrl::
if !Triggered
{
	TimeNow := A_TickCount
	Triggered := 1
}
Return

~LShift::
if !Triggered
{
	TimeNow := A_TickCount
	Triggered := 1
}
Return

~LWin Up::
if (A_PriorKey = "Lwin") and (TimeNow > 0) and (A_TickCount - TimeNow < 250) {
	Run, explorer.exe
	WinWaitActive, ahk_class CabinetWClass, , 2
	Send {LCtrl Down}{LShift Down}6{LShift Up}{LCtrl Up} ; Set the view type to details
	Send {F3} ; Set the search bar to have focus
}
Triggered := 0
Return

~LCtrl Up::
if (A_PriorKey = "LControl") and (TimeNow > 0) and (A_TickCount - TimeNow < 250) {
	Run, % DefaultBrowser()
}
Triggered := 0
Return

~LShift Up::
if (A_PriorKey = "LShift") and (TimeNow > 0) and (A_TickCount - TimeNow < 250) {
	If (DetectContextMenu() = 1) OR (WinExist("ahk_class Chrome_WidgetWin_2") AND WinActive("ahk_exe chrome.exe"))
		Send {LAlt}
	Else
		Send {AppsKey} ; Context menu
}
Triggered := 0
Return

*~LButton::
*~RButton::
*~MButton::
*~XButton1::
*~XButton2::
*~WheelDown::
*~WheelUp::
*~WheelLeft::
*~WheelRight::
TimeNow := 0
Return

#If (DetectContextMenu() = 1) OR (WinExist("ahk_class Chrome_WidgetWin_2") AND WinActive("ahk_exe chrome.exe"))
	
WheelUp::
Send, {Up}
SelectMode := 1
SetTimer, SelectModeTimer, -15
Return

WheelDown::
Send, {Down}
SelectMode := 1
SetTimer, SelectModeTimer, -15
Return

$LButton::
If (SelectMode = 1)
	Send, {Enter}
Else
	Send, {LButton}
Return

$RButton::
If (SelectMode = 1)
	Send, {Esc}
Else
	Send, {RButton}
Return

#If
