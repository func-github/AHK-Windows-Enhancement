DefaultBrowser() {
	; Find the Registry key name for the default browser
	RegRead, BrowserKeyName, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice, Progid
	
	; Find the executable command associated with the above Registry key
	RegRead, BrowserFullCommand, HKEY_CLASSES_ROOT, %BrowserKeyName%\shell\open\command
	
	; The above RegRead will return the path and executable name of the brower contained within quotes and optional parameters
	; We only want the text contained inside the first set of quotes which is the path and executable
	; Find the ending quote position (we know the beginning quote is in position 0 so start searching at position 1)
	StringGetPos, pos, BrowserFullCommand, ",,1
	
	; Decrement the found position by one to work correctly with the StringMid function
	pos := --pos
	
	; Extract and return the path and executable of the browser
	StringMid, BrowserPathandEXE, BrowserFullCommand, 2, %pos%
	Return BrowserPathandEXE
}

DetectContextMenu() {
	; based on closeContextMenu() by Stefaan - http://www.autohotkey.com/community/viewtopic.php?p=163183#p163183 
	GuiThreadInfoSize = 48
	VarSetCapacity(GuiThreadInfo, 48)
	NumPut(GuiThreadInfoSize, GuiThreadInfo, 0)
	if not DllCall("GetGUIThreadInfo", uint, 0, str, GuiThreadInfo)
	{
		MsgBox GetGUIThreadInfo() indicated a failure.
		return
	}
   ; GuiThreadInfo contains a DWORD flags at byte 4
   ; Bit 4 of this flag is set if the thread is in menu mode. GUI_INMENUMODE = 0x4
	if (NumGet(GuiThreadInfo, 4) & 0x4)
		Return 1 ; we've found a context menu
	Else
		Return 0
}
