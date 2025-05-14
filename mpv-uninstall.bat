@echo off
setlocal enableextensions enabledelayedexpansion
path %SystemRoot%\System32;%SystemRoot%;%SystemRoot%\System32\Wbem

:: Unattended install flag. When set, the script will not require user input.
set unattended=no
if "%1"=="/u" set unattended=yes

:: Make sure the script is running as admin
call :ensure_admin

echo Uninstalling MPV file associations and registry entries...

:: Delete "App Paths" entry
echo Removing App Paths entry...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\mpv.exe" /f >nul 2>&1

:: Delete HKCR subkeys
set classes_root_key=HKLM\SOFTWARE\Classes
echo Removing Applications entry...
reg delete "%classes_root_key%\Applications\mpv.exe" /f >nul 2>&1

echo Removing OpenWithList entries...
reg delete "%classes_root_key%\SystemFileAssociations\video\OpenWithList\mpv.exe" /f >nul 2>&1
reg delete "%classes_root_key%\SystemFileAssociations\audio\OpenWithList\mpv.exe" /f >nul 2>&1
reg delete "%classes_root_key%\SystemFileAssociations\image\OpenWithList\mpv.exe" /f >nul 2>&1

:: Delete AutoPlay handlers
set autoplay_key=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers
echo Removing AutoPlay Handlers...
reg delete "%classes_root_key%\io.mpv.dvd" /f >nul 2>&1
reg delete "%classes_root_key%\io.mpv.bluray" /f >nul 2>&1
reg delete "%autoplay_key%\Handlers\MpvPlayDVDMovieOnArrival" /f >nul 2>&1
reg delete "%autoplay_key%\EventHandlers\PlayDVDMovieOnArrival" /v "MpvPlayDVDMovieOnArrival" /f >nul 2>&1
reg delete "%autoplay_key%\Handlers\MpvPlayBluRayOnArrival" /f >nul 2>&1
reg delete "%autoplay_key%\EventHandlers\PlayBluRayOnArrival" /v "MpvPlayBluRayOnArrival" /f >nul 2>&1

:: Delete "Default Programs" entry
echo Removing Default Programs entries...
reg delete "HKLM\SOFTWARE\RegisteredApplications" /v "mpv" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Clients\Media\mpv" /f >nul 2>&1 :: Deletes the whole mpv client key including Capabilities

:: Delete all OpenWithProgIds referencing ProgIds that start with io.mpv.
echo Removing OpenWithProgIds references to mpv...
for /f "usebackq eol= delims=" %%k in (`reg query "%classes_root_key%" /s /k /f "OpenWithProgids" /c ^| findstr /I /R "\\OpenWithProgids$"`) do (
	set "key_path=%%k"
	for /f "usebackq eol= tokens=1" %%v in (`reg query "!key_path!" /f "io.mpv.*" /v /c ^| findstr /B /I /R "io\.mpv\."`) do (
		set "value_name=%%v"
		echo Deleting "!key_path!" \ "!value_name!"
		reg delete "!key_path!" /v "!value_name!" /f >nul 2>&1
	)
)

:: Delete all ProgIds starting with io.mpv.
echo Removing mpv ProgIds (io.mpv.*)...
for /f "usebackq eol= delims=" %%k in (`reg query "%classes_root_key%" /k /f "io.mpv." /c ^| findstr /I /R "\\io\.mpv\."`) do (
	set "key_to_delete=%%k"
	:: Double check it's one of ours to be safe, although the findstr should be specific enough
	echo !key_to_delete! | findstr /R /C:"^HKEY_LOCAL_MACHINE\\SOFTWARE\\Classes\\io\.mpv\." >nul
	if not errorlevel 1 (
		echo Deleting ProgId key: !key_to_delete!
		reg delete "!key_to_delete!" /f >nul 2>&1
	)
)

echo.
echo Uninstalled successfully.
echo You might need to restart Explorer or log off/on for all changes to take effect,
echo especially regarding default program settings and icons.
echo.
if [%unattended%] == [yes] exit 0
pause
exit 0

:die
	if not [%1] == [] echo %~1
	if [%unattended%] == [yes] exit 1
	pause
	exit 1

:ensure_admin
	:: 'openfiles' is just a commmand that is present on all supported Windows
	:: versions, requires admin privileges and has no side effects, see:
	:: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
	openfiles >nul 2>&1
	if errorlevel 1 (
		echo This batch script requires administrator privileges. Right-click on
		echo this .bat file and select "Run as administrator".
		call :die
	)
	goto :EOF
