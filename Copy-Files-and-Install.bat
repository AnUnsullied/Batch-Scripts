@echo off
CLS

:: Copy all files from installer folder in USB to local folder on computer
robocopy %~dp0\Installers C:\Temp\Installers /E

:: Display to tech the options of which software installer to run
echo Please select the software you want to install:
echo 1.CarbonBlack
echo 2.Cylance
echo 3.Zoom
echo 4.MiCollab
echo 5.All
echo.

:: Prompt tech for choice
Choice /c 123456 /M "Enter your choice: "

:: Determine which software will be installed based on choice
if errorlevel 5 goto InstallAll
if errorlevel 4 goto InstallMiCollab
if errorlevel 3 goto InstallZoom
if errorlevel 2 goto InstallCylance
if errorlevel 1 goto InstallCarbonBlack

:: Install software accordingly base on choice
:InstallCarbonBlack
"C:\Temp\Installers\CarbonBlack.exe"
goto End

:InstallCylance
"C:\Temp\Installers\Cylance.exe"
goto End

:InstallZoom
"C:\Temp\Installers\ZoomInstaller.exe"
goto End

:InstallMiCollab
"C:\Temp\Installers\micollab.msi"
goto End

:InstallAll
"C:\Temp\Installers\CarbonBlack.exe"
"C:\Temp\Installers\Cylance.exe"
"C:\Temp\Installers\ZoomInstaller.exe"
"C:\Temp\Installers\micollab.msi"
"C:\Temp\Installers\ZoomInstaller.exe"
goto End

:End
