# AHK-Windows-Enhancement
AutoHotKey scripts to improve windows, the windows explorer, and the windows task switcher for windows 10.

Current functionality:
* **AutomaticWindowManager.ahk:**
    * Automatically remembers the last window position for snapped windows, even after a restart, based on the process name.

* **Hotkeys.ahk:**
  * Single-modifier-key-press hotkeys are used to prevent users from having to memorize hotkey combinations. Measures were taken to prevent the single-modifier-key-press hotkeys from misfiring. If the press is too long, or if keyboard activity or mouse button/wheel/pad activity happens during the key press, the script will not do anything put pass the key to the system as normal.
  * Quickly pressing and releasing the LeftWin key (must not be a longer than 250 ms press) brings up a new explorer window to its default starting location (such as Quick Access), the script changes the view in the explorer window to "Detail" view, and puts the keyboard focus on the search-bar. Together with an indexed drive, this is used to search the local filesystem; it is intended to do the same thing as Everything by VoidTools, except with the ability to move/copy files, preview files, use the navigation sidebar, and all of the other features of Explorer.
  * Quickly pressing and releasing the LeftCtrl key (must not be a longer than 250 ms press) brings up a new browser window using your default browser at your default browser start page. This is intended to use the Google or Bing search engine, so that it can also be used for a quick calculator which handles units such as feet and inches.
  * Quickly pressing and releasing the LeftShift key (must not be a longer than 250 ms press) brings up a the context menu for the active window. Pressing the LeftShift key again will close the context menu. This allows a user to do things in Explorer such as cut/copy files without having to memorize hotkey combinations and without using the mouse. Simply press LeftShift, then use the arrow keys to navigate the menu, finally use the enter key to make a selection. 
  * When a context menu is open, this script detects it and allows you to use your mouse wheel to go up and down the menu items, as if you were using the up/down arrow keys. After using the scroll wheel on a menu the left mouse button will then function as an enter key, and the right mouse button will function as an escape key, allowing you to choose menu items, enter a nested menu item, or close a nested menu item, or close the parent menu itself. This allows you to navigate context menus by using the mouse wheel and mouse buttons without the need to move the mouse at all. However, if you don't use the mouse wheel when a context menu opens, you can still left click outside the menu to close it.

* **FuncFunctions.ahk:**
    * All functions are kept in this file so they can be #Included across all other script files without having to redefine functions in each script.

* **StartUp.ahk:**
    * When #Included in another script, this will ask the user if they want to add the script they are opening to the windows start up, so they don't have to manually run the script after each system reboot. 


To-do:
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
