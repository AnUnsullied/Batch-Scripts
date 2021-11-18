::Creator - John Nguyen-Tran

::The purpose of this script is to fix the issue where after an email
::migration, the last email file in the Outlook application is the
::"Your mailbox has been temporarily moved on Microsoft Exchange Server"
::and the user has not recieved any email on the Outlook application since then.
::The associated issue and resolution - https://kb.intermedia.net/Article/39713

::Extra details stuff
@echo off
color b
title O2016-Fix-Credential-Prompt-Error
echo O2016-Fix-Credential-Prompt-Error


::Elevate script to admin credentials, so that a registry key can be added to HKLM.
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
echo.


::Warns user that this script will restart the computer.
echo This will reboot the computer. Please check with the user before continuing.
pause


::NOTE - The lines to add a registry key to HKCU should be removed if the lines for 
:: HKLM works. Adding to HKLM is preferable to adding to HKCU because it applies to
:: the computer directly, while HKCU applies the key to the user profile only.

::Add key to HKCU
echo Attempting to Add registry key to HKCU
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\AutoDiscover" /v ExcludeScpLookup /t REG_DWORD /d 1 /f
echo.


::Add key to HKLM
echo Attempting to add registry key to HKLM
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\16.0\Outlook\AutoDiscover" /v ExcludeScpLookup /t REG_DWORD /d 1 /f


::Second reminder to reboot the computer.
echo About to restart the computer:
pause

::Restarts computer, to apply the updated registry key in HKLM
shutdown -r
pause
