# AHK-Windows-Enhancement
AutoHotKey scripts to improve windows, the windows explorer, and the windows task switcher.

Work in progress:
* **Windows Explorer:** Add 'Copy to folder..' and 'Move to folder..' options to the context menu of windows explorer, which each call a respective AHK script. The AHK script should show a filesave/fileopen style dialog allowing the user to navigate to a target folder, then once a target path is specified, the AHK script will either cut the active selection in windows explorer in the case of 'move to folder' and then navigate to the saved target path, paste, then navigate back to the original location in windows explorer. In the case of 'Copy to folder..', the AHK script should merely copy the selection not cut it, and repeat the steps above.** I'm aware that there exists a registry hack to implement something similar to this, but not only does it cause bugs such as the dialog popping up when you double click an outlook attachment, it also uses an inferior dialog compared to the fileopen or filesave type dialogs.**


* **Windows Explorer:** Automatically choose 'size all columns to fit' when search results update or you navigate to a new folder, or when explorer first opens (Only if the 'details' view is active). This should not change the users mouse position or interfere with the user in any way. This should also trigger when the window is resized.


* **Windows Explorer:** Automatically size the preview pane to occupy all but a thin margin of space from the last column when the 'details' view is active, this will be dependent on window size and should also trigger when the window is resized. If the explorer window is below a certain size, automatically turn off the preview pane. If the explorer window size becomes large enough to allow a preview pane + fit all of the columns on screen, turn on the preview pane.


* **Windows Explorer:** Automatically set the keyboard focus to the windows explorer search box (hotkey F3) when explorer becomes active by other than mouse click (if explorer is just created, or if you alt-tab to it, etc, the search should have focus, otherwise, wherever the user clicks should have focus in the case of them clicking into an existing explorer window, which is the default behavior)


* **Windows Explorer:** One-key press (LWin), with no mouse actions or key actions during the Lwin key press should WinActivate an existing explorer window or create a new explorer window if one does not already exist (put keyboard focus on the explorer search bar in both cases)


* **Windows Explorer:** Change default search result view to "Details" not "Content"


* **Windows Explorer:** Explorer automatically selects the first file when you enter a directory


* **Windows Explorer:** Shift+F10 shows the context menu by default, make a single Shift key pressed alone (no mouse button during the shift keypress) show the context menu as well


* **Windows Explorer:** Scroll explorer scrollbars when mouse over them even when they are not focused


* **Windows Explorer:** Automatically choose 'apply to all further operations' in file operations (such as file replace).


* **Windows Explorer/Desktop:** Open with.. > Choose another app should immediately go to the fileopen dialog


* **Windows Dialogs:** Autocomplete filenames and paths with TAB in file dialogs


* **Windows Dialogs:** Add Favorite folders, recent folders, and recent files shortcuts in standard filesave/fileopen dialogs.


* **Window manager:** Automatically make new windows completely visible on the screen (in case they open partially off-screen), automatically make existing windows that now have focus completely visible on screen as well.


* **Window manager:** Automatically resize adjacent snapped window when dragging edge of another snapped window.


* **Window manager:**  Automatically remember last known window position (even snapped positions) and restore them when that application is opened again.


* **Download manager:**  Automatically extract newly downloaded archives to folder of the same name as the archive and delete the archive (move to recycle bin) 


* **Browser/Calculator:** One-key press (LCtrl) with no other mouse or keyboard actions opens default browser. Automatically copy mathematical results from bing/google search result to clipboard, even before Enter key is pressed if calculation is detected in the address bar or omnibar. Detect calculation by existence of the calculation result. Browser calculator is superior to desktop calculator because it allows unit conversions and various units to be used in the calculation, it also allows more flexible language input (Example: 5 feet 2 inches + 6.5 feet).


* **Alt+Tab replacement:**
Mouse Hotkey: MiddleMouseButton+RightMouseButton
Keyboard Hotkey: Alt
Should show a ListView of existing windows in the center of the screen, the top window should be the last activated window besides the current active window, and selected by default. The second listing should be the active window, and from then on windows should be listed alphabetically. 
Mouse interaction: Scroll wheel moves listview selection up/dn, LeftMouseButton (single-click) hides the UI and that window is activated. Right click hides the UI at any time and no window switch is performed.
Keybourd interaction: Up/down arrow keys moves the listview selection up/dn, Tab key moves the listview selecton down, Shift+Tab moves the listview selection up. Enter key or Space key hides the UI and that window is activated. Esc key hides the UI at any time and no window switch is performed.
