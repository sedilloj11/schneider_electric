@echo off

del c:\SE_SETUP\complete.txt /q >nul 2>&1
rem del c:\se_setup\log.txt /q >nul 2>&1
del c:\se_setup\sexpert.txt /q >nul 2>&1

set /p engineer=<c:\se_setup\engineer.txt
set /p site=<c:\se_setup\site.txt
set /p blah=<c:\se_setup\blah.txt
rem set /p pmpw=<c:\se_setup\pmpw.txt
>c:\se_setup\winuser.txt whoami
set /p winuser=<c:\se_setup\winuser.txt
>c:\se_setup\SOFTWAREPM\progress.txt echo 0
set "progress=0"



rem del c:\se_setup\engineer.txt /q >nul 2>&1
rem del c:\se_setup\site.txt /q >nul 2>&1
del c:\se_setup\blah.txt /q >nul 2>&1
del c:\se_setup\pmpw.txt /q >nul 2>&1
del c:\se_setup\winuser.txt /q >nul 2>&1

if "%site%" == "" set "site=SchneiderSite" >nul 2>&1
if "%engineer%" == "" set "engineer=SchneiderEngineer" >nul 2>&1
if "%blah%" == "" set "blah=%engineer% has no other issues to report" >nul 2>&1



echo %engineer% >c:\se_setup\softwarepm\engineer2.txt
echo %site% >c:\se_setup\softwarepm\site2.txt

:pmlist
echo Running Software PM. Please Wait..
net sessions /delete /y >nul 2>&1
set "file=c:\se_setup\distinctip.txt"
setlocal EnableDelayedExpansion
<"!file!" (
  for /f %%i in ('type "!file!" ^| find /c /v ""') do set /a nn=%%i && for /l %%m in (1 1 %%i) do (
    set /p "line2_%%m="
  )
)
cls
set "distinctipcount=%nn%"
mkdir C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\ >nul 2>&1

echo %username% is logged in >nul 2>&1
rem schtasks /create /sc once /st 23:00 /tn setest /tr C:\SE_SETUP\SOFTWAREPM\setest.bat /F /RL HIGHEST /ru %username% /rp %pmpw% >nul 2>&1

rem if %errorLevel% NEQ 0 echo Error: Access Denied. Wrong Password for %username%. & exit
rem schtasks /delete /tn setest /F >nul 2>&1



rem  cd \
mkdir C:\SE_SETUP >nul 2>&1
mkdir C:\SE_SETUP\SOFTWAREPM >nul 2>&1
rem  cd \
cd C:\SE_SETUP
net share SE_SETUP=c:\SE_SETUP /GRANT:Everyone,FULL >nul 2>&1
del C:\SE_SETUP\SOFTWAREPM\setup*.bat /q >nul 2>&1

cls
echo @echo off >C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setLocal enableDELAYedeXpansioN >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo del C:\SE_SETUP\SOFTWAREPM\pm*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo set ^"diff=0^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo cd c:\ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd SE_SETUP >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo schtasks /Delete /TN PMCOPY /f >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\*%%computername%%*.* /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=noext" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cd %%systemroot%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd.. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd Progra~1\OnSSI >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "ext=bix" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd.. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd.. >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo if not exist "C:\ProgramData\AMAG\Symmetry CompleteView" goto skipsalient >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if not exist "C:\ProgramData\Salient\CompleteView" goto skipsalient >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cd Progra~1\CompleteView >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "ext=avi" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd "Progra~1\Symmetry CompleteView" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "ext=avi" >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo if exist "C:\Program Files\Symmetry CompleteView\camerastate" goto salient1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if exist "C:\Program Files\CompleteView\camerastate" goto salient1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto skipsalient >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :salient1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=avi" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo salient ^>C:\SE_SETUP\SOFTWAREPM\dvr.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\salientcameras*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd "C:\Program Files\*CompleteView\camerastate" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /b /s ^>C:\se_setup\salientcameras1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=3 delims=_" %%%%a IN ('Type C:\se_setup\salientcameras1.csv') DO (echo %%%%a ^>^>C:\se_setup\salientcameras2.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=1 delims=." %%%%a IN ('Type C:\se_setup\salientcameras2.csv') DO (echo %%%%a ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Pointssalientcameras.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\salientcameras1.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\salientcameras2.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :skipsalient >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo net sessions /delete /y >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Generating Software PM Sheet... >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set "Summary0=%%computername%%">>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary1=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary2=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary3=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary4=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary5=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary6=All databases are below 20GB. Truncation is not Needed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary7=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary8=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary9=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary10=N/A," >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary11=All software versions have been documented in full technical report" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary12=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary13=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary14=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary15=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary16=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary17=No Application or Security critical/error/warning event Messages." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary18=See full technical report for analysis" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary19=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary20=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary21=All Microsoft patches have been documented in full technical report" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary22=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary23=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary24=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary25=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary26=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary27=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary28=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary29=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary30=no time servers at the moment. Recommend syncing with an accurate time source." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary31=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary32=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary33=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary34=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary35=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary36=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary37=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary38=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary39=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary40=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary41=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary42=Completed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary43=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Summary44=N/A" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo %%computername%% ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"%!site!%_%!engineer!%_SUMMARY_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo echo SCHNEIDER ELECTRIC SOFTWARE PM REPORT RAN BY !engineer! ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\header.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo SITENAME:!site! ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\header.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo DATE:%%date%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\header.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo MACHINE:%%computername%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\header.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo FOR /F "tokens=2,3" %%%%A IN ('ping %%computername%% -n 1 -4') DO IF "from"== "%%%%A" set "IP=%%%%~B" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo IP ADDRESS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Network.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo NetSh Interface IPv4 Show Interfaces ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ipconfig /all ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Network.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo USER INFORMATION: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "Set-ExecutionPolicy "RemoteSigned" -Scope Process -Confirm:$false" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "Set-ExecutionPolicy "RemoteSigned" -Scope CurrentUser -Confirm:$false" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo Set-ExecutionPolicy RemoteSigned; $adsi = [ADSI]"WinNT://$env:COMPUTERNAME" ; $adsi.Children ^^^| where {$_.SchemaClassName -eq 'user'} ^^^| Foreach-Object {$groups = $_.Groups() ^^^| Foreach-Object {$_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)}; $_ ^^^| Select-Object @{n='UserName';e={$_.Name}},@{n='Computer' ;e={$env:computername}},@{n='Groups';e={$groups -join ';'}}} ^^^| format-table -AutoSize ^^^| Out-String -Width 4096 ^>C:\SE_SETUP\SOFTWAREPM\users.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "Set-ExecutionPolicy RemoteSigned" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
cls

rem echo powershell -Command "C:\SE_SETUP\SOFTWAREPM\users.ps1" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$ErrorActionPreference = 'SilentlyContinue'; C:\SE_SETUP\SOFTWAREPM\users.ps1 ^| out-file c:\se_setup\SOFTWAREPM\users2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\users2.txt) -replace '%%computername%%', ',%%computername%%,' | Out-File c:\se_setup\SOFTWAREPM\users3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\users3.txt) -replace 'Computer ', 'Computer,' | Out-File c:\se_setup\SOFTWAREPM\users4.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\users4.txt) -replace 'UserName ', 'UserName,' | Out-File c:\se_setup\SOFTWAREPM\users5.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat



cls
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd se_setup >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type users5.txt ^| Findstr "," ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Accounts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\users*.* /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SYSTEM INFORMATION: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo SYSTEMINFO /S localhost /FO CSV ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo1.csv) -replace ': KB', ':KB' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo2.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo2.csv) -replace '\[', '' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo3.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo3.csv) -replace '\]', '' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo4.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo4.csv) -replace '  ', '' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo5.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo5.csv) -replace ': ', '' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo6.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo6.csv) -replace ', ', '' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo7.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo7.csv ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat





echo powershell -Command "gwmi win32_Processor  -Property Name, NumberOfCores, NumberOfLogicalProcessors | Out-File C:\SE_SETUP\SOFTWAREPM\pmcpu.csv -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\pmcpu.csv ^^^| findstr /C:"Name                      :"') DO (set pmcpu1=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\pmcpu.csv ^^^| findstr /C:"NumberOfCores"') DO (set pmcpu2=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\pmcpu.csv ^^^| findstr /C:"NumberOfLogicalProcessors"') DO (set pmcpu3=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%pmcpu1%%, %%pmcpu2%% Cores, %%pmcpu3%% Logical Processors ^>C:\SE_SETUP\SOFTWAREPM\pmcpu1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p pmcpu=^<C:\SE_SETUP\SOFTWAREPM\pmcpu1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo powershell -Command "gwmi win32_bios | export-csv c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemBios.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "gwmi win32_Processor | export-csv c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemCPU.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo del c:\se_setup\SOFTWAREPM\sysinfo*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat


cls
echo echo Using a Windows NT based system on %%computername%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat




echo systeminfo ^> c:\se_setup\SOFTWAREPM\sysinfo.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 (echo Error getting SystemInfo. Computer might need to be restarted ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\sysinfo.txt ^| findstr /L "OS Version:" ^>c:\se_setup\SOFTWAREPM\sysinfo2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\sysinfo.txt ^| findstr "Boot" ^>^>c:\se_setup\SOFTWAREPM\sysinfo2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\sysinfo2.txt ^| findstr /V "Manufacturer" ^| findstr /V "Configuration" ^| findstr /V "Type:" ^| findstr /V "BIOS" ^| findstr /V "Device:" ^>c:\se_setup\SOFTWAREPM\sysinfo3.txt  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "get-wmiobject -class win32_quickfixengineering | sort InstalledOn -Descending | Format-Table -Property Description,HotFixID,InstalledBy,InstalledOn -Autosize" ^>c:\se_setup\SOFTWAREPM\sysinfo4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type c:\se_setup\SOFTWAREPM\sysinfo4.txt ^| findstr /v "recognized" ^| findstr /v "setting" ^| findstr /v "win32_quickfixengineering" ^| findstr /v "GetValueInvocationException" ^| findstr /v "ExpressionEvaluation" ^| findstr /v "HotFixID," ^| findstr /v "InvalidResult" ^| findstr /v "SortObjectCommand" ^|findstr /v "line" ^| findstr /v "size" ^>c:\se_setup\SOFTWAREPM\sysinfo4a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type c:\se_setup\SOFTWAREPM\sysinfo4a.txt ^| findstr "KB" ^>c:\se_setup\SOFTWAREPM\sysinfo5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo FOR /f "tokens=* skip=3" %%%%u IN (c:\se_setup\SOFTWAREPM\sysinfo4a.txt) DO echo %%%%u ^>^>c:\se_setup\SOFTWAREPM\sysinfo5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p lastpatch=^<c:\se_setup\SOFTWAREPM\sysinfo5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Last Windows Patch:        %%lastpatch%% ^>^>c:\se_setup\SOFTWAREPM\sysinfo3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'c:\se_setup\SOFTWAREPM\sysinfo3.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'c:\se_setup\SOFTWAREPM\sysinfo6.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo6.txt) -replace '  ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo7.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo7.txt) -replace '  ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo8.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo8.txt) -replace '  ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo9.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo9.txt) -replace '  ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo10.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo10.txt) -replace ',', ';' | Out-File c:\se_setup\SOFTWAREPM\sysinfo11.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\SOFTWAREPM\sysinfo11.txt ^> c:\se_setup\SOFTWAREPM\sysinfo12.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary13=^<c:\se_setup\SOFTWAREPM\sysinfo12.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary19=^<c:\se_setup\SOFTWAREPM\sysinfo5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo if exist "%%systemroot%%\Logs\SystemRestore\Restore*.etl" set "summary20=Windows System Restore is Enabled."  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if not exist "%%systemroot%%\Logs\SystemRestore\Restore*.etl" set "summary20=+++Windows System Restore is Disabled." >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo del c:\se_setup\CheckDisk*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat


if exist C:\SE_SETUP\SkipChkdsk.txt echo Check Disk scan skipped >>c:\se_setup\SOFTWAREPM\sysinfo67.txt & goto SkipChkdsk


echo for /f "tokens=1-3" %%%%a in ('WMIC LOGICALDISK GET FreeSpace^^^,Name^^^,Size ^^^| FINDSTR /I /V "Name"') do echo %%%%b ^>^>c:\se_setup\CheckDisk0.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\CheckDisk0.txt ^| Findstr /v "ECHO" ^| Findstr /v "%%systemroot:~0,-8%%" ^>^>c:\se_setup\CheckDisk1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'c:\se_setup\CheckDisk1.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' '};$csv4 | Out-File 'c:\se_setup\CheckDisk2.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\SE_SETUP\CheckDisk2.txt) -replace ': ', '' | Out-File C:\SE_SETUP\CheckDisk3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\CheckDisk3.txt ^> C:\SE_SETUP\CheckDisk4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p drives=^<C:\SE_SETUP\CheckDisk4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo cd %%systemroot:~0,-8%%\ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo chkdsk %%systemroot:~0,-8%% ^| findstr /v "%%%%" ^| findstr /v "completed" ^| findstr /v "Stage" ^| findstr /v "parameter" ^| findstr /v "percent" >>c:\se_setup\CheckDisk5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\CheckDisk4.txt ^| findstr "[A-Z]" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto nodrivesleft >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo for %%%%d in (%%drives%%) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo %%%%d: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%%%d: ^>^>c:\se_setup\CheckDisk5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo chkdsk ^| findstr /v "%%%%" ^| findstr /v "completed" ^| findstr /v "Stage" ^| findstr /v "parameter" ^| findstr /v "percent" ^>^>c:\se_setup\CheckDisk5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo :nodrivesleft >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CheckDisk.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\CheckDisk5.txt ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CheckDisk.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "found problems" c:\se_setup\CheckDisk5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorLevel%% NEQ 0 echo Check Disk Healthy. No bad sectors or unindexed files found: ^>^>c:\se_setup\SOFTWAREPM\sysinfo67.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorLevel%% EQU 0 echo +++Issues Detected running Check Disk. Bad sectors or unindexed files found: ^>^>c:\se_setup\SOFTWAREPM\sysinfo67.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\CheckDisk*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat


:SkipChkdsk
rem echo chkdsk ^| findstr "bad unindexed" ^>^>c:\se_setup\SOFTWAREPM\sysinfo66.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo66.txt) -replace '                                     ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo66a.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo66a.txt) -replace '  ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo66b.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo66b.txt) | ? {$_.trim() -ne '' } ^>c:\se_setup\SOFTWAREPM\sysinfo66c.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo find /c "Errors found." c:\se_setup\SOFTWAREPM\sysinfo66c.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type c:\se_setup\SOFTWAREPM\sysinfo66.txt ^>^> c:\se_setup\SOFTWAREPM\sysinfo67.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "$csv1 = @(gc 'c:\se_setup\SOFTWAREPM\sysinfo67.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'c:\se_setup\SOFTWAREPM\sysinfo68.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo68.txt) -replace '                                      ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo69.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo69.txt) -replace '  ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo70.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo CMD /A /C TYPE c:\se_setup\SOFTWAREPM\sysinfo70.txt ^> c:\se_setup\SOFTWAREPM\sysinfo71.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary25=^<c:\se_setup\SOFTWAREPM\sysinfo67.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type c:\se_setup\SOFTWAREPM\sysinfo.txt ^| findstr /L "Total" ^>c:\se_setup\SOFTWAREPM\sysinfo20.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo20.txt) -replace '     ', ' ' | Out-File c:\se_setup\SOFTWAREPM\sysinfo21.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p memory=^<c:\se_setup\SOFTWAREPM\sysinfo21.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo21.txt) -replace ' MB', '' | Out-File c:\se_setup\SOFTWAREPM\sysinfo22.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo22.txt) -replace ',', '' | Out-File c:\se_setup\SOFTWAREPM\sysinfo23.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo23.txt) -replace 'Total Physical Memory: ', '' | Out-File c:\se_setup\SOFTWAREPM\sysinfo24.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\SOFTWAREPM\sysinfo24.txt ^> c:\se_setup\SOFTWAREPM\sysinfo25.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p memorycheck=^<c:\se_setup\SOFTWAREPM\sysinfo25.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%memorycheck%% GTR 7500 set "memresult=Memory of %%memorycheck%% MB is adequate." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%memorycheck%% LSS 7500 set "memresult=+++Memory is below 8GB. Recommend RAM Upgrade Only if x64" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\SOFTWAREPM\sysinfo21.txt ^> c:\se_setup\SOFTWAREPM\sysinfo31.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%memresult%% ^>^>c:\se_setup\SOFTWAREPM\sysinfo31.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type c:\se_setup\SOFTWAREPM\sysinfo.txt ^| findstr /L "\-based" ^>c:\se_setup\SOFTWAREPM\sysinfo26.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo findstr "64" "c:\se_setup\SOFTWAREPM\sysinfo26.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "type=System is a 64 bit machine." >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 set "type=System is a 32 bit machine. Recommend New 64bit machine to support higher memory." >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo %%type%% ^>^>c:\se_setup\SOFTWAREPM\sysinfo31.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo findstr /i "xp 2003" c:\se_setup\SOFTWAREPM\sysinfo.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 1 set "OS=System OS is not XP or Server 2003 and still supported by Windows" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "OS=System OS is either XP or Server 2003 and NOT supported by Windows" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%OS%% ^>^>c:\se_setup\SOFTWAREPM\sysinfo31.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "$csv1 = @(gc 'c:\se_setup\SOFTWAREPM\sysinfo31.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'c:\se_setup\SOFTWAREPM\sysinfo35.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfo35.txt) -replace ',', '' | Out-File c:\se_setup\SOFTWAREPM\sysinfo35a.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\SOFTWAREPM\sysinfo35a.txt ^> c:\se_setup\SOFTWAREPM\sysinfo36.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary15=^<c:\se_setup\SOFTWAREPM\sysinfo36.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat




echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd se_setup >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type sysinfo.txt ^| findstr /v "KB" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo Computer Processor: echo %%PROCESSOR_ARCHITECTURE%% %%PROCESSOR_IDENTIFIER%% %%PROCESSOR_LEVEL%% %%PROCESSOR_REVISION%%  ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo Number of Processors: %%NUMBER_OF_PROCESSORS%%  ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo CPU Details: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo wmic cpu get name,CurrentClockSpeed,MaxClockSpeed ^> c:\se_setup\SOFTWAREPM\cpu.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo CPU Tempearature: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "function Get-Temperature {; $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace 'root/wmi'; $currentTempKelvin = $t.CurrentTemperature / 10; $currentTempCelsius = $currentTempKelvin - 273.15; $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32; return $currentTempCelsius.ToString() + ' C : ' + $currentTempFahrenheit.ToString() + ' F : ' + $currentTempKelvin + 'K'; } ; get-temperature" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type c:\se_setup\SOFTWAREPM\cpu.txt ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\SOFTWAREPM\cpu.txt ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo HARD DRIVE INFORMATION: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Drive Name;Free Space;Total Size ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f "tokens=1-3" %%%%a in ('WMIC LOGICALDISK GET FreeSpace^^^,Name^^^,Size ^^^|FINDSTR /I /V "Name"') do ^@echo wsh.echo "%%%%b  ;" ^^^& "" ^^^& FormatNumber^^^(cdbl^^^(%%%%a^^^)/1024/1024/1024, 0^^^)^^^& "GB; "^^^& "" ^^^& FormatNumber^^^(cdbl^^^(%%%%c^^^)/1024/1024/1024, 0^^^)^^^& "GB      " ^> %%temp%%\tmp.vbs ^& @if not "%%%%c"=="" @echo( ^& @cscript //nologo %%temp%%\tmp.vbs ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv ^& del %%temp%%\tmp.vbs >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv ^| findstr /v "Drive" ^>^>c:\se_setup\SOFTWAREPM\pmHDD.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesa.csv) -replace ',', '.' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesb.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesb.csv) -replace 'GB.', 'GB,' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesc.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesc.csv^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo for /f "tokens=1-3" %%%%a in ('WMIC LOGICALDISK GET FreeSpace^^^,Name^^^,Size ^^^|FINDSTR /I /V "Name"') do ^@echo wsh.echo "%%%%b," ^^^& "" ^^^& FormatNumber^^^(cdbl^^^(%%%%a^^^)/1024/1024/1024, 2^^^)^^^& " GB,"^^^& "" ^^^& FormatNumber^^^(cdbl^^^(%%%%c^^^)/1024/1024/1024, 2^^^)^^^& " GB" ^> %%temp%%\tmp.vbs ^& @if not "%%%%c"=="" @echo( ^& @cscript //nologo %%temp%%\tmp.vbs ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv ^& del %%temp%%\tmp.vbs >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo goto skiphp >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd C:\Program Files\hp\hpssacli\bin >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo hpssacli controller all show status ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo hpssacli controller slot=0 pd all show status ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo hpssacli controller slot=0 ld all show status ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo hpssacli controller slot=0 pd all show detail ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo for /f "tokens^=1-3" %%%%a in ('WMIC LOGICALDISK GET FreeSpace^,Name^,Size ^^^|FINDSTR /I /V "Name"') do @echo wsh.echo "%%%%b" ^& " free^=" ^& FormatNumber^(cdbl^(%%%%a^)/1024/1024/1024, 2^)^& " GB"^& " size^=" ^& FormatNumber^(cdbl^(%%%%c^)/1024/1024/1024, 2^)^& " GB" ^> %%temp%%\tmp.vbs & @if not "%%%%c"=="" @echo( & @cscript //nologo %%temp%%\tmp.vbs ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv ^& del %%temp%%\tmp.vbs >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo del c:\se_setup\SOFTWAREPM\HDD*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\SE_SETUP\drives.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do ^@%%%%i: 2^>nul ^&^& set/pz^=%%%%i^<nul^>^> c:\se_setup\drives.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat 
rem echo for %%%%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do @%%%%i: 2^>nul && set/pz=%%%%i<nul^>^> c:\SE_SETUP\drives.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p drives=^<c:\SE_SETUP\drives.txt  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%d in (%%drives%%) do (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo %%%%d: (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%%%d: ^>^>c:\se_setup\SOFTWAREPM\HDD1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /p/w ^| findstr Serial ^>^>c:\se_setup\SOFTWAREPM\HDD1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo wmic diskdrive get serialnumber ^>^>c:\se_setup\SOFTWAREPM\HDD.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo wmic diskdrive list brief /format:list ^>^>c:\se_setup\SOFTWAREPM\HDD.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo wmic logicaldisk get caption,description,drivetype,providername,volumename ^>^>c:\se_setup\SOFTWAREPM\HDD.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\HDD.txt ^>^> c:\se_setup\SOFTWAREPM\HDD1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\HDD1.txt ^>^> c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\HDD*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\SOFTWAREPM\sysinfo*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo :skiphp >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo wmic diskdrive get /format:csv ^| Findstr "," ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesdiskdrive.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo wmic volume get /format:csv ^| Findstr "," ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesvolume.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -command "Get-WmiObject Win32_VideoController | Export-Csv -Path c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\VideoCard.csv -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo powershell -command "Get-WMIObject Win32_Printer | Export-Csv -Path c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Printers.csv -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Firewall Status Information... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo FIREWALL STATUS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Netsh Advfirewall show allprofiles state ^| Findstr "State Profile" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus1.csv) -replace 'State                                 ', '' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus2.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus2.csv) -replace ':', ',' | Out-File c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus3.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus2.csv ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus.csv ^| findstr /v "STATUS:" ^>c:\se_setup\SOFTWAREPM\pmfw.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Remote Desktop Status Information... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo RDP STATUS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"


echo qwinsta ^| findstr "Listen" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo Remote Desktop Connection is Enabled on this Machine.  ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%errorlevel%% neq 0 echo Remote Desktop Connection is Disabled on this Machine.  ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"

echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv ^| findstr /v "STATUS" ^>C:\SE_SETUP\SOFTWAREPM\pmrdp.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo goto skiprdp3 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections ^| find "x" ^>c:\se_setup\SOFTWAREPM\RDP1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\RDP1.txt) -replace '    fDenyTSConnections    REG_DWORD    0x', '' | Out-File c:\se_setup\SOFTWAREPM\RDP.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p rdp=^<c:\SE_SETUP\SOFTWAREPM\RDP.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%rdp:~2%%==1 echo Remote Desktop Connection is Disabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%rdp:~2%%==0 echo Remote Desktop Connection is Enabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"



echo del c:\se_setup\SOFTWAREPM\RDP*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :skiprdp3 >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling ScreenSaver Status Information... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo SCREENSAVER STATUS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScreenSaverStatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v SCRNSAVE.EXE ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%%==0 echo ScreenSaver is Enabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScreenSaverStatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%errorlevel%%==1 echo ScreenSaver is Disabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScreenSaverStatus.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"





echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Windows Update Configuration... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo WINDOWS UPDATE CONFIG: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"

echo reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v CachedAUOptions ^| find "CachedAUOptions" ^>c:\se_setup\SOFTWAREPM\WinUpdate1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%%==0 (goto winup) ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"


echo reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions ^| find "AUOptions" ^>c:\se_setup\SOFTWAREPM\WinUpdate1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%%==1 (goto winupskip) ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"

echo :winup >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\WinUpdate1.txt) -replace '    CachedAUOptions    REG_DWORD    0x', '' -replace '    AUOptions    REG_DWORD    0x', '' | Out-File c:\se_setup\SOFTWAREPM\WinUpdate.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\WinUpdate1.txt) -replace '    AUOptions    REG_DWORD    0x', '' | Out-File c:\se_setup\SOFTWAREPM\WinUpdate.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p WinUpdate=^<c:\SE_SETUP\SOFTWAREPM\WinUpdate.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%WinUpdate:~2%%==1 echo Windows Update is Disabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%WinUpdate:~2%%==2 echo Windows Update is set to Check for Updates but let me choose whether to Download and Install them on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%WinUpdate:~2%%==3 echo Windows Update is set to Download Updates but let me choose whether to Install them on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%WinUpdate:~2%%==4 echo Windows Update is set to Install updates Automatically on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo del c:\se_setup\SOFTWAREPM\WinUpdate*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :winupnoskip >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\WinUpdate*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto winupnoskip2 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :winupskip >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo wmic service get displayname,state ^| find "Windows Update" ^>c:\se_setup\svc.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd C:\se_setup >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\se_setup\svc.txt ^| findstr "Running" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% neq 0 echo Windows Update Service is Stopped on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo Windows Update Service is Running but not configured on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo :winupnoskip2 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\WinUpdate*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\svc*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo User Account Control Status Information... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo USER ACCOUNT CONTROL STATUS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\UAC.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"

echo reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA ^| find "EnableLUA" ^>c:\se_setup\SOFTWAREPM\UAC1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% GTR 0 echo     EnableLUA    REG_DWORD    1x1 ^>c:\se_setup\SOFTWAREPM\UAC1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin ^| find "ConsentPromptBehaviorAdmin" ^>c:\se_setup\SOFTWAREPM\UAC1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\UAC1.txt) -replace '    EnableLUA    REG_DWORD    0x', '' | Out-File c:\se_setup\SOFTWAREPM\UAC.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p UAC=^<c:\SE_SETUP\SOFTWAREPM\UAC.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%UAC:~2%% NEQ 0 echo UAC is Enabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\UAC.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo if %%UAC:~2%%==0 echo UAC is Disabled on this Machine. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\UAC.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat"
echo del c:\se_setup\SOFTWAREPM\UAC*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat













echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling all Installed Applications... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo INSTALLED APPLICATIONS AND VERSIONS: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Applications.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo wmic product get name,version,InstallDate ^>c:\se_setup\SOFTWAREPM\apps.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo powershell -Command "Invoke-Command -ScriptBlock {Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select InstallDate, DisplayName, ParentDisplayName, Publisher, Size, DisplayVersion } | sort InstallDate -Descending | Export-Csv -Path c:\se_setup\SOFTWAREPM\apps.txt -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo wmic product get name,version,installdate /format:csv ^>c:\se_setup\SOFTWAREPM\apps.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps.txt ^| findstr /i /v "node" ^>C:\SE_SETUP\SOFTWAREPM\apps1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem FOR /f "tokens=2-3 delims=  " %%%%u IN (C:\SE_SETUP\SOFTWAREPM\apps1.txt) DO echo %%%%u^>^>C:\SE_SETUP\SOFTWAREPM\apps2.txt

echo powershell -Command "(gc C:\SE_SETUP\SOFTWAREPM\apps1.txt) -replace '%%computername%%', '' | Out-File C:\SE_SETUP\SOFTWAREPM\apps2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "Continuum" ^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "INET" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "Symmetry" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "xpert" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "tureware" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "genetec" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "onssi" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "milestone" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "nice" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "qognify" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "pelco" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr "DS " ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "salient" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "CompleteView" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "avigilon" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "stratus" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "everrun" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "nec" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "pdi" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "idworks" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "passagepoint" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "easylobby" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "vista" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "endura" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "reports" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat




rem echo type C:\SE_SETUP\SOFTWAREPM\apps2.txt ^| Findstr /i "Engine" ^>^>C:\SE_SETUP\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\apps3.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\apps4.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\SE_SETUP\SOFTWAREPM\apps4.txt) -replace ',', '  ' | Out-File C:\SE_SETUP\SOFTWAREPM\apps5.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\SOFTWAREPM\apps5.txt ^> C:\SE_SETUP\SOFTWAREPM\apps6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary12=^<C:\SE_SETUP\SOFTWAREPM\apps6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo type c:\se_setup\SOFTWAREPM\apps.txt ^| Findstr "," ^>^> c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Applications.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat





echo set "pmvnc=TightVNC is Not Installed" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "pmtrend=Trend Micro is Not Installed" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo powershell -command "Get-WmiObject -Class Win32_Product | Select-Object name,version,installdate | Out-file c:\se_setup\SOFTWAREPM\apps5.txt -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type C:\SE_SETUP\SOFTWAREPM\apps.txt ^| Findstr /i "trend" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "pmtrend=Trend Micro is Installed" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\SOFTWAREPM\apps.txt ^| Findstr /i "TightVNC" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "pmvnc=TightVNC is Installed" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo del c:\se_setup\SOFTWAREPM\apps*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling all Installed Microsoft Patch Updates... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo INSTALLED PATCHES BY DATE: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "get-wmiobject -class win32_quickfixengineering | sort InstalledOn -Descending | Export-Csv -Path c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches1.csv -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "get-wmiobject -class win32_quickfixengineering | sort InstalledOn -Descending | Format-Table -Property Description,HotFixID,InstalledBy,InstalledOn -Autosize" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo wmic qfe list full /format:csv ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches1.csv ^| Findstr "," ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo FOR /f "tokens=1-2 skip=1 delims=," %%%%a IN ('type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches.csv') DO (echo %%%%a , %%%%b ^>^>c:\se_setup\SOFTWAREPM\pmPatches.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo SQL DATABASES AND SIZES: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo osql -E -S %%sqlinstance%% -Q "set nocount on; SELECT name FROM sys.databases" ^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%%\SECURITYEXPERT -Q "set nocount on; SELECT name FROM sys.databases" ^>^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%%\SECURITYEXPERT -Q "set nocount on; SELECT name FROM sys.databases" ^>^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "SecurityExpert" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo sexpert ^>^>c:\se_setup\sexpert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo mkdir C:\SE_SETUP >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checking for SQL instance... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -L ^>c:\se_setup\instances3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 9009 goto sqlchecke >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo osql -E -S %%computername%%\SQLEXPRESS -Q "select * from sys.databases" ^| findstr "master" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlcheckb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%%\omnicast -Q "select * from sys.databases" ^| findstr "master" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlcheckb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\instances3.txt ^| findstr "%%computername%%" ^>c:\se_setup\instances2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo sort /R C:\SE_SETUP\instances2.txt ^>C:\SE_SETUP\instances2a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\instances2a.txt) -replace ' ', '' | Out-File c:\se_setup\instances.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "Get-Content c:\se_setup\instances.txt | select-object -First 1 >c:\se_setup\instances4.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\SE_SETUP\instances4.txt ^> c:\SE_SETUP\instances5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p sqlinstance=^<c:\SE_SETUP\instances5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 more c:\se_setup\instances.txt +1 ^>c:\se_setup\instances6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\SE_SETUP\instances6.txt ^> c:\SE_SETUP\instances7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p sqlinstance=^<c:\SE_SETUP\instances6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo osql -E -S %%sqlinstance%% -Q " set nocount on select name from sys.databases" -h-1 -n ^| findstr /v "master" ^| findstr /v "tempdb" ^| findstr /v "model" ^| findstr /v "msdb" ^| findstr /v "\-\-\-" ^>c:\se_setup\instances20.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\instances20.txt) | ? {$_.trim() -ne '' } >c:\se_setup\instances21.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%R in (c:\se_setup\instances21.txt) do if not %%%%~zR lss 1 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%R in (c:\se_setup\instances21.txt) do if %%%%~zR lss 1 goto chksql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :chksql >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo osql -E -S %%sqlinstance%% -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% NEQ 0 goto sqlchecke >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checking for SQL instance... >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo set  sqlinstance=%%computername%%\SECURITYEXPERT >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto sqlcheckaa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "sqlinstance=%%computername%%\SECURITYEXPERT" ^& goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :sqlcheckaa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set  sqlinstance=%%computername%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%% -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto sqlchecka >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :sqlchecka >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set sqlinstance=(local) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S (local) -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto sqlcheckb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :sqlcheckb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set sqlinstance=%%computername%%\SQLEXPRESS >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%%\SQLEXPRESS -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto sqlcheckc >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :sqlcheckc >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set sqlinstance=%%computername%%\DS_MSSQLSERVER >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%%\DS_MSSQLSERVER -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto sqlcheckd >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :sqlcheckd >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set sqlinstance=%%computername%%\omnicast >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%%\omnicast -Q "" ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% NEQ 0 goto sqlchecke >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 goto sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :sqlchecke >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ECHO N/A NO SQL DATABASE FOUND ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "dbpresent=0" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :sqlpassa >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "dbpresent=1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo echo SQL instance is %%sqlinstance%% ^>c:\se_setup\SQLinstance.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo osql -E -S %%sqlinstance%% -Q "set nocount on SELECT CONVERT(DECIMAL(10,2),(SUM(size * 8.00) / 1024.00 / 1024.00)) As UsedSpace FROM master.sys.master_files" -h-1 ^>c:\se_setup\summary5a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if exist c:\se_setup\sexpert.txt osql -E -S %%computername%%\SECURITYEXPERT -Q "set nocount on SELECT CONVERT(DECIMAL(10,2),(SUM(size * 8.00) / 1024.00 / 1024.00)) As UsedSpace FROM master.sys.master_files" -h-1 ^>^>c:\se_setup\summary5a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\summary5a.txt) -replace ' ', '' | Out-File C:\SE_SETUP\summary5b.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\SE_SETUP\summary5b.txt ^> c:\SE_SETUP\summary5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary5=^<C:\SE_SETUP\summary5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%summary5%% GTR 20 set "summary6=+++All databases are above 20GB. Truncation is Needed." >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo osql -E -S %%sqlinstance%% -Q "set nocount on; with fs as(select database_id, type, size * 8.0 / 1024 size from sys.master_files)select name,(select sum(size) from fs where type = 0 and fs.database_id = db.database_id) DataFileSizeMB,(select sum(size) from fs where type = 1 and fs.database_id = db.database_id) LogFileSizeMB from sys.databases db" -w2000 -n -s"|" ^>c:\se_setup\SOFTWAREPM\sqltable.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on; EXECUTE sp_MSForEachDB 'USE ?; SELECT DB_NAME() AS DbName,name AS FileName, type_desc,state_desc,size/128.0 AS CurrentSizeMB,size/128.0 - CAST(FILEPROPERTY(name, ''SpaceUsed'') AS INT)/128.0 AS FreeSpaceMB,CAST((((size/128.0 - CAST(FILEPROPERTY(name, ''SpaceUsed'') AS INT)/128.0) * 100) / (size/128.0)) AS numeric(36,2)) AS PercentFree,physical_name FROM sys.database_files;'" -w2000 -n -s"|" ^>c:\se_setup\SOFTWAREPM\sqltable.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if exist c:\se_setup\sexpert.txt osql -E -S %%computername%%\SECURITYEXPERT -Q "set nocount on; EXECUTE sp_MSForEachDB 'USE ?; SELECT DB_NAME() AS DbName,name AS FileName, type_desc,state_desc,size/128.0 AS CurrentSizeMB,size/128.0 - CAST(FILEPROPERTY(name, ''SpaceUsed'') AS INT)/128.0 AS FreeSpaceMB,CAST((((size/128.0 - CAST(FILEPROPERTY(name, ''SpaceUsed'') AS INT)/128.0) * 100) / (size/128.0)) AS numeric(36,2)) AS PercentFree,physical_name FROM sys.database_files;'" -w2000 -n -s"|" ^>^>c:\se_setup\SOFTWAREPM\sqltable.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqltable.txt) -replace '                                                                                                 ', '' | Out-File c:\se_setup\SOFTWAREPM\sqltable1.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqltable1.txt) -replace '-------------------------------------------------------------------------------------------------', '' | Out-File c:\se_setup\SOFTWAREPM\sqltable2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqltable2.txt) -replace '-----------------------------------------------', '' | Out-File c:\se_setup\SOFTWAREPM\sqltable3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqltable3.txt) -replace '                                               ', '' | Out-File c:\se_setup\SOFTWAREPM\sqltable4.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqltable.txt) -replace '                          ', '' | Out-File c:\se_setup\SOFTWAREPM\sqltable1.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\sqltable4.txt ^>^> c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\sqltable*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on; EXECUTE sp_MSForEachDB 'USE ?; SELECT t.NAME AS TableName,p.rows AS RowCounts, SUM(a.total_pages) * 8 AS TotalSpaceKB, SUM(a.used_pages) * 8 AS UsedSpaceKB, (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB FROM sys.tables t INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id WHERE t.NAME NOT LIKE ''dt%%%%'' AND t.NAME NOT LIKE ''#%%%%'' AND t.is_ms_shipped = 0 AND i.OBJECT_ID > 255 GROUP BY t.Name, s.Name, p.Rows ORDER BY SUM(a.used_pages) desc'" -w2000 -n -s"|" ^>c:\se_setup\sqltablesize.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if exist c:\se_setup\sexpert.txt osql -E -S %%computername%%\SECURITYEXPERT -Q "set nocount on; EXECUTE sp_MSForEachDB 'USE ?; SELECT t.NAME AS TableName,p.rows AS RowCounts, SUM(a.total_pages) * 8 AS TotalSpaceKB, SUM(a.used_pages) * 8 AS UsedSpaceKB, (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB FROM sys.tables t INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id LEFT OUTER JOIN sys.schemas s ON t.schema_id = s.schema_id WHERE t.NAME NOT LIKE ''dt%%%%'' AND t.NAME NOT LIKE ''#%%%%'' AND t.is_ms_shipped = 0 AND i.OBJECT_ID > 255 GROUP BY t.Name, s.Name, p.Rows ORDER BY SUM(a.used_pages) desc'" -w2000 -n -s"|" ^>^>c:\se_setup\sqltablesize.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\sqltablesize.txt) -replace 'TableName                                                                                                                       ', 'TableName                        ' | Out-File c:\se_setup\sqltablesize1.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\sqltablesize1.txt) -replace '                                                                                               |', '' | Out-File c:\se_setup\sqltablesize2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\sqltablesize2.txt) -replace '-----------------------------------------------------------------------------------------------|', '' | Out-File c:\se_setup\sqltablesize3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\sqltablesize3.txt ^>^> c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\sqltablesize*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\instance*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on; SELECT member.name AS MemberName,role.name AS RoleName, role.type_desc, role.is_disabled,role.create_date,role.modify_date,role.default_database_name FROM sys.server_role_members JOIN sys.server_principals AS role ON sys.server_role_members.role_principal_id = role.principal_id JOIN sys.server_principals AS member ON sys.server_role_members.member_principal_id = member.principal_id;  " -w2000 -n -s"|" ^>c:\se_setup\sqlusers.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\sqlusers.txt) -replace 'TableName                                                                                                                       ', 'TableName                        ' | Out-File c:\se_setup\sqlusers1.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\sqlusers1.txt) -replace '                                                                                               |', '' | Out-File c:\se_setup\sqlusers2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\sqlusers2.txt) -replace '-----------------------------------------------------------------------------------------------|', '' | Out-File c:\se_setup\sqlusers3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\sqlusers3.txt ^>^> c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\sqlusers*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat








rem echo echo SOFTWARE POINTS: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo osql -E -S %%sqlinstance%% -Q "set nocount on; SELECT name FROM sys.databases" ^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "VISION" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto SEX >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :Qognify >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem ECHO Qognify or NICE Cameras >>c:\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\PointsQognifyCameras.csv


echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=6^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo sqlcmd -E -S %%sqlinstance%% -Q "use VISION_DB select s.servername [NVR Name], s.IPAddress [NVR IP Address], s.version [NVR Version], c.ChannelName [Camera name], d.DeviceName [Manufacturer], d.IPAddress [Camera IP Address] from [VISION_DB].[dbo].[V_CHANNEL] c inner join [VISION_DB].[dbo].[V_DEVICE] d on c.DeviceID = d.DeviceID inner join [VISION_DB].[dbo].[T_SERVER_INFO] s on s.ServerID = c.ServerID where c.Status = 1 order by s.ServerName,c.ChannelName" -s^"^|^" -m 1 -W ^| findstr /v ^"\-\-\-^" ^| findstr /v ^"affected^" ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsQognifyCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem ===========================================================================================================================================================================63

echo :SEX >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo osql -E -S %%sqlinstance%% -Q "set nocount on; SELECT name FROM sys.databases" ^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%computername%%\SECURITYEXPERT -Q "set nocount on; SELECT name FROM sys.databases" ^>^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%%\SECURITYEXPERT -Q "set nocount on; SELECT name FROM sys.databases" ^>^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqldbs1.txt) -replace ' ', '' ^| Out-File c:\se_setup\SOFTWAREPM\sqldbs.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "SecurityExpert" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto conta >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo SecurityXpert NETWORK CONTROLLERS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set sqlinstance=%%computername%%\SECURITYEXPERT >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%sqlinstance%% ^>c:\se_setup\inst.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo use SecurityExpert SELECT [ControllerID],[SiteID],[Name],[Name2],[IPAddress],[LastDownloaded],[IPPort],[LastModified],[Created] FROM [SecurityExpert].[dbo].[Controllers] ^>c:\SE_SETUP\XpertCONTROLLER.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo use SecurityExpert SELECT [CameraID],[SiteID],[Name],[Name2],[IPAddress],[DVR],[Username],[LastModified],[Created] FROM [SecurityExpert].[dbo].[Cameras] ^>^>c:\SE_SETUP\XpertCONTROLLER.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CD SE_SETUP >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=5^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -iXpertCONTROLLER.sql -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^| findstr /v ^"affected^" ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertCX.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo osql -E -S %%sqlinstance%% -iCONTCONTROLLER.sql -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\SE_SETUP\XpertCONTROLLER.sql /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [SecurityExpert].[dbo].[InfinityController]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo SecurityXpert OLDEST EVENT ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use SecurityExpertEvents SELECT TOP 1 fieldtime FROM [SecurityExpertEvents].[dbo].[Events] where fieldtime > '1990-01-01 00:00:09.000' order by fieldtime asc"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SecurityXpert OLDEST ALARM ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use SecurityExpertEvents SELECT TOP 1 fieldtime FROM Alarms order by fieldtime asc"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p summary3=^<C:\SE_SETUP\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary3b=^<C:\SE_SETUP\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo SecurityXpert OLDEST EVENT AND ALARM ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo SecurityXpert OLDEST EVENT: %%summary3%% ; SecurityXpert OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo SecurityXpert OLDEST EVENT: %%summary3%% ; SecurityXpert OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SUMMARY_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SecurityXpert INFINET CONTROLLERS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertInfinet.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [SecurityExpert].[dbo].[InfinityInfinetCtlr]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertInfinet.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SecurityXpert IOU MODULES ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertIOU.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [SecurityExpert].[dbo].[Ioumodule]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertIOU.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SecurityXpert DOORS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertDoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT [DoorID],[ControllerID],[Name],[Name2],[DoorType],[LockPGM],[UnlockDoorOnREX] FROM [SecurityExpert].[dbo].[Doors]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertDoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SecurityXpert INPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT [ZoneID],[ControllerID],[Name],[Name2],[Module],[ModuleAddress],[ModuleZone],[InputEndOfLine] FROM [SecurityExpert].[dbo].[zones]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo SecurityXpert OUTPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT [PGMID],[ControllerID],[Name],[Name2],[Module],[ModuleOutput],[ModuleAddress] FROM [SecurityExpert].[dbo].[PGMs]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem ===========================================================================================================================================================================



echo :conta >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on; SELECT name FROM sys.databases" ^>c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sqldbs1.txt) -replace ' ', '' ^| Out-File c:\se_setup\SOFTWAREPM\sqldbs.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "ContinuumDB" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto inet >>C:\SE_SETUP\SOFTWAREPM\setup.bat






rem echo echo CONTINUUM NETWORK CONTROLLERS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo use continuumdb SELECT uiname,ControllerName, Description,Location,EthernetId,CAST(ROUND( (cast(cast(ipaddress as binary(4)) as bigint) / 16777216 ), 0, 1) AS varchar(4)) + '.' + CAST((ROUND( (cast(cast(ipaddress as binary(4)) as bigint) / 65536 ), 0, 1) %%%% 256) AS varchar(4)) + '.' + CAST((ROUND( (cast(cast(ipaddress as binary(4)) as bigint) / 256 ), 0, 1) %%%% 256) AS varchar(4)) + '.' + CAST((cast(cast(ipaddress as binary(4)) as bigint) %%%% 256 ) AS varchar(4)) as IPaddress, ^>c:\SE_SETUP\CONTCONTROLLER.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo CAST(ROUND( (cast(cast(subnetmask as binary(4)) as bigint) / 16777216 ), 0, 1) AS varchar(4)) + '.' + CAST((ROUND( (cast(cast(subnetmask as binary(4)) as bigint) / 65536 ), 0, 1) %%%% 256) AS varchar(4)) + '.' + CAST((ROUND( (cast(cast(subnetmask as binary(4)) as bigint) / 256 ), 0, 1) %%%% 256) AS varchar(4)) + '.' + CAST((cast(cast(subnetmask as binary(4)) as bigint) %%%% 256 ) AS varchar(4)) as SubnetMask, ^>^>c:\SE_SETUP\CONTCONTROLLER.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo CAST(ROUND( (cast(cast(defaultrouter as binary(4)) as bigint) / 16777216 ), 0, 1) AS varchar(4)) + '.' + CAST((ROUND( (cast(cast(defaultrouter as binary(4)) as bigint) / 65536 ), 0, 1) %%%% 256) AS varchar(4)) + '.' + CAST((ROUND( (cast(cast(defaultrouter as binary(4)) as bigint) / 256 ), 0, 1) %%%% 256) AS varchar(4)) + '.' + CAST((cast(cast(defaultrouter as binary(4)) as bigint) %%%% 256 ) AS varchar(4)) as DefaultRouter,CntrlType,NetworkId,ProbeTime,SerialNum,VersionNum,BACnetDeviceId,BacnetMaxMaster,BacnetMSTPNetNum,BacnetUDPNetNum from infinitycontroller ^>^>c:\SE_SETUP\CONTCONTROLLER.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CD SE_SETUP >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=6^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -iCONTCONTROLLER.sql -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^| findstr /v ^"affected^" ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumCX.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo osql -E -S %%sqlinstance%% -iCONTCONTROLLER.sql -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\SE_SETUP\CONTCONTROLLER.sql /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat





rem echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [ContinuumDB].[dbo].[InfinityController]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat




rem echo echo CONTINUUM OLDEST EVENT ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use continuumdb SELECT TOP 1 timestamp FROM [ContinuumDB].[dbo].[AccessEvent] where TimeStamp > '1990-01-01 00:00:09.000' and eventclass = '0' order by TimeStamp asc"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CONTINUUM OLDEST ALARM ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use continuumDB SELECT TOP 1 TimeStamp FROM AlarmEvent where TimeStamp > '1990-12-30' order by TimeStamp asc"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p summary3=^<C:\SE_SETUP\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary3b=^<C:\SE_SETUP\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo CONTINUUM OLDEST EVENT AND ALARM ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo CONTINUUM OLDEST EVENT: %%summary3%% ; CONTINUUM OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo CONTINUUM OLDEST EVENT: %%summary3%% ; CONTINUUM OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SUMMARY_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CONTINUUM INFINET CONTROLLERS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInfinet.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [ContinuumDB].[dbo].[InfinityInfinetCtlr]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInfinet.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CONTINUUM IOU MODULES ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumIOU.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [ContinuumDB].[dbo].[Ioumodule]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumIOU.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CONTINUUM DOORS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumDoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT [uiName],[ControllerName],[Description],[AlarmRelayTime],[ArmCode],[CardFormats],[DoorAjarTime],[DoorChannel],[DoorStrikeTime],[DoorSwitchChan],[DoorSwitchType],[EntryAntiPassTim],[EntryIOU],[EntryChannel],[EntryEntEgr],[EntryEntrAntiPas],[EntryEntrEntEgr],[EntryEntrRvrsCrd],[EntryKyPdChan],[EntryNoCommMode],[GeneralCode],[Invert],[OpenOnExitReqst],[RelockOnClose],[Site1],[Site2] ,[Site3],[Site4],[State],[OperatingMode],[AlarmValue],[ForcedEntryDelay],[CardFormats2] ,[ForceLock] FROM [ContinuumDB].[dbo].[Door]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumDoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CONTINUUM INPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT [uiName],[ControllerName],[Description],[Format],[Invert],[IOU],[ResistorType],[State] ,[Triggers],[Units],[Value] FROM [ContinuumDB].[dbo].[InfinityInput]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CONTINUUM OUTPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT [uiName],[ControllerName],[Description],[Format],[Invert],[IOU],[ElecType],[State] ,[Triggers],[Units],[Value] FROM [ContinuumDB].[dbo].[InfinityOutput]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo :inet >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "InetDb" c:\se_setup\SOFTWAREPM\sqldbs.txt ^&^& (goto ineta) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto amag >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :ineta >>C:\SE_SETUP\SOFTWAREPM\setup.bat





rem echo echo INET OLDEST EVENT ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use inetdb SELECT TOP 1 EventTime FROM Events where IndivNdx > '0' and EventTime > '1990-12-30' order by EventTime asc"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo INET OLDEST ALARM ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use inetdb SELECT TOP 1 EventTime FROM Events where IndivNdx = '0' and EventTime > '1990-12-30' order by EventTime asc"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p summary3=^<C:\SE_SETUP\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary3b=^<C:\SE_SETUP\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo INET OLDEST EVENT AND ALARM ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETevent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo INET OLDEST EVENT: %%summary3%% ; INET OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETevent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo INET OLDEST EVENT: %%summary3%% ; INET OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SUMMARY_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo INET LINKS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem echo del c:\se_setup\INET_RoutingTable.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo taskkill /f /IM "Telnet*" ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>c:\SE_SETUP\sendkeys1.vbs ECHO set OBJECT=WScript.CreateObject^("WScript.Shell"^) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "set logfile c:\se_setup\INET_RoutingTable.txt{ENTER}"  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "open %%computername%%{ENTER}"  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "csi{ENTER}"  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "csi{ENTER}"  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "LA{ENTER}"  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "^{C}"  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "quit{ENTER}" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>^>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys " "  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo start telnet.exe >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo cscript c:\se_setup\SendKeys1.vbs >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ping localhost -n 5 ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -command "[void][reflection.assembly]::loadwithpartialname('system.windows.forms');[system.windows.forms.sendkeys]::sendwait('^{]}')" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ping localhost -n 2 ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo taskkill /f /IM "Telnet*" ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type c:\se_setup\INET_RoutingTable.txt ^| findstr ",X," ^>c:\se_setup\INET_RoutingTable1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\INET_RoutingTable1.txt) -replace '->  ', '|' | Out-File c:\se_setup\INET_RoutingTable2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\INET_RoutingTable2.txt) -replace ',X,', '|' | Out-File c:\se_setup\INET_RoutingTable3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\INET_RoutingTable3.txt) -replace ' ', '' | Out-File c:\se_setup\INET_RoutingTable4.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\INET_RoutingTable4.txt) -replace ' ', '' | Out-File c:\se_setup\INET_RoutingTable5.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo rem echo LINKADDR(HW)^^^|IP ADDR^^^|D LINK NAME_SS Table^>c:\se_setup\INET_RoutingTable6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type c:\se_setup\INET_RoutingTable5.txt^>^>c:\se_setup\INET_RoutingTable6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\INET_RoutingTable.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\INET_RoutingTable1.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\INET_RoutingTable2.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\INET_RoutingTable3.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\INET_RoutingTable4.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\INET_RoutingTable5.txt /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\sendkeys1.vbs /q ^>nul 2^>^&1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=2^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\INET_RoutingTable.txt ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo osql -E -S %%sqlinstance%% -Q "SELECT LinkId, Name, TypeText, Host, Downloadable, DlaLink FROM [InetDb].[dbo].[NetConLink] inner join [InetDb].[dbo].[NetConLinkType] on [InetDb].[dbo].[NetConLink].TypeNdx = [InetDb].[dbo].[NetConLinkType].TypeId"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo INET CONTROLLERS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETcontrollers.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT Name, TypeText, LinkNdx, StaId, BaseStaNdx FROM [InetDb].[dbo].[NetConDCU] inner join [InetDb].[dbo].[NetConDCUType] on [InetDb].[dbo].[NetConDCU].TypeNdx = [InetDb].[dbo].[NetConDCUType].TypeId"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETcontrollers.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo INET MODULE (DIO/DPU/DIU) ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETmodule.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT linkndx,standx,pointid,typendx,revno,downloadable,dputype,typetext FROM [InetDb].[dbo].[NetConMCU] inner join [InetDb].[dbo].[NetConMCUType] on [InetDb].[dbo].[NetConMCU].TypeNdx = [InetDb].[dbo].[NetConMCUType].TypeId order by LinkNdx, standx, PointId"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETmodule.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo INET DOORS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETdoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use inetdb SELECT r.PointAddress,Name FROM DoorsFloorsView d inner join InetDb.dbo.RptDoors r on d.DoorId=r.DoorId WHERE FloorNum=0 AND d.DoorId>=0 AND d.DoorId<=52428698 ORDER BY d.DoorId,FloorNum"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETdoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo INET INPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETinputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use inetdb SELECT inetdb.dbo.points.PntName AS PointName, dbo.GetPointAddress(PointId) AS PointAddress, CASE WHEN ClasStaExt < '500' and ClasStaExt >= '256' THEN 'Internal Point' WHEN ClasStaExt < '500' and ClasStaExt >= '0' THEN 'External Point' WHEN ClasStaExt < '700' and ClasStaExt >= '512' THEN 'Internal Point' WHEN ClasStaExt < '1500' and ClasStaExt >= '1280' THEN 'Internal Point' WHEN ClasStaExt < '1200' and ClasStaExt >= '1024' THEN 'External Point' ELSE 'N/A' END AS 'PointType' FROM dbo.Points  WHERE dbo.GetPointAddress(PointId) like '%%%%DA%%%%' OR dbo.GetPointAddress(PointId) like '%%%%DI%%%%' order by PointAddress asc"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETinputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo INET OUTPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINEToutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use inetdb SELECT inetdb.dbo.points.PntName AS PointName, dbo.GetPointAddress(PointId) AS PointAddress, CASE WHEN ClasStaExt < '500' and ClasStaExt >= '256' THEN 'Internal Point' WHEN ClasStaExt < '500' and ClasStaExt >= '0' THEN 'External Point' WHEN ClasStaExt < '700' and ClasStaExt >= '512' THEN 'Internal Point' WHEN ClasStaExt < '1500' and ClasStaExt >= '1280' THEN 'Internal Point' WHEN ClasStaExt < '1200' and ClasStaExt >= '1024' THEN 'External Point' ELSE 'N/A' END AS 'PointType' FROM dbo.Points  WHERE dbo.GetPointAddress(PointId) like '%%%%DO%%%%' and ClasStaExt < '600' order by PointAddress asc"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINEToutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :amag >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "multiMAX" c:\se_setup\SOFTWAREPM\sqldbs.txt ^&^& (goto amaga) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto PELCO >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :AMAGa >>C:\SE_SETUP\SOFTWAREPM\setup.bat




rem echo echo AMAG OLDEST EVENT ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use multiMAXTxn select top 1 datetimeoftxn from AlarmEventTransactionTable where TxnConditionName like 'Granted Access%%%%' order by DateTimeOfTxn asc"  -w2000 -h-1 ^>^>c:\se_setup\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo AMAG OLDEST ALARM ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use multiMAXTxn select top 1 datetimeoftxn from AlarmEventTransactionTable where devicetype <> '0' and DeviceType <> '82' order by DeviceType asc"  -w2000 -h-1 ^>^>c:\se_setup\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p summary3=^<C:\SE_SETUP\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary3b=^<C:\SE_SETUP\summary3b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo AMAG OLDEST EVENT AND ALARM ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo AMAG OLDEST EVENT: %%summary3%% ; AMAG OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo AMAG OLDEST EVENT: %%summary3%% ; AMAG OLDEST ALARM: %%summary3b%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SUMMARY_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo AMAG LAN CHAINS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagChains.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=4^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q ^"use multimax SELECT c.ChainName, c.ChainID,c.IsDisabled, (COALESCE(l.remoteipaddress1, '') + '.' + COALESCE(l.remoteipaddress2, '') + '.' + COALESCE(l.remoteipaddress3,'') + '.' + COALESCE(l.remoteipaddress4,'')) as IPAddress FROM [multiMAX].[dbo].[ChainTable] c INNER JOIN LANChainDetailTable l ON c.ChainID = l.ChainID order by c.ChainName^"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^| findstr /v ^"affected^" ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagChains.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem echo osql -E -S %%sqlinstance%% -Q "use multimax SELECT c.ChainName, c.ChainID,c.IsDisabled, (COALESCE(l.remoteipaddress1, '') + '.' + COALESCE(l.remoteipaddress2, '') + '.' + COALESCE(l.remoteipaddress3,'') + '.' + COALESCE(l.remoteipaddress4,'')) as IPAddress FROM [multiMAX].[dbo].[ChainTable] c INNER JOIN LANChainDetailTable l ON c.ChainID = l.ChainID order by c.ChainName"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagChains.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo AMAG NODES ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagNodes.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [multiMAX].[dbo].[NodeTable]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagNodes.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo AMAG DOORS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagDoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo SELECT r.ReaderName,r.ReaderID,n.NodeName,r.NodeID,c.ChainName,n.ChainID,c.isdisabled,^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ((COALESCE(l.remoteipaddress1, '') + '.' + COALESCE(l.remoteipaddress2, '') + '.' + COALESCE(l.remoteipaddress3,'') + '.' + COALESCE(l.remoteipaddress4,''))) [IP Address],^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo n.[NodeAddress],rt.[ReaderTypeName],^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo n.[DefaultWiegandFormat],[DoorControlUnitID],[ReaderState],[ReaderAPBMode],[ExitReqSupervision],^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo [DoorContactSupervision],[PassbackTime],[PINAttemptsBeforeDeletion],[UnlockRelayTime],[DoorOpenTime],[DoorPreheldTime],^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo [ExtendedUnlockTime],[ExtendedOpenTime],[ExtendedPreheldTime],r.[DelayTime],[HoldTime],[IfExitReqThenRelock],^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo [IfValidCardThenRelock],[BypassRelayOperation],[PseudoCustomerCode],[CardCommand],[InhibitWhileDoorOpen] ^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo FROM [multiMAX].[dbo].[ReaderTable] r inner join [multiMAX].[dbo].[NodeTable] n ON r.NodeID = n.NodeID ^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo inner join [multiMAX].[dbo].[ChainTable] c ON n.ChainID = c.[ChainID] ^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo inner join [multiMAX].[dbo].[ReaderTypeTable] rt ON r.[ReaderTypeID] = rt.[ReaderTypeID]^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo inner join [multiMAX].[dbo].[LanChainDetailTable] l on c.[ChainID] = l.chainid^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo order by ChainID,NodeID,ReaderID^>^>c:\se_setup\AMAGDOORS.sql >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CD SE_SETUP >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -iAMAGDOORS.sql -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagDoors.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\AMAGDOORS.sql /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo AMAG INPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [multiMAX].[dbo].[MonitorPointTable]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo AMAG OUTPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SELECT * FROM [multiMAX].[dbo].[AuxiliaryOutputTable]"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :pelco >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "DigitalS" c:\se_setup\SOFTWAREPM\sqldbs.txt ^&^& (GOTO PELCOA) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto GENETEC >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :PELCOA >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=xpa" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo PELCO ANALOG CAMERAS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoAnalog.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use DigitalSENTRY select DisplayText, MotionSensitivityChange, Premotion, PostMotion, RepeatNonMotionFramesForNonMotion, Faststoragerate, Mediumstoragerate, PreAnalytics from  CameraAssignment where active = '1' and cameratype = 'Analog' order by DisplayText"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoAnalog.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo PELCO IP CAMERAS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=2^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q ^"use DigitalSENTRY select DisplayText, IPAddress, Username, cameratype, case CompressionTypeId when 5 then 'H263' when 6 then 'H264' when 2 then 'iVEX' when 3 then 'MJPEG' when 4 then 'MPEG4' when 1 then 'Wavelet' Else 'Oher' End as 'CompressionType', Width, Height, MotionSensitivityChange, Premotion, PostMotion, RepeatNonMotionFramesForNonMotion, Faststoragerate, Mediumstoragerate,  MotionDetectionDoneInCamera, MotionDetectionDoneOnServer, AnalyticDetectionDoneInCamera, MaxFrameRate, disabled, inputnumber from IPCameras  INNER JOIN CameraAssignment ON IPCameras.cameraID = CameraAssignment.cameraID WHERE disabled = '0' order by IPAddress^"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^| findstr /v ^"affected^" ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^> c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem echo osql -E -S %%sqlinstance%% -Q "use DigitalSENTRY select DisplayText, IPAddress, Username, cameratype, case CompressionTypeId when 5 then 'H263' when 6 then 'H264' when 2 then 'iVEX' when 3 then 'MJPEG' when 4 then 'MPEG4' when 1 then 'Wavelet' Else 'Oher' End as 'CompressionType', Width, Height, MotionSensitivityChange, Premotion, PostMotion, RepeatNonMotionFramesForNonMotion, Faststoragerate, Mediumstoragerate,  MotionDetectionDoneInCamera, MotionDetectionDoneOnServer, AnalyticDetectionDoneInCamera, MaxFrameRate, disabled, inputnumber from IPCameras  INNER JOIN CameraAssignment ON IPCameras.cameraID = CameraAssignment.cameraID WHERE disabled = '0' order by IPAddress"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo osql -E -S %%sqlinstance%% -Q "SET NOCOUNT ON SELECT maxcameras from [DigitalSENTRY].[dbo].[ComputerLicense]" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Active Cameras ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "SET NOCOUNT ON SELECT COUNT(*) FROM [DigitalSENTRY].[dbo].[CameraAssignment] where  Disabled = '0'" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

 
echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :genetec >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo findstr /i "Archiver Directory" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto dblocgg >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 goto geneteca >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :dblocgg >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "AccessManager" c:\se_setup\SOFTWAREPM\sqldbs.txt ^&^& (GOTO geneteca) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto Salient >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 goto geneteca >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :geneteca >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=g64" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo GENETEC OLDSET EVENT ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "set nocount on use AccessManager Declare @var1 nvarchar(30) set @var1 = (SELECT top 1 name FROM sysobjects WHERE xtype = 'U' and name like 'Event%%' ORDER BY name asc) EXECUTE('select TOP 1 EventTimestamp from ' + @var1 + '' )"  -w2000 -h-1 -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p summary3=^<C:\SE_SETUP\summary3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo GENETEC OLDSET EVENT ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo GENETEC OLDEST EVENT: %%summary3%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecEvent.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo GENETEC OLDEST EVENT: %%summary3%%, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SUMMARY_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo GENETEC UNITS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo del C:\SE_SETUP\PING\*.* /s /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo mkdir C:\SE_SETUP\PING\MERGE >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pingcolumn=2^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q ^"use Directory SELECT e.Name as UnitName,u.ip,u.firmwareversion,u.guid ,e.CreationTime FROM [Directory].[dbo].[Unit] u inner join [Directory].[dbo].[Entity] e on e.Guid=u.Guid order by u.ip^"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^| findstr /v ^"affected^" ^>c:\se_setup\ping\Devices.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\SE_SETUP\PING\AllDevicesnew.txt ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecUnits.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo osql -E -S %%sqlinstance%% -Q "use Directory SELECT e.Name as UnitName,u.ip,u.firmwareversion,e.CreationTime FROM [Directory].[dbo].[Unit] u inner join [Directory].[dbo].[Entity] e on e.Guid=u.Guid order by u.ip"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecUnits.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo GENETEC CAMERAS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use Directory SELECT e.Name as CameraName, u.ip,e.CreationTime FROM [Directory].[dbo].[Device] d inner join Directory.dbo.Entity e on d.Guid=e.Guid inner join Directory.dbo.Unit u on u.Guid = d.Unit where TYPE = 6 and subtype = 5 order by u.ip"  -w2000 -n -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem ECHO GENETEC INPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use Directory SELECT [Name] FROM [Directory].[dbo].[Entity] where TYPE = 6 and (SubType = 2 or SubType =11) order by NAME"  -w2000 -n -s"^|" ^| findstr /v "\-\-\-" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecInputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem ECHO GENETEC OUTPUTS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo osql -E -S %%sqlinstance%% -Q "use Directory SELECT [Name] FROM [Directory].[dbo].[Entity] where TYPE = 6 and (SubType = 3 or SubType =12) order by NAME" -w2000 -n -s"^|" ^| findstr /v "\-\-\-" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecOutputs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat





echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat






echo :salient >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto milestone >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo if exist "C:\Program Files\Symmetry CompleteView\camerastate" goto salienta >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo if exist "C:\Program Files\CompleteView\camerastate" goto salienta >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo if exist "C:\Program Files\CompleteView" set "ext=avi" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo find /c "CompleteView" c:\se_setup\SOFTWAREPM\apps3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% equ 1 goto milestone >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% equ 0 goto salienta >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :salienta >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=avi" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Pointssalientcameras.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo salient ^>C:\SE_SETUP\SOFTWAREPM\dvr.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\salientcameras*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd "C:\Program Files\*CompleteView\camerastate" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /b /s ^>C:\se_setup\salientcameras1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=3 delims=_" %%%%a IN ('Type C:\se_setup\salientcameras1.csv') DO (echo %%%%a ^>^>C:\se_setup\salientcameras2.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=1 delims=." %%%%a IN ('Type C:\se_setup\salientcameras2.csv') DO (echo %%%%a ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Pointssalientcameras.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\salientcameras1.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\salientcameras2.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo ECHO MILESTONE CAMERAS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo sqlcmd -E -S%%sqlinstance%% -Q "use VideoOSDB SELECT Name FROM Central.Items where deleted = '0' and type like '%%%%343c0' ORDER BY name asc" -m 1 -W ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsMilestoneCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo sqlcmd -E -S%%sqlinstance%% -Q "use VideoOSDB SELECT Name FROM Central.Items where deleted = '0' and type like '%%%%343c0' ORDER BY name asc" -m 1 -W ^>c:\se_setup\milestonecamquery.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat






echo :milestone >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "VideoOSDB" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto onssi >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 goto milestonea >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :milestonea >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=pic" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo ECHO MILESTONE CAMERAS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo sqlcmd -E -S%%sqlinstance%% -Q "use VideoOSDB SELECT Name FROM Central.Items where deleted = '0' and type like '%%%%343c0' ORDER BY name asc" -m 1 -W ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsMilestoneCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo sqlcmd -E -S%%sqlinstance%% -Q "use VideoOSDB SELECT Name FROM Central.Items where deleted = '0' and type like '%%%%343c0' ORDER BY name asc" -m 1 -W ^>c:\se_setup\milestonecamquery.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat









echo :onssi >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "VSEvents" c:\se_setup\SOFTWAREPM\sqldbs.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 goto dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 goto onssia >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :onssia >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "ext=bix" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo ECHO ONSSI CAMERAS ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo sqlcmd -E -S%%sqlinstance%% -Q "use VSEvents SELECT h.ID,[Name],s.Label as ServerLabel,s.Protocol,s.PrimaryIPAddress AS ServerIPAddress,s.username AS ServerUserName,[IsLicensed] FROM [VSEvents].[dbo].[HardwareDevices] h inner join servers s on h.FK_Servers_ID = s.ID" -m 1 -W -s^"^|^" ^| findstr /v ^"\-\-\-^" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsOnssiCameras.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat










echo :dbloc >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\dbloc.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\sqldbs.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\instances*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo Searching for local Backups... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo LOCAL SQL DATABASE BACKUPS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLbackups.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo DIR \\localhost\SE_BACKUP\BACKUP\%%computername%%\DATABASES /-C /O:-d ^>c:\se_setup\SOFTWAREPM\dbbkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd se_setup >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type dbbkp.txt ^| findstr /v "Directory" ^| findstr /v "Volume" ^| findstr /v "Dir(s)" ^| findstr /v "File(s)" ^| findstr /v "\<DIR\>"  ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLbackups.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\dbbkp.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo LOCAL REGISTRY BACKUPS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\REGISTRYbackups.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo DIR \\localhost\SE_BACKUP\BACKUP\%%computername%%\REGISTRY /-C /O:-d ^>c:\se_setup\SOFTWAREPM\regbkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd se_setup >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type regbkp.txt ^| findstr /v "Directory" ^| findstr /v "Volume" ^| findstr /v "Dir(s)" ^| findstr /v "File(s)" ^| findstr /v "\<DIR\>" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\REGISTRYbackups.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\regbkp.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo LOCAL FILE BACKUPS: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FILEbackups.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo DIR \\localhost\SE_BACKUP\BACKUP\%%computername%%\FILES /-C /O:-d ^| findstr /v "Directory" ^| findstr /v "Volume" ^| findstr /v "Dir(s)" ^| findstr /v "File(s)" ^| findstr /v "\." ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FILEbackups.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\filesbkp.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Eventlogs... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo APPLICATION AND SYSTEM EVENTLOGS. UNIQUE CRITICAL, ERROR AND WARNING ONLY: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "Get-WinEvent -FilterHashtable @{logname='system','Application'; level='1','2','3'} -MaxEvents 500 | sort id -unique | Format-Table -Property TimeCreated,ProviderName,Level,Logname,Message -AutoSize | Out-String -Width 4096 | out-file c:\se_setup\SOFTWAREPM\logs.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ping localhost ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs.txt) -replace ',', '' | Out-File c:\se_setup\SOFTWAREPM\logs1.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs1.txt) -replace ' PM ', ' PM, ' | Out-File c:\se_setup\SOFTWAREPM\logs2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs2.txt) -replace ' AM ', ' AM, ' | Out-File c:\se_setup\SOFTWAREPM\logs3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs3.txt) -replace '1 System', ',1, System,' | Out-File c:\se_setup\SOFTWAREPM\logs4.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs4.txt) -replace '2 System', ',2, System,' | Out-File c:\se_setup\SOFTWAREPM\logs5.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs5.txt) -replace '3 System', ',3, System,' | Out-File c:\se_setup\SOFTWAREPM\logs6.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs6.txt) -replace '1 Application', ',1, Application,' | Out-File c:\se_setup\SOFTWAREPM\logs7.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs7.txt) -replace '2 Application', ',2, Application,' | Out-File c:\se_setup\SOFTWAREPM\logs8.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs8.txt) -replace '3 Application', ',3, Application,' | Out-File c:\se_setup\SOFTWAREPM\logs9.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs9.txt) -replace '----- ', '-----, ' | Out-File c:\se_setup\SOFTWAREPM\logs10.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs10.txt) -replace 'TimeCreated', 'TimeCreated,' | Out-File c:\se_setup\SOFTWAREPM\logs11.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs11.txt) -replace 'ProviderName', 'ProviderName,' | Out-File c:\se_setup\SOFTWAREPM\logs12.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs12.txt) -replace 'Level', 'Level,' | Out-File c:\se_setup\SOFTWAREPM\logs13.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs13.txt) -replace 'LogName', 'LogName,' | Out-File c:\se_setup\SOFTWAREPM\logs14.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\logs14.txt) -replace '-------,     -------,', '-------,     -------' | Out-File c:\se_setup\SOFTWAREPM\logs15.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo Type c:\se_setup\SOFTWAREPM\logs15.txt ^| findstr /v "\-\-\-" ^>c:\se_setup\SOFTWAREPM\logs16.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type c:\se_setup\SOFTWAREPM\logs16.txt ^| findstr "," ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\log*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo ping localhost ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\logs.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Scheduled Tasks... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo SCHEDULED TASKS: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo "HostName","TaskName","Next Run Time","Status","Logon Mode","Last Run Time","Last Result","Author","Task To Run","Start In","Comment","Scheduled Task State","Idle Time","Power Management","Run As User","Delete Task If Not Rescheduled","Stop Task If Runs X Hours and X Mins","Schedule","Schedule Type","Start Time","Start Date","End Date","Days","Months","Repeat: Every","Repeat: Until: Time","Repeat: Until: Duration","Repeat: Stop If Still Running" ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo schtasks /query /v /FO csv ^| Findstr /v "Microsoft" ^| Findstr /v "Google" ^| Findstr /v "TaskName" ^| Findstr /v "ISM" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo copy /b c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks*.csv c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Services... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo WINDOWS SERVICES: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo wmic service get displayname,name,startname,State,startmode,pathname /Format:csv ^>c:\se_setup\svc.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\svc.txt ^| Findstr "," ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Services.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Locating Mapped and Shared Drives... >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo MAPPED DRIVES: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedSharedDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo MAPPED DRIVES: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedSharedDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo net use ^| Findstr /v "entries" ^| Findstr /v "Resource" ^| Findstr /v "remembered" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedSharedDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "Get-PSDrive -PSProvider FileSystem | export-csv c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedDrives.csv -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo SHARED DRIVES: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedSharedDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo net share ^| Findstr /v "successfully"  ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedSharedDrives.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "get-WmiObject -class Win32_Share | Select Caption,Description,Name,Path,Status | export-csv c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SharedDrives.csv -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Locating Startup Folders... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ALL LOCAL STARTUP FILES: ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ALL LOCAL STARTUP FILES: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /b "%%userprofile%%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ALL USERS STARTUP FILES: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /b "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Loading Tasklist... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo TASKLIST ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo tasklist /v /FO csv ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\TaskManager.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo Powershell -Command "Get-Process | Sort-Object -Descending WS | select -property ProcessName, @{label='Memory(MB)';Expression={'{0:N2}MB' -f ($_.WS / 1MB)}}, CPU, Id | export-csv c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\TaskManager.csv -NoTypeInformation" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Device and Drivers List... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo DEVICE AND DRIVERS LIST ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo driverquery /v /FO csv ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Drivers.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Loading Alerts... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ALERTS ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo if %%dbpresent%%==0 goto nodb >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find "\DATABASES\ \\" \\localhost\SE_BACKUP\scripts\backup.bat ^> C:\SE_SETUP\SOFTWAREPM\bkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% neq 0 goto skipremotebkp >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo c: >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd C:\SE_SETUP\SOFTWAREPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\bkp.txt ^| findstr /v "BACKUP.BAT" ^>c:\se_setup\SOFTWAREPM\bkp1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\bkp1.txt) | ? {$_.trim() -ne '' } | set-content c:\se_setup\SOFTWAREPM\bkp2.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f "tokens=7 delims=\" %%%%a in (c:\se_setup\SOFTWAREPM\bkp2.txt) do (set remotebkp=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo DIR \\%%remotebkp%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES /O:-d ^>c:\se_setup\SOFTWAREPM\remotebkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "%%date:~10,4%%%%date:~4,2%%%%date:~7,2%%" c:\se_setup\SOFTWAREPM\remotebkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 goto skipremotebkp >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo +++SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% Not found on remote computer \\%%remotebkp%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\. Automatic Backups need to be created and backed up to remotely shared SE_BACKUP folder ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo +++Issues Detected+++SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% Not found on remote computer \\%%remotebkp%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\. Automatic Backups need to be created and backed up to remotely shared SE_BACKUP folder, ^>C:\SE_SETUP\summary4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo +++Issues Detected+++SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% Not found on remote computer \\%%remotebkp%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\. Automatic Backups need to be created and backed up to remotely shared SE_BACKUP folder, ^>C:\SE_SETUP\summary7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary4=^<C:\SE_SETUP\summary4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary10=^<C:\SE_SETUP\summary7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\bkp*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto localdb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :skipremotebkp >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% are being backed up to computer \\%%remotebkp%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\., ^>C:\SE_SETUP\summary4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% are being backed up to computer \\%%remotebkp%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\., ^>C:\SE_SETUP\summary10.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p summary4=^<C:\SE_SETUP\summary4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary10=^<C:\SE_SETUP\summary10.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\remotebkp.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo :localdb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo DIR \\localhost\SE_BACKUP\BACKUP\%%computername%%\DATABASES /O:-d ^>c:\se_setup\SOFTWAREPM\dbbkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "%%date:~10,4%%%%date:~4,2%%%%date:~7,2%%" c:\se_setup\SOFTWAREPM\dbbkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo DATABASE Backups are present for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\. ^>C:\SE_SETUP\summary7.txt ^& set /p summary7=^<C:\SE_SETUP\summary7.txt ^& goto contdb >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 echo +++No SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\. Automatic Backups need to be created and backed up to locally shared SE_BACKUP folder ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo +++No SQL DATABASE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\DATABASES\. Automatic Backups need to be created and backed up to locally shared SE_BACKUP folder ^>C:\SE_SETUP\summary7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary7=^<C:\SE_SETUP\summary7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo goto contdb >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :nodb >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo Not applicable. No SQL Databases detected., ^>C:\SE_SETUP\summary4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Not applicable. No SQL Databases detected., ^>C:\SE_SETUP\summary7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary4=^<C:\SE_SETUP\summary4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary7=^<C:\SE_SETUP\summary7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :contdb >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo DIR \\localhost\SE_BACKUP\BACKUP\%%computername%%\REGISTRY /O:-d ^>c:\se_setup\SOFTWAREPM\regbkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo DIR \\localhost\SE_BACKUP\BACKUP\%%computername%%\FILES /O:-d ^>c:\se_setup\SOFTWAREPM\filebkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%" c:\se_setup\SOFTWAREPM\regbkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo REGISTRY Backups are present for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\REGISTRY\. ^>C:\SE_SETUP\summary9.txt ^& set /p summary9=^<C:\SE_SETUP\summary9.txt ^& goto regdone >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 echo +++No REGISTRY Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\REGISTRY\. Automatic Backups need to be created and backed up to locally shared SE_BACKUP folder ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo +++No REGISTRY Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\REGISTRY\. Automatic Backups need to be created and backed up to locally shared SE_BACKUP folder ^>C:\SE_SETUP\summary9.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary9=^<C:\SE_SETUP\summary9.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :regdone >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%" c:\se_setup\SOFTWAREPM\filebkp.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo FILE Backups are present for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\FILES\. ^>C:\SE_SETUP\summary8.txt ^& set /p summary8=^<C:\SE_SETUP\summary8.txt ^& goto filedone >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 1 echo +++No FILE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\FILES\. Automatic Backups need to be created and backed up to locally shared SE_BACKUP folder ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo +++No FILE Backups for %%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%% found under \\%%computername%%\SE_BACKUP\BACKUP\%%computername%%\FILES\. Automatic Backups need to be created and backed up to locally shared SE_BACKUP folder ^>C:\SE_SETUP\summary8.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary8=^<C:\SE_SETUP\summary8.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :filedone >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo del c:\se_setup\SOFTWAREPM\dbbkp.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\regbkp.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\filebkp.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\*alert*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "service terminated unexpectedly" c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Windows Service Crash Detected in EventLogs. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Windows Service Crash Detected in EventLogs. ^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "Faulting application name" c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Application Crash Detected in EventLogs. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Application Crash Detected in EventLogs. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "server was unable to allocate" c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Virtual Memory issue detected in EventLogs. Increase Virtual memory to resolve issue. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Virtual Memory issue detected in EventLogs. Increase Virtual memory to resolve issue. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "The driver detected a controller error on" c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Possible Hard Disk issues Detected in EventLogs. Verify drive status and perform check disk. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Possible Hard Disk issues Detected in EventLogs. Verify drive status and perform check disk. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "The system has rebooted without" c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Unexpected hard shutdown Detected in EventLogs. Verify power supply source; backup battery and other possible causes. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Unexpected hard shutdown Detected in EventLogs. Verify power supply source; backup battery and other possible causes. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "DBCC CHECKDB" c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Possible SQL Database Corruption Detected in EventLogs. Verify all Databases are not in Suspect Mode. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Possible SQL Database Corruption Detected in EventLogs. Verify all Databases are not in Suspect Mode. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat






echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo find /c "Issues Detected running Check Disk. Bad sectors or unindexed files found" c:\se_setup\SOFTWAREPM\sysinfo67.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% equ 0 echo +++Issues Detected running Check Disk. Bad sectors or unindexed files found. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo set /p diff2=^<c:\se_setup\ping\diff.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo if not exist c:\se_setup\ping\diff.txt goto skipdiff >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%diff2%% GTR 0 echo +++%%diff2%% IP Device(s) Offline. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :skipdiff >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo powershell -Command "$csv1 = @(gc 'c:\se_setup\alert.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'c:\se_setup\alert1.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\alert1.txt ^> c:\se_setup\alert2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary17=^<c:\se_setup\alert2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo del C:\SE_SETUP\*alert*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setLocal enableDELAYedeXpansioN >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\HDD*.txt /q >nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\SE_SETUP\drives.txt /q >nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do ^@%%%%i: 2^>nul ^&^& set/pz^=%%%%i^<nul^>^> c:\se_setup\drives.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat 
echo set /p drives=^<c:\SE_SETUP\drives.txt  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%d in (%%drives%%) do (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set "Total=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "total=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "free=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "used=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "used100=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "HDD100=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo %%%%d: (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo fsutil volume diskfree %%%%d: ^|  find "Total # of free bytes" ^>c:\se_setup\drivealert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\drivealert.txt) -replace 'Total # of free bytes        : ', ''" ^>c:\se_setup\drivealert1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p free=^<c:\se_setup\drivealert1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo fsutil volume diskfree %%%%d: ^|  find "Total # of bytes" ^>c:\se_setup\drivealert2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\drivealert2.txt) -replace 'Total # of bytes             : ', ''" ^>c:\se_setup\drivealert3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p Total=^<c:\se_setup\drivealert3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /A total=^^!total:~0,-7^^! >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /A free=^^!free:~0,-7^^! >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /A used=^^!total^^! - ^^!free^^! >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /A used100=^^!used^^! * 100 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /A HDD100=^^!used100^^! / ^^!total^^! >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if ^^!HDD100^^! GTR 80 echo +++LOW DISK SPACE+++ Used Disk Space at ^^!HDD100^^!%%%% for %%%%d: Drive. Action Needed. ^>^>c:\se_setup\drivealert4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if ^^!HDD100^^! GTR 80 echo +++LOW DISK SPACE+++ Used Disk Space at ^^!HDD100^^!%%%% for %%%%d: Drive. Action Needed. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if ^^!HDD100^^! LSS 80 echo Healthy Drive Usage. Used Disk Space at ^^!HDD100^^!%%%% for %%%%d: Drive. No Action Needed. ^>^>c:\se_setup\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo   %%%%d is ^^!HDD100^^!%%%% full:  ^>^>c:\se_setup\softwarepm\pmhddpct.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo powershell -Command "$csv1 = @(gc 'c:\se_setup\alert.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'c:\se_setup\alert20.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\alert20.txt ^> c:\se_setup\alert21.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary26=^<c:\se_setup\alert21.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo reg query "HKLM\SYSTEM\CurrentControlSet\services\W32Time\Parameters" ^| Findstr NtpServer ^>c:\se_setup\alert70.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\alert70.txt) -replace '    NtpServer    REG_SZ    ', ''" ^>c:\se_setup\alert71.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo W32TM.exe /query /computer:localhost /configuration ^| Findstr NtpServer: ^>c:\se_setup\alert70.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "(gc c:\se_setup\alert70.txt) -replace 'NtpServer: ', ''" ^>c:\se_setup\alert71.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f "tokens=1 delims=," %%%%b in (c:\se_setup\alert71.txt) do echo %%%%b ^>c:\se_setup\alert72.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary30=^<c:\se_setup\alert72.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type c:\se_setup\drivealert4.txt ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cmd /c exit 0 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo systeminfo ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% NEQ 0 (echo Error getting SystemInfo. Computer might need to be restarted ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv ^& goto b) >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set "totalMem=">>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "availableMem=">>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "usedMem=">>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type c:\se_setup\SOFTWAREPM\sysinfo.txt ^| findstr /C:"Total Physical Memory:" ^>c:\se_setup\SOFTWAREPM\sysinfomemtotal1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\SOFTWAREPM\sysinfo.txt ^| findstr /C:"Available Physical Memory:" ^>c:\se_setup\SOFTWAREPM\sysinfomemavail1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfomemtotal1.txt) -replace ',', ''" ^>c:\se_setup\SOFTWAREPM\sysinfomemtotal.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfomemavail1.txt) -replace ',', ''" ^>c:\se_setup\SOFTWAREPM\sysinfomemavail.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f "tokens=4" %%%%a in (c:\se_setup\SOFTWAREPM\sysinfomemtotal.txt) do (set totalMem=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f "tokens=4" %%%%a in (c:\se_setup\SOFTWAREPM\sysinfomemavail.txt) do (set availableMem=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo for /f "tokens=4" %%%%a in ('systeminfo ^^^| findstr Physical') do if defined totalMem (set availableMem=%%%%a) else (set totalMem=%%%%a)>>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo set totalMem=%%totalMem:,=%%>>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo set availableMem=%%availableMem:,=%%>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a usedMem=totalMem-availableMem>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setlocal enabledelayedexpansion>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Times=0" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo powershell -Command "Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average | ft -HideTableHeaders" ^| findstr "0 1 2 3 4 5 6 7 8 9" ^>c:\se_setup\SOFTWAREPM\sysinfocpu1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc c:\se_setup\SOFTWAREPM\sysinfocpu1.txt) -replace ' ', ''" ^>c:\se_setup\SOFTWAREPM\sysinfocpu.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p cpusage1=^<c:\se_setup\SOFTWAREPM\sysinfocpu.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /A cpusage=%%cpusage1%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /A usedmem2=%%usedmem%% * 100>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /A mem=%%usedmem2%%/%%totalmem%%>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%cpusage%% GTR 80 echo +++High CPU Usage+++ Used CPU at %%cpusage%%%%%% Action Needed. ^>c:\se_setup\SOFTWAREPM\cpumem.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%cpusage%% GTR 80 echo +++High CPU Usage+++ Used CPU at %%cpusage%%%%%% Action Needed. ^>^>c:\se_setup\SOFTWAREPM\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%cpusage%% LSS 80 echo Healthy CPU Usage. Used CPU at %%cpusage%%%%%% No Action Needed. ^>^>c:\se_setup\SOFTWAREPM\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%mem%% GTR 80 echo +++High Memory Usage+++ Used Memory at %%mem%%%%%% Action Needed. ^>^>c:\se_setup\SOFTWAREPM\cpumem.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%mem%% GTR 80 echo +++High Memory Usage+++ Used Memory at %%mem%%%%%% Action Needed. ^>^>c:\se_setup\SOFTWAREPM\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%mem%% LSS 80 echo Healthy Memory Usage. Used Memory at %%mem%%%%%% No Action Needed. ^>^>c:\se_setup\SOFTWAREPM\alert.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type c:\se_setup\SOFTWAREPM\cpumem.txt ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv>>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo powershell -Command "$csv1 = @(gc 'c:\se_setup\alert.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' / '};$csv4 | Out-File 'c:\se_setup\alert1.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE c:\se_setup\alert1.txt ^> c:\se_setup\alert2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary16=^<c:\se_setup\alert2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo echo !engineer!'s Additional Notes: !blah! ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "Dept=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :b >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\svc.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\*alert*.txt /q >nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\icmp*.txt /q >nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\drives.txt /q >nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\dbloc*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\dbloc*.bat /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\cpu*.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :cctvretpm >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo set "ext=%ext%" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo if %%ext%%==noext (goto bmsacscctv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\drives.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd C:\ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo IF EXIST c:\se_setup\SOFTWAREPM\oldestfile.txt ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
        echo del c:\se_setup\SOFTWAREPM\oldestfile.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
    echo ) ELSE ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
        echo echo ================================ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
    echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat



if exist C:\SE_SETUP\SkipRetention.txt goto SkipRetention



echo del c:\se_setup\Retention*.* /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Finding oldest .%ext% File. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Please Wait... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setLocal enableDELAYedeXpansioN >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \  >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo CCTV ^>^>C:\se_setup\Retention13.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo for /f "tokens=1-3" %%%%a in ('WMIC LOGICALDISK GET FreeSpace^^^,Name^^^,Size ^^^| FINDSTR /I /V "Name"') do echo %%%%b ^>^>c:\se_setup\Retention0.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\Retention0.txt ^| Findstr /v "ECHO" ^| findstr /v "%%systemroot:~0,-8%% " ^>^>c:\se_setup\Retention1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\Retention1.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' '};$csv4 | Out-File 'C:\SE_SETUP\Retention2.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\SE_SETUP\Retention2.txt) -replace ': ', '' | Out-File C:\SE_SETUP\Retention3.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\Retention3.txt ^> C:\SE_SETUP\Retention4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p drives=^<C:\SE_SETUP\Retention4.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for %%%%d in (%%drives%%) do (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo %%%%d: >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo %%date:~4%%  08:30 PM       159,476,824 000DBC01.%%ext%%^>C:\se_setup\Retention5.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ^>C:\se_setup\Retention6.txt (echo %%date:~4%%) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del C:\se_setup\Retention6*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\Retention7*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\se_setup\Retention6a.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Finding oldest .%%ext%% File in %%%%d drive >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "drive=%%%%d" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd \ >>C:\SE_SETUP\SOFTWAREPM\setup.bat






echo dir /s ^| findstr "Directory" ^>C:\se_SETUP\Retentiondirectory.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\se_SETUP\Retentiondirectory.txt) -replace ' Directory of ', '' | Out-File C:\se_SETUP\Retentiondirectory1.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\se_SETUP\Retentiondirectory1.txt ^| findstr /v "\/" ^| findstr /i /v "BACKUP" ^>C:\se_SETUP\Retentiondirectory2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f %%%%a in (C:\se_SETUP\Retentiondirectory2.txt) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "texte=" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cd %%%%a >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%%%a >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :rets >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo goto ret6 >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo :ret6 >>C:\SE_SETUP\SOFTWAREPM\setup.bat >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^>C:\se_setup\Retention6.txt (echo %%date:~4%%) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type c:\se_setup\Retentiondirectory4.txt ^| findstr /v "0,10" ^>^>c:\se_setup\Retention6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo findstr "\/" c:\se_setup\Retention6.txt ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 1 set "noextfound=1" ^& ^>^>C:\se_setup\Retention6.txt (echo %%date:~4%%) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%errorlevel%% EQU 0 set "noextfound=0" >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem echo ^>^>C:\se_setup\Retention6.txt (echo %%date:~4%%) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo for /f "tokens=1 delims= " %%%%a in (C:\se_setup\Retention5.txt) do echo %%%%a ^>^>C:\se_setup\Retention6.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /f "tokens=3,1,2 delims=/" %%%%a in (c:\se_setup\retention6.txt) do ^>^>c:\se_setup\retention6a.txt (echo %%%%c%%%%a%%%%b) >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo powershell -Command "(gc C:\SE_SETUP\Retention6a.txt) -replace ' ', '' | Out-File C:\SE_SETUP\Retention6b.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo CMD /A /C TYPE C:\SE_SETUP\Retention6b.txt ^> C:\SE_SETUP\Retention7.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo sort C:\SE_SETUP\Retention6a.txt ^>^>C:\SE_SETUP\Retention7a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p oldestDate=^<C:\se_setup\Retention7a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :ps >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo powershell -Command "C:\se_setup\Retention9a.ps1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\se_setup\Retention10.txt ^| findstr "Days" ^>C:\se_setup\Retention11.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\SE_SETUP\Retention11.txt) -replace 'Days              : -', '' | Out-File C:\SE_SETUP\Retention12.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\SE_SETUP\Retention12.txt) -replace 'Days              : ', '' | Out-File C:\SE_SETUP\Retention12aa.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\Retention12aa.txt ^> C:\SE_SETUP\Retention12a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p oldestDays=^<C:\se_setup\Retention12a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo call :ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto retdone >>C:\SE_SETUP\SOFTWAREPM\setup.bat




echo :ps >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^$StartDate=^^^(GET-DATE^^^) ^>C:\se_setup\Retention9.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "olddate=%%oldestdate:~4,-2%%/%%oldestdate:~6%%/%%oldestdate:~0,-4%%" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%noextfound%% EQU 1 (set "olddate=%%date:~4%%" ^& set "oldestdate=%%date:~4%%") >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^$EndDate=[datetime]"%%olddate%%" ^>^>C:\se_setup\Retention9.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo NEW-TIMESPAN -Start ^^^$StartDate -End ^^^$EndDate ^>^> C:\se_setup\Retention9.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo TYPE C:\SE_SETUP\Retention9.txt ^> C:\SE_SETUP\Retention9a.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\Retention9a.txt ^> C:\SE_SETUP\Retention9b.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "C:\se_setup\Retention9b.ps1 | Out-File C:\se_setup\Retention10.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto :eof >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo :ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%oldestdays%% EQU 0 echo No .%%ext%% files found in %%drive%%: drive. ^>^>C:\se_setup\Retention13.txt ^& goto zero >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%oldestdays%% LSS 30 echo +++Action Needed. Video Retention for drive %%drive%%: is below 30 Days. ^>^>C:\se_setup\Retention13.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if %%oldestdays%% GEQ 30 echo Healthy Video Retention (Over 30 Days) for %%drive%% drive. ^>^>C:\se_setup\Retention13.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Oldest %%ext%% file in the %%drive%%: drive was %%oldestdays%% Days ago. %%olddate%%. ^>^>C:\se_setup\Retention13.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :zero >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo oldest %%ext%% file was %%oldestdays%% Days ago. %%oldestdate:~4,-2%%/%%oldestdate:~6%%/%%oldestdate:~0,-4%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"%!site!%_%!engineer!%_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt"
echo goto :eof >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo :rets >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /O:D ^| findstr /i ".%%ext%%" ^>c:\se_setup\Retentiondirectory3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p texte=^< c:\se_setup\Retentiondirectory3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo %%texte:~0,10%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^>^>c:\se_setup\Retentiondirectory4.txt (echo %%texte:~0,10%%) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo goto :eof >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo :retdone >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\Retention13.txt');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i] + ' '};$csv4 | Out-File 'C:\SE_SETUP\Retention14.txt'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\Retention14.txt ^> C:\SE_SETUP\Retention15.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summary37=^<C:\se_setup\Retention15.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat

 
 

echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo echo CCTV VIDEO FILE RETENTION SUMMARY: ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\"!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type C:\se_setup\Retention13.txt ^| Findstr /i /v "Retention" ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Retention.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo del c:\se_setup\SOFTWAREPM\%%computername%%_retall.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\Retention*.* /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

:SkipRetention


echo :bmsacscctv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo :noextall >>C:\SE_SETUP\SOFTWAREPM\setup.bat







echo del C:\SE_SETUP\SOFTWAREPM\PMsummary*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem ip ADDRESS
echo FOR /f "tokens=2 delims=:" %%%%a IN ('ipconfig ^^^| findstr "IPv4"') DO (echo %%%%a , ^>^>C:\SE_SETUP\SOFTWAREPM\PMsummaryIP.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem transpose all vertical rows to one column
echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\PMsummaryIP.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\PMsummaryIP2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p IpAddr=^<C:\SE_SETUP\SOFTWAREPM\PMsummaryIP2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem MAC Address
echo FOR /f "tokens=2 delims=:" %%%%a IN ('ipconfig /all ^^^| findstr "Physical" ^^^| findstr /v "00-00"') DO (echo %%%%a , ^>^>C:\SE_SETUP\SOFTWAREPM\PMsummaryMAC.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem transpose all vertical rows to one column
echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\PMsummaryMAC.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\PMsummaryMAC2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p MACAddr=^<C:\SE_SETUP\SOFTWAREPM\PMsummaryMAC2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem get mask and transpose all vertical rows to one column
echo FOR /f "tokens=2 delims=:" %%%%a IN ('ipconfig ^^^| findstr "Mask"') DO (echo %%%%a , ^>^>C:\SE_SETUP\SOFTWAREPM\PMsummarymask.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\PMsummarymask.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\PMsummarymask2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p summask=^<C:\SE_SETUP\SOFTWAREPM\PMsummarymask2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get gw and transpose all vertical rows to one column
echo FOR /f "tokens=2 delims=:" %%%%a IN ('ipconfig ^^^| findstr "Gateway"') DO (echo %%%%a , ^>^>C:\SE_SETUP\SOFTWAREPM\PMsummarygw.csv) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\PMsummarygw.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\PMsummarygw2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p sumgw=^<C:\SE_SETUP\SOFTWAREPM\PMsummarygw2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get system Information
echo SYSTEMINFO ^| findstr /v "KB" ^>c:\se_setup\SOFTWAREPM\PMSystemInfo.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"OS Name:"') DO (set pmos=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=e" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"Install Date:"') DO (set pmosdate=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=3 delims=e" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"Boot Time:"') DO (set pmosboot=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"System Manufacturer:"') DO (set pmosman=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"System Model:"') DO (set pmosmodel=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"Total Physical"') DO (set pmosmem1=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f "tokens=2 delims=:" %%%%a IN ('type c:\se_setup\SOFTWAREPM\PMSystemInfo.csv ^^^| findstr /C:"Domain:"') DO (set pmosdomain=%%%%a) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get all drive usage percentage in one row
echo START /W /I /MIN powershell -Command "Get-Content 'c:\se_setup\SOFTWAREPM\pmhddpct.csv' | foreach {$out = $out + $_} ; $out | Out-File 'c:\se_setup\SOFTWAREPM\pmhddpct2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p pmhddpct=^<c:\se_setup\SOFTWAREPM\pmhddpct2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get all drives in one row
echo START /W /I /MIN powershell -Command "Get-Content 'c:\se_setup\SOFTWAREPM\pmHDD.csv' | foreach {$out = $out + $_} ; $out | Out-File 'c:\se_setup\SOFTWAREPM\pmHDD2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p pmhdd=^<c:\se_setup\SOFTWAREPM\pmHDD2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get all firewall statuses in one row
echo START /W /I /MIN powershell -Command "Get-Content 'c:\se_setup\SOFTWAREPM\pmfw.csv' | foreach {$out = $out + $_} ; $out | Out-File 'c:\se_setup\SOFTWAREPM\pmfw2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p pmfw=^<c:\se_setup\SOFTWAREPM\pmfw2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get all rdp status in one row
echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\pmrdp.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\pmrdp2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p pmrdp=^<C:\SE_SETUP\SOFTWAREPM\pmrdp2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get last patch installed DATE
echo set /p pmPatches=^<C:\SE_SETUP\SOFTWAREPM\pmPatches.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get ip devices
echo set /p pmIPdev=^<c:\se_setup\SOFTWAREPM\pmIPdev.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem get all video retention in one row
rem echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\pmvidret.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\pmvidret2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo set /p pmvidret=^<C:\SE_SETUP\SOFTWAREPM\pmvidret2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem get ALERTS without header and put all in one row
echo type c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv ^| findstr /v "ALERTS" ^>^>c:\se_setup\SOFTWAREPM\pmalerts.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\pmalerts.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\pmalerts2.csv' -Encoding Ascii" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /p pmalerts2=^<C:\SE_SETUP\SOFTWAREPM\pmalerts2.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo Computer Name^^^| IP Address^^^| Mask^^^| Gateway^^^| Mac Address^^^|  Domain^^^| Operating System^^^| Original Install Date^^^| System Boot Time^^^| System Manufacturer^^^| System Model^^^|Total Physical Memory^^^| Memory Usage Percentage^^^| CPU Usage Percentage^^^| CPU Details^^^| Drive Usage Percentage^^^| Drive Name / Free / Total^^^| Check Disk Results^^^| Firewall Status^^^| RDP Status^^^| Last Windows Update^^^| First Access Event ^^^| Video Retention ^^^| IP Devices Online^^^| NTP Source^^^|  Total Database Size^^^| TightVNC ^^^| TrendMicro^^^| Alerts ^^^| Misc ^>^>C:\SE_SETUP\SOFTWAREPM\PMsummary.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo %%computername%% ^^^| %%IpAddr%% ^^^| %%summask%% ^^^| %%sumgw%% ^^^| %%MACAddr%% ^^^| %%pmosdomain%% ^^^| %%pmos%% ^^^| %%pmosdate%% ^^^| %%pmosboot%% ^^^| %%pmosman%% ^^^| %%pmosmodel%% ^^^| %%pmosmem1%% ^^^| %%mem%%%%%% ^^^| %%cpusage%%%%%% ^^^| %%pmcpu%% ^^^| %%pmhddpct%%%%%% ^^^| %%pmhdd%% ^^^| %%summary25%% ^^^| %%pmfw%% ^^^| %%pmrdp%% ^^^| %%summary19%% ^^^| %%summary3%% ^^^| %%summary37%% ^^^| %%pmIPdev%% ^^^| %%summary30%% ^^^| %%summary5%%GB ^^^| %%pmvnc%% ^^^| %%pmtrend%% ^^^| %%pmalerts2%% ^^^| ITServicesNJ ^>^>C:\SE_SETUP\SOFTWAREPM\PMsummary.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo echo ^^^<p^^^>^^^<span style="color: #27AE60; font-size: 70pt; LINE-HEIGHT:55px;"^^^>^^^<strong^^^>^^^<span style="font-family: Verdana;"^^^>Schneider^^^</span^^^>^^^</strong^^^>^^^</span^^^>^^^</p^^^> ^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat  
echo echo ^^^<span style="color: #27AE60; font-family: Monospace; font-size: 15pt; margin-left: 0.4em; LINE-HEIGHT: 49px; id=reduxstocklogofat;"^^^>ITServicesNY/NJ ^^^</span^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<span style="color: #27AE60; font-family: Arial,Helvetica,sans-serif; font-size: 40pt; margin-left: 0.13em; letter-spacing: 20px; LINE-HEIGHT:50px;id=reduxstocklogoslim"^^^>Electric^^^</span^^^>^^^</span^^^>^^^</p^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo echo ^^^<p^^^>^^^<span style="color: #27AE60; font-size: 50pt;"^^^>^^^<strong^^^>^^^<span style="font-family: Arial;"^^^>Schneider Electric^^^</span^^^>^^^</strong^^^>^^^</span^^^>^^^</p^^^> ^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo ^^^<p^^^>^^^<span style="color: #27AE60; font-size: 16pt; font-family: Arial; "^^^>^^^<u^^^>Technical Software Preventative Maintenance Report^^^</u^^^>^^^</span^^^>^^^</p^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<br^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^^^<li^^^^^>^^^^^<span style="color: #27AE60; font-family: Arial; "^^^^^>^^^^^<b^^^^^>Site Name:^^^^^</b^^^^^>!site!^^^^^</li^^^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<li^^^>^^^<span style="color: #27AE60; font-family: Arial; "^^^>^^^<b^^^>Date of PM:^^^</b^^^>%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%^^^</li^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<li^^^>^^^<span style="color: #27AE60; font-family: Arial; "^^^>^^^<b^^^>Machine Name:^^^</b^^^>%%computername%%^^^</li^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^^^<li^^^^^>^^^^^<span style="color: #27AE60; font-family: Arial; "^^^^^>^^^^^<b^^^^^>Engineer:^^^^^</b^^^^^>!engineer!^^^^^</li^^^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<p^^^>^^^<span style="color: #000000; font-size: 8pt;"^^^>Refer to Customer report for basic, line-itemized report. For any service related matters, please contact our Buildings Service Center 24x7 at 1-877-822-2601^^^</span^^^>^^^</p^^^> ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem place header in swpm folder
echo powershell -Command "(gc C:\SE_SETUP\header.html) -replace 'xxxcv', '' | Out-File C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat





rem creates standard html formating
echo echo. 2^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo $css = @^^^" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<br^^^> ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<br^^^> ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^<style^^^> ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo h1, h5, th { text-align: left; font-family: Consolas; } ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo table { margin: left; font-family: Consolas; box-shadow: 10px 10px 5px #888; border: thin ridge grey; max-width: 100%%%%;white-space:nowrap;} ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo th { background: #0046c3; color: #fff; max-width: 400px; padding: 5px 10px; } ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo td { font-size: 11px; padding: 5px 20px; color: #000; } ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo tr { background: #b8d1f3; } ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo tr:nth-child(even) { background: #dae5f4; } ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo tr:nth-child(odd) { background: #b8d1f3; } ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^</style^^^> ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^^"@ ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem below checks for csv and if there, writes a command to convert that csv file to a html table using the formatting above 
rem each csv converts to a htmlXX file where xx is a sequential number starting from 1. 

rem ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Header.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Header.csv" ^^^| ConvertTo-Html -Head $css ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html01.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Network.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Network.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html02.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Accounts.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Accounts.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html03.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemInfo.csv" ^^^| ConvertTo-Html -Head $css -Body "System Information" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html04.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemBios.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemBios.csv" ^^^| ConvertTo-Html -Head $css -Body "System Bios Information" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html04.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemCPU.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SystemCPU.csv" ^^^| ConvertTo-Html -Head $css -Body "System CPU Information" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html04.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives.csv" -Delimiter ';' ^^^| ConvertTo-Html -Head $css -Body "Hard Drive Capacity" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesdiskdrive.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesdiskdrive.csv" ^^^| ConvertTo-Html -Head $css -Body "Hard Drive Disk Details" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05a.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesvolume.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrivesvolume.csv" ^^^| ConvertTo-Html -Head $css -Body "Hard Drive Volume Details" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05b.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CheckDisk.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CheckDisk.csv" ^^^| ConvertTo-Html -Head $css -Body "Check Disk Results" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05c.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\VideoCard.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\VideoCard.csv" ^^^| ConvertTo-Html -Head $css -Body "Video Card Details" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05b.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Printers.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Printers.csv" ^^^| ConvertTo-Html -Head $css -Body "Printer Details" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05b.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html06.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html07.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScreenSaverStatus.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScreenSaverStatus.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html08.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html09.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\UAC.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\UAC.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html10.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Applications.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Applications.csv" ^^^| ConvertTo-Html -Head $css -Body "Installed Programs and Versions" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html11.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches.csv" ^^^| ConvertTo-Html -Head $css -Body "Microsoft Patches" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html12.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "SQL Table Details" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html13.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoAnalog.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoAnalog.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Pelco Analog Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsPelcoIP.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Pelco IP Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecEvent.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecEvent.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Genetec First Event" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecUnits.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecUnits.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Genetec Units" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecCameras.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecCameras.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Genetec Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecInputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecInputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Genetec Inputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecOutputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsGenetecOutputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Genetec Outputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsMilestoneCameras.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsMilestoneCameras.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Milestone Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSalientCameras.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSalientCameras.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Salient Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsOnssiCameras.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsOnssiCameras.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Onssi Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagEvent.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagEvent.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Amags First Access Event" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagChains.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagChains.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Amag LAN Chains" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagNodes.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagNodes.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Amag Nodes" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagDoors.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagDoors.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Amag Doors" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagInputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagInputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Amag Inputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagOutputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsAmagOutputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Amag Outputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETevent.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETevent.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INETs First Event" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Routing Table" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks2.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETlinks2.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Links" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETcontrollers.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETcontrollers.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Controllers" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETmodule.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETmodule.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Module" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETdoors.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETdoors.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Doors" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETinputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINETinputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Inputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINEToutputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsINEToutputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "INET Outputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumEvent.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumEvent.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuums First Event" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumCX.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumCX.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuum Network Controllers" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInfinet.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInfinet.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuum Infinet Controllers" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumIOU.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumIOU.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuum IOU Modules" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumDoors.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumDoors.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuum Doors" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumInputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuum Inputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumOutputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsContinuumOutputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Continuum Outputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsQognifyCameras.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsQognifyCameras.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Qognify Cameras" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertEvent.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertEvent.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "SecurityXperts First Event" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertCX.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertCX.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "SecurityXpert Network Controllers" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertDoors.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertDoors.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "SecurityXpert Doors" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertInputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertInputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "SecurityXpert Inputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertOutputs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\PointsSecurityXpertOutputs.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "SecurityXpert Outputs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat


ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLpath.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLpath.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html15.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLbackups.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLbackups.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html16.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\REGISTRYbackups.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\REGISTRYbackups.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html17.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FILEbackups.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FILEbackups.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html18.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv" ^^^| ConvertTo-Html -Head $css -Body "EventLogs" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html19.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks.csv" ^^^| ConvertTo-Html -Head $css -Body "Scheduled Tasks" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html20.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Services.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Services.csv" ^^^| ConvertTo-Html -Head $css -Body "Services" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html21.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedDrives.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedDrives.csv" ^^^| ConvertTo-Html -Head $css -Body "Mapped Drives" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html22.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SharedDrives.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SharedDrives.csv" ^^^| ConvertTo-Html -Head $css -Body "Shared Drives" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html22a.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html23.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\TaskManager.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\TaskManager.csv" ^^^| ConvertTo-Html -Head $css -Body "Task Manager" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html24.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Drivers.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Drivers.csv" ^^^| ConvertTo-Html -Head $css -Body "Installed Drivers" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html25.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html26.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
ECHO IF EXIST c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Retention.csv echo Import-CSV "c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Retention.csv" ^^^| ConvertTo-Html -Head $css -Body "" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html27.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat


ECHO IF EXIST C:\SE_SETUP\SOFTWAREPM\PMsummary.csv echo Import-CSV "C:\SE_SETUP\SOFTWAREPM\PMsummary.csv" -Delimiter '^^^|' ^^^| ConvertTo-Html -Head $css -Body "Summary" ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html28.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat





echo powershell -command ^"$ErrorActionPreference = 'SilentlyContinue' ; C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat"


rem below enters in a heading for each html table and merges it with the main swpm file using the append command

rem echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html01.html) -replace '\>\*', '>Software PM Report by !engineer!' | Out-File C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html02.html) -replace '\>\*', '>Network Information' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html03.html) -replace '\>\*', '>User Accounts' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html04.html) -replace '\>\*', '>System Details' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05.html) -replace '\>\*', '>Hard Drive Capacity' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05a.html) -replace '\>\*', '>Hard Drive Disk Details' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05b.html) -replace '\>\*', '>Hard Drive Volume Details' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html05c.html) -replace '\>\*', '>Check Disk Results' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html06.html) -replace '\>\*', '>Firewall Status' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html07.html) -replace '\>\*', '>RDP Status' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html08.html) -replace '\>\*', '>Screen-Saver Status' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html09.html) -replace '\>\*', '>Windows Update Status' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html10.html) -replace '\>\*', '>User Account Control (UAC)' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html11.html) -replace '\>\*', '>Installed Applications' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html12.html) -replace '\>\*', '>Microsoft Patches' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html13.html) -replace '\>\*', '>SQL Databases' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html14.html) -replace '\>\*', '>Software Points' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html15.html) -replace '\>\*', '>SQL Paths' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html16.html) -replace '\>\*', '>SQL Backups' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html17.html) -replace '\>\*', '>Registry Backups' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html18.html) -replace '\>\*', '>File Backups' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html19.html) -replace '\>\*', '>EventLogs' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html20.html) -replace '\>\*', '>Scheduled Tasks' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html21.html) -replace '\>\*', '>Windows Services' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html22.html) -replace '\>\*', '>Mapped Drives' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html22a.html) -replace '\>\*', '>Shared Drives' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html23.html) -replace '\>\*', '>Startup Programs' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html24.html) -replace '\>\*', '>Task Manager Details' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html25.html) -replace '\>\*', '>Installed Windows Drivers' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html26.html) -replace '\>\*', '>Alerts' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html27.html) -replace '\>\*', '>Video Retention' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html28.html) -replace '\>\*', '>Summary' | Out-File -Append C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem goto SmartPM

rem echo ping localhost -n 4 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo del c:\se_setup\SOFTWAREPM\bkp*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\sysinfo*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\remote*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\html*.html /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\htm.ps1 /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat 
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Header.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Network.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Accounts.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\HardDrives*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CheckDisk.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\VideoCard.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Printers.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FirewallStatus.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\RDPstatus.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScreenSaverStatus.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\WindowsUpdate.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\UAC.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Applications.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Patches*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQL.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLpath.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SQLbackups.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\REGISTRYbackups.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\FILEbackups.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\EventLogs.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\ScheduledTasks*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Services.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedSharedDrives.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Startup.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\TaskManager.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Drivers.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Alerts.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Retention.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\MappedDrives.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SharedDrives.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Points*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\Firewall*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\System*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

















echo goto SmartPM >>C:\SE_SETUP\SOFTWAREPM\setup.bat





echo :startping >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\pingResults*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\Devices2.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Ping Results^>C:\SE_SETUP\PING\pingResults2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"counter=0^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f ^"tokens=%%pingcolumn%% skip=1 delims=^|^" %%%%u IN (C:\SE_SETUP\ping\Devices.txt) DO echo %%%%u^>^>c:\se_setup\ping\Devices2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"file=c:\se_setup\ping\Devices2.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^<^"^^!file^^!^" ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo   for /f %%%%i in ('type ^"^^!file^^!^" ^^^^^| find /c /v ^"^"') do set /a oo=%%%%i ^&^& for /l %%%%m in (1 1 %%%%i) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo     set /p ^"line2_%%%%m=^")) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"counter=1^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /l %%%%i in (1 1 ^^!oo^^!) do (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"pg=^^!line2_%%%%i^^!^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^!counter^^! of ^^!oo^^! Pinging ^^!pg^^!  >>C:\SE_SETUP\SOFTWAREPM\setup.bat  
echo ping ^^!line2_%%%%i^^! -n 1 ^| findstr /v ^"Pinging^" ^| findstr /v ^"statistics^" ^| findstr /v ^"Packets^" ^| findstr /v ^"Approximate^" ^| findstr /v ^"Minimum^" ^>^>C:\SE_SETUP\PING\pingResults2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :pingdone >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a counter=counter+1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"(gc C:\SE_SETUP\PING\pingResults2.txt) ^| ? {$_.trim() -ne '' } ^>C:\SE_SETUP\PING\pingResults2a.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\PING\pingResults2a.txt ^> C:\SE_SETUP\PING\pingResults2b.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo FOR /f ^"tokens=*^" %%%%k IN (C:\SE_SETUP\PING\pingResults2b.txt) DO echo ^^^| %%%%k^>^>C:\SE_SETUP\PING\pingResults3.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\pingResults2a.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo :tst >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo xcopy ^"C:\SE_SETUP\PING\pingResults3.txt^" ^"C:\SE_SETUP\PING\MERGE^" /y >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo xcopy ^"C:\SE_SETUP\PING\Devices.txt^" ^"C:\SE_SETUP\PING\MERGE^" /y >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo dir /b /o:n C:\SE_SETUP\PING\MERGE ^>C:\SE_SETUP\summarypath.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"file1=C:\SE_SETUP\summarypath.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"counter=1^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setlocal EnableDelayedExpansion >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^<^"^^!file1^^!^" ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo   for /f %%%%i in ('type ^"^^!file1^^!^" ^^^^^| find /c /v ^"^"') do set /a nnn=%%%%i ^&^& for /l %%%%m in (1 1 %%%%i) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo     set /p ^"line1_%%%%m=^")) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a ^"IPDevices=^^!nnn^^!-1^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a ^"cnt=^^!counter^^!-1^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"file=C:\SE_SETUP\PING\MERGE\^^!line1_%%%%i^^!^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setlocal EnableDelayedExpansion >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^<^"^^!file^^!^" ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo   for /f %%%%i in ('type ^"^^!file^^!^" ^^^^^| find /c /v ^"^"') do set /a nn=%%%%i ^&^& for /l %%%%m in (1 1 %%%%i) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo     set /p ^"line2_%%%%m=^")) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"counters=0^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a ^"ooo=^^!oo^^!+1^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /l %%%%i in (1 1 ^^!ooo^^!) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"file^^!counter^^!=C:\SE_SETUP\PING\MERGE\^^!line2_%%%%i^^!^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Ping Results... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo ^^!counters^^! of ^^!oo^^! Devices Completed >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell.exe -command ^"get-content C:\SE_SETUP\PING\MERGE\Devices.txt ^| select -first 1 -skip ^^!counters^^!^" ^>^>C:\SE_SETUP\PING\MERGE\vline^^!counters^^!.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"$txt1 = @(gc 'C:\SE_SETUP\PING\MERGE\vline^^!counters^^!.txt');for ($i=0; $i -lt $txt1.Count; $i++) {$txt4 += $txt1[$i] + '^|'};$txt4 ^| Out-File 'C:\SE_SETUP\PING\MERGE\line^^!counters^^!.txt'^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell.exe -command ^"get-content C:\SE_SETUP\PING\MERGE\pingResults3.txt ^| select -first 1 -skip ^^!counters^^!^" ^>^>C:\SE_SETUP\PING\MERGE\vline^^!counters^^!.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"$txt1 = @(gc 'C:\SE_SETUP\PING\MERGE\vline^^!counters^^!.txt');for ($i=0; $i -lt $txt1.Count; $i++) {$txt4 += $txt1[$i] };$txt4 ^| Out-File 'C:\SE_SETUP\PING\MERGE\line^^!counters^^!.txt'^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a ^"counters=^^!counters^^!+1^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\MERGE\vline*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo copy /b C:\SE_SETUP\PING\MERGE\line*.txt C:\SE_SETUP\PING\AllDevices1.txt /y ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\MERGE\line*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ping localhost -n 2 ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type C:\SE_SETUP\PING\AllDevices1.txt ^| Findstr ^"timed^" ^>^>C:\SE_SETUP\PING\AllOfflineDevices1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type C:\SE_SETUP\PING\AllDevices1.txt ^| Findstr ^"unreachable^" ^>^>C:\SE_SETUP\PING\AllOfflineDevices1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type C:\SE_SETUP\PING\AllDevices1.txt ^| Findstr ^"again^" ^>^>C:\SE_SETUP\PING\AllOfflineDevices1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type C:\SE_SETUP\PING\AllDevices1.txt ^| Findstr ^"time^<^" ^>^>C:\SE_SETUP\PING\AllOnlineDevices1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo Type C:\SE_SETUP\PING\AllDevices1.txt ^| Findstr ^"time=^" ^>^>C:\SE_SETUP\PING\AllOnlineDevices1.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"(gc C:\SE_SETUP\PING\AllOfflineDevices1.txt) -replace '\?', '' ^| Out-File C:\SE_SETUP\PING\AllOfflineDevices.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"(gc C:\SE_SETUP\PING\AllOnlineDevices1.txt) -replace '\?', '' ^| Out-File C:\SE_SETUP\PING\AllOnlineDevices2.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"(gc C:\SE_SETUP\PING\AllOnlineDevices2.txt) ^| ? {$_.trim() -ne '' } ^| Out-File C:\SE_SETUP\PING\AllOnlineDevices.txt -Encoding Ascii^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo TYPE C:\SE_SETUP\PING\AllDevices1.txt ^>C:\SE_SETUP\PING\AllDevices2.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command ^"(gc C:\SE_SETUP\PING\AllDevices2.txt) -replace '\?', '' ^| Out-File C:\SE_SETUP\PING\AllDevices3.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo TYPE C:\SE_SETUP\PING\AllDevices3.txt ^>C:\SE_SETUP\PING\AllDevicesnew.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\AllOfflineDevices1.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\AllOnlineDevices1.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\AllDevices1.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\AllDevices2.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\PING\AllDevices3.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set ^"file3=C:\SE_SETUP\PING\AllOnlineDevices.txt^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^<^"^^!file3^^!^" ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo   for /f %%%%i in ('type ^"^^!file3^^!^" ^^^^^| find /c /v ^"^"') do set /a nnn=%%%%i ^&^& for /l %%%%m in (1 1 %%%%i) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo     set /p ^"line1_%%%%m=^")) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo 	echo. ^>^>C:\SE_SETUP\PING\AllDevicesnew.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo 	echo. ^>^>C:\SE_SETUP\PING\AllDevicesnew.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo 	set /a ^"diff=^^!oo^^!-^^!nnn^^!^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo 	echo %%oo%% Total IP Devices; %%nnn%% IP Devices Online; %%diff%% IP Devices Offline ^>^>C:\SE_SETUP\PING\AllDevicesnew.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo 	echo %%oo%% Total IP Devices; %%nnn%% IP Devices Online; %%diff%% IP Devices Offline ^>^>C:\SE_SETUP\SOFTWAREPM\pmIPdev.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /p pmIPdev=^<c:\se_setup\SOFTWAREPM\pmIPdev.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo 	if exist c:\se_setup\ping\diff.txt del c:\se_setup\ping\diff.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo 	echo %%diff%% ^>c:\se_setup\ping\diff.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo goto :eof >>C:\SE_SETUP\SOFTWAREPM\setup.bat





















echo :smartpm >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo goto copypms >>C:\SE_SETUP\SOFTWAREPM\setup.bat


echo mkdir c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\*.* /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo if exist C:\SE_SETUP\PING\AllDevicesnew.txt ( type C:\SE_SETUP\PING\AllDevicesnew.txt ^| findstr "Devices" ^>C:\SE_SETUP\summary29.txt ^& set /p summary29=^<c:\se_setup\summary29.txt) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo echo %%computername%% ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Completed. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Completed. ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary3%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary4%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo The total size of all databases on this machine is %%summary5%%GB ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary6%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary7%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary8%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary9%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary10%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary11%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary12%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary13%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary14%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary15%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary16%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary17%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary18%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Last Microsoft Patch was %%summary19%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary20%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary21%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary22%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary23%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary24%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary25%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary26%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary27%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary28%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary29%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo System Clock is being synchronized with %%summary30%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary31%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary32%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary33%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary34%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary35%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary36%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary37%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary38%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary39%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary40%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary41%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo %%summary42%% ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo !blah! ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\%%computername%%_SUMMARY.txt >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del c:\se_setup\SOFTWAREPM\drives.txt /q ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\drives.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\summary*.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo :Summary >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Attempting to Compile Summary Report... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo Make sure you have all the Summaries in the SUMMARY folder.

echo echo Software PM Tasks:, ^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Wrote down date/time work order number and initials in site logbook. (If applicable)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Reviewed last PM notes., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked and documented the first event; alarm or activity (Date and time)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Verified automatic SQL backup routine is setup and working properly., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked database size; operation; ErrorLog; etc., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Truncated database tables if necessary., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Made a database backup., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Made a backup copy of the graphics file folders., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Made a backup copy of the registry., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Saved backups to other onsite machines and removable hard drive., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Verified and Documented software revisions., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Documented software revisions and any outdated software versions in the PM report., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Made sure Windows OS is up to date. All outdated Operating Systems document in the PM report., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Documented any outdated controller firmware., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked workstation hardware to make sure it meets the minimum requirements to run Win7 and any installed Software., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked System Vitals (Event Logs; Msinfo; Resources; Performance) and documented any errors or issues., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Looked for any Application or security critical errors., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Ran Reliability Monitor - perfmon /rel. Documented any errors or issues in PM report., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Verified and Installed critical windows updates to all machines if necessary., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Verified System Restore is turned on and made a manual system restore point before applying updates or making any changes., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Made note of any critical Microsoft patches or updates. Schneider will only install updates if they have been verified and tested by product support., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Ensured Antivirus Definitions are up to date (If it is not handled by customer IT Dept.)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Ensured Antivirus Automatic scan is setup and running appropriately., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked Virus Scan logs to see if anything was found., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked all hard drives for errors or failures., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Confirmed each disks capacity and free space left. Made a note on the PM report if disks have low space., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked RAID status (if applicable on the machine) to ensure it is not degraded or offline., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked workstation HD defrag schedule if applicable., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked for any offline IP devices and troubleshoot as necessary., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked and corrected time synchronization across all devices., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Reviewed logs for specific Schneider Installed Software and documented all errors., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Physically checked workstation or servers for dust; damage; temperature; beeps; LEDs., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Confirmed that the environmental conditions and temperature of the room that the machine is located is satisfactory., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked functionally and Logs of all other installed software (ArcServe; Everrun etc..) if applicable., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked Live video on ALL cameras (If applicable)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked playback video on ALL cameras (If applicable)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked video retention time. Archived video goes back past 30 days., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked badge printing process. (If applicable)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Checked Access Events; Alarms and Activity. (If applicable)., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Verified all the information on the site configuration sheet is up to date. Updated if necessary., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Asked customer if they have any other access software related issues or requests., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Completed software PM sheet and uploaded on Schneider file sharing cloud., ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Other comments, ^>^>c:\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_SUMMARY.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\*line*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\summary*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\!site!_SoftwarePM_Report_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%_!engineer!.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo dir /b /o:n C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY ^>C:\SE_SETUP\summarypath.txt ^| findstr /i "SUMMARY" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set "file1=C:\SE_SETUP\summarypath.txt" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "counter=1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo setlocal EnableDelayedExpansion >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^<^"^^!file1^^!^" ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo   for /f %%%%i in ('type ^"^^!file1^^!^"^ ^^^^^| find /c /v ^"^"') do set /a nnn=%%%%i ^&^& for /l %%%%m in (1 1 %%%%i) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo     set /p "line1_%%%%m=")) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo for /l %%%%i in (1 1 ^^!nnn^^!) do (  >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo set /a "pcs=^!nnn^!-1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a "cnt=^!counter^!-1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set "file=C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^!^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo setlocal EnableDelayedExpansion >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ^<^"^^!file^^!^" ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo   for /f %%%%i in ('type ^"^^!file^^!^"^ ^^^^^| find /c /v ^"^"') do set /a nn=%%%%i ^&^& for /l %%%%m in (1 1 %%%%i) do ( >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo    set /p "line2_%%%%m=")) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
	
rem for /l %%%%i in (1 1 ^^!nn^^!) do (
echo set "file^!counter^!=C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line2_%%%%i^!^" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Compiling Customer PM Report. Adding Column ^^!counter^^!... >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo. >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo echo Computer ^^!cnt^^! of ^^!pcs^^! Completed >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo set /a "counter=^!counter^!+1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo !line2_%%%%i!
echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 0" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline01a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline01a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line01.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 1" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline02a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline02a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line02.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 2" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline03a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline03a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line03.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 3" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline04a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline04a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line04.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 4" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline05a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline05a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line05.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 5" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline06a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline06a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line06.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 6" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline07a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline07a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line07.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 7" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline08a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline08a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line08.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 8" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline09a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline09a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line09.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 9" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline10a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline10a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line10.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 10" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline11a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline11a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line11.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 11" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline12a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline12a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line12.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 12" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline13a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline13a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line13.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 13" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline14a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline14a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line14.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 14" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline15a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline15a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line15.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 15" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline16a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline16a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line16.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 16" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline17a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline17a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line17.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 17" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline18a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline18a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line18.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 18" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline19a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline19a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line19.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 19" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline20a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline20a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line20.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 20" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline21a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline21a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line21.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 21" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline22a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline22a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line22.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 22" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline23a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline23a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line23.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 23" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline24a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline24a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line24.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 24" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline25a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline25a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line25.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 25" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline26a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline26a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line26.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 26" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline27a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline27a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line27.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 27" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline28a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline28a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line28.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 28" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline29a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline29a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line29.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 29" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline30a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline30a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line30.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 30" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline31a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline31a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line31.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 31" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline32a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline32a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line32.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 32" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline33a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline33a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line33.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 33" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline34a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline34a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line34.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 34" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline35a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline35a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line35.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 35" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline36a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline36a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line36.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 36" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline37a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline37a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line37.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 37" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline38a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline38a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line38.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 38" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline39a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline39a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line39.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 39" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline40a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline40a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line40.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 40" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline41a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline41a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line41.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 41" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline42a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline42a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line42.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 42" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline43a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline43a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line43.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell.exe -command "get-content C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\^!line1_%%%%i^! | select -first 1 -skip 43" ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline44a.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "$csv1 = @(gc 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline44a.csv');for ($i=0; $i -lt $csv1.Count; $i++) {$csv4 += $csv1[$i]};$csv4 | Out-File 'C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line44.csv'" >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem start /b /wait powershell.exe -command "Write-Host -NoNewLine '!line2_%%%%i!	' " ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\r.csv


rem if !counter!==!nn! goto mergecolumns
rem )
rem echo. ^>^>C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\r.csv
echo ) >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\vline*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo cd C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo copy /b  >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo copy /b C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line*.csv C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\AllLinesa.csv /y ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo powershell -Command "(gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\AllLinesa.csv) -replace '\?', '' | Out-File C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\AllLinesb.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\AllLinesb.csv ^> C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\Summary1.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo powershell -Command "(gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\Summary1.csv) -replace '\?', '' | Out-File C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\Summary2.csv" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo CMD /A /C TYPE C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\Summary2.csv ^> C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\SoftwarePM_Report_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.csv >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\Summary1.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\Summary2.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\_Summary.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\line*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\AllLinesa.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\AllLinesb.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat






rem echo echo Import-CSV "C:\SE_SETUP\SOFTWAREPM\pmhtml.csv" ^^^| ConvertTo-Html -Head $css ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CustomerSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo echo Import-CSV "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SUMMARY\SoftwarePM_Report_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.csv" ^^^| ConvertTo-Html -Head $css ^^^| Out-File -Append "C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\CustomerSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" ^>^>C:\SE_SETUP\htm.ps1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo powershell -Command "$ErrorActionPreference = 'SilentlyContinue' ; C:\SE_SETUP\htm.ps1" >>C:\SE_SETUP\SOFTWAREPM\setup.bat




echo :copypms >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem echo powershell -Command "$ErrorActionPreference = 'SilentlyContinue' ; (gc C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html) -replace 'NoDevicesFound', '%%pmIPdev%%' | Out-File C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\SchneiderSWPM_Report_%%computername%%_%%date:~4,2%%-%%date:~7,2%%-%%date:~10,4%%.html" >>C:\SE_SETUP\SOFTWAREPM\setup.bat



echo del C:\SE_SETUP\htm.ps1 /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\header.html /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\summarypath.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\alert.txt /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\pm*.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\header.html /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\pmheader.csv /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo cls >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem echo net user shareduser %pmpw% /add>>C:\SE_SETUP\setup.bat
rem echo net localgroup "Administrators" shareduser /add>>C:\SE_SETUP\setup.bat
rem echo net user shareduser %pmpw% >>C:\SE_SETUP\setup.bat
rem echo WMIC USERACCOUNT WHERE "Name='shareduser'" SET PasswordExpires=False>>C:\SE_SETUP\setup.bat




rem echo net user pmuser Software1PM /add>>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo net localgroup "Administrators" pmuser /add>>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo net user pmuser Software1PM>>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo WMIC USERACCOUNT WHERE "Name='pmuser'" SET PasswordExpires=False>>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo start C:\SE_SETUP\SOFTWAREPM\setuptsk.bat >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo schtasks /CREATE /SC DAILY /TN SPMCOPY /TR "C:\SE_SETUP\SOFTWAREPM\setup.bat" /ST 00:00 /RL HIGHEST /ru %domainuser%\shareduser /rp "%pmpw%" /F>>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo ^@echo off >C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo start C:\SE_SETUP\SOFTWAREPM\setup.bat >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo schtasks /create /sc once /ST 23:59 /tn PMCOPY /tr C:\SE_SETUP\SOFTWAREPM\setup.bat /F /RL HIGHEST /ru %domainuser%\shareduser /rp "%pmpw%" >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat

echo :check >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo if exist C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\Customer*.html (goto copyover) else (goto check) >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo :copyover >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo ping localhost -n 10 >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
FOR /F "tokens=2,3" %%A IN ('ping %computername% -n 1 -4') DO IF "from"== "%%A" set "IP=%%~B"
set ipadd=%IP:~0,-1%

rem echo robocopy C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\ \\%IPadd%\c$\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\!site!_!engineer!_SOFTWAREPM_%%computername%%_%date:~10,4%-%date:~4,2%-%date:~7,2%.txt /w:1 /r:1 >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat

rem powershell -Command "$hello=echo xcopy` `"C:\SE_SETUP\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt`" `"\\%IP:~0`,-1%\se_setup\SOFTWAREPM\%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%\`" /y /d /s ; $hello | Out-File -Append C:\SE_SETUP\SOFTWAREPM\setuptsk.bat"

rem echo set hr=%%time:~0,-8%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo set min=%%time:~3,-6%% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo set /A min2=%%min%% + 2 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo if %%min2%%==0 (set min2=00) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==1 (set min2=01) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==2 (set min2=02) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==3 (set min2=03) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==4 (set min2=04) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==5 (set min2=05) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==6 (set min2=06) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==7 (set min2=07) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==8 (set min2=08) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%min2%%==9 (set min2=09) >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /create /sc once /ST %%time:~0,-8%%%%min2%%  /tn PMCOPY /tr C:\SE_SETUP\SOFTWAREPM\setuptsk.bat /F /RL HIGHEST /ru %domainuser%\shareduser /rp "%pmpw%" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /create /sc once /ST %%time:~0,-8%%%%min2%%  /tn PMCOPY /tr C:\SE_SETUP\SOFTWAREPM\setuptsk.bat /F /RL HIGHEST /ru %username% >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /create /sc once /ST %%time:~0,-8%%%%min2%%  /tn PMCOPY /tr C:\SE_SETUP\SOFTWAREPM\setuptsk.bat /F /RL HIGHEST /ru pmuser >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /create /sc once /st 23:59 /tn PMCOPY2 /tr C:\SE_SETUP\SOFTWAREPM\setuptsk.bat /F /RL HIGHEST /ru Shareduser /rp !pmpw!>>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo ping localhost -n 5 >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo schtasks /run /tn PMCOPY2 >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%computername%\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%computername%\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%computername%\c$\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%computername%\c$\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%IP:~0,-1%\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%IP:~0,-1%\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%IP:~0,-1%\c$\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" "\\%IP:~0,-1%\c$\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo del c:\SE_SETUP\SOFTWAREPM\setup*.bat /q >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat

rem echo schtasks /RUN /TN PMCOPY >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo xcopy "C:\SE_SETUP\SOFTWAREPM\!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" "\\%IP:~0,-1%\se_setup\SOFTWAREPM\" /y /d >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo TASKKILL /F /IM cmd.exe /T >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat

rem echo start cmd.exe @cmd /k "xcopy "C:\SE_SETUP\SOFTWAREPM\*_SOFTWAREPM_*.txt" "\\%IP:~0,-1%\se_setup\SOFTWAREPM\" /y /d">>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo robocopy C:\SE_SETUP\SOFTWAREPM\ \\%IP:~0,-1%\se_setup\SOFTWAREPM\ /w:1 /r:1 >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo schtasks /create /sc once /ST %schtime%  /tn PMCOPY /tr C:\SE_SETUP\SOFTWAREPM\setup.bat /F /RL HIGHEST /ru %domainuser%\shareduser /rp "%pmpw%" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /RUN /TN PMCOPY >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo :loop >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo type "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" ^| findstr "Additional Notes:" >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo if %%errorlevel%% EQU 0 xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" "\\%IP:~0,-1%\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d ^& exit >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
rem echo if %%errorlevel%% EQU 1 goto loop >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat

echo exit >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo exit >>C:\SE_SETUP\SOFTWAREPM\setuptsk.bat
echo start /MIN C:\SE_SETUP\SOFTWAREPM\setuptsk.bat >>C:\SE_SETUP\SOFTWAREPM\setup.bat


rem echo :loop >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo type "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" ^| findstr "Additional Notes:" >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% EQU 0 xcopy "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\!site!_!engineer!_SOFTWAREPM_%%computername%%_%%date:~10,4%%-%%date:~4,2%%-%%date:~7,2%%.txt" "\\%IP:~0,-1%\se_setup\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d ^& exit >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo if %%errorlevel%% EQU 1 goto loop >>C:\SE_SETUP\SOFTWAREPM\setup.bat

echo type null ^>C:\SE_SETUP\SOFTWAREPM\setup.bat >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo type null ^>C:\SE_SETUP\SOFTWAREPM\setup2.bat >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo del C:\SE_SETUP\SOFTWAREPM\setup*.bat /q >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo exit >>C:\SE_SETUP\SOFTWAREPM\setup.bat
echo exit >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo ping localhost ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /Delete /TN PMCOPY /f >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo TASKKILL /F /IM cmd.exe /T >>C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo ping localhost -n 95 ^>nul >>C:\SE_SETUP\SOFTWAREPM\setup.bat
rem echo schtasks /Delete /TN PMCOPY /f >>C:\SE_SETUP\SOFTWAREPM\setup.bat



rem start C:\SE_SETUP\SOFTWAREPM\setup.bat

rem echo *** number of Possible Network Devices Discovered: !nn! 
rem echo *** Attempting to create Software PM report on the following devices: 
rem echo ==============================================================
rem type c:\se_setup\distinctip.txt
rem echo.
rem echo ==============================================================
rem echo.
rem echo If you do not see a device on this list, confirm you are able to map to its
rem echo C:\ drive by typing \\ipaddress\c$ from the start menu of this computer.
rem echo Also make sure the %username% user exists on the missing computer.
ping localhost -n 10 >nul 2>&1

del c:\se_setup\softwarepm\PM_Logs.txt /q >nul 2>&1
del c:\se_setup\failedpm.txt /q >nul 2>&1
del c:\se_setup\passedpm*.txt /q >nul 2>&1
del c:\se_setup\softwarepm\wmic.txt /q >nul 2>&1

rem echo Dim WinScriptHost >C:\SE_SETUP\SOFTWAREPM\setup.vbs
rem echo Set WinScriptHost = CreateObject("WScript.Shell") >>C:\SE_SETUP\SOFTWAREPM\setup.vbs
rem echo WinScriptHost.Run Chr(34) ^& "C:\SE_SETUP\SOFTWAREPM\setup.bat" ^& Chr(34), 0 >>C:\SE_SETUP\SOFTWAREPM\setup.vbs
rem echo Set WinScriptHost = Nothing >>C:\SE_SETUP\SOFTWAREPM\setup.vbs

set "counter=1"
for /l %%i in (1 1 !nn!) do ( 
rem echo ========================================== 
echo [!counter! of !nn!]. Copying Scripts to !line2_%%i!
rem echo ========================================== 
set /A "counter=!counter!+1" >nul 2>&1
set "line=!line2_%%i!"
mkdir \\!line2_%%i!\C$\SE_SETUP\SOFTWAREPM\ >nul 2>&1
WMIC /node:"!line2_%%i!" process call create "cmd.exe /c START /MIN schtasks /end /tn PMCOPY2 /F" >nul 2>&1
WMIC /node:"!line2_%%i!" process call create "cmd.exe /c START /MIN schtasks /end /tn PMCOPY /F" >nul 2>&1
xcopy "C:\SE_SETUP\SOFTWAREPM\setup.bat" "\\!line2_%%i!\C$\SE_SETUP\SOFTWAREPM\" /y /d >nul 2>&1

if !errorlevel! EQU 0 echo !line2_%%i! >>c:\se_setup\passedpm.txt
if !errorlevel! NEQ 0 echo !date:~4!:!time:~0,5!. !line2_%%i! - Failed. Run PM locally. >>c:\se_setup\softwarepm\PM_Logs.txt 


rem if !errorlevel! NEQ 0 goto spdup
xcopy "C:\SE_SETUP\SOFTWAREPM\setuptsk.bat" "\\!line2_%%i!\C$\SE_SETUP\SOFTWAREPM\" /y /d >nul 2>&1
del \\!line2_%%i!\C$\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\*.* /q >nul 2>&1
rmdir /S /Q \\!line2_%%i!\C$\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\SUMMARY >nul 2>&1
rem WMIC /node:"!line2_%%i!" process call create "cmd.exe /c TASKKILL /F /IM cmd.exe /T" >nul 2>&1


if exist "\\!line2_%%i!\C$\Program Files (x86)\INET Seven\INetW.exe" call :INETroutes
if exist "\\!line2_%%i!\C$\Program Files\INET Seven\INetW.exe" call :INETroutes

cls
rem WMIC /node:"!line2_%%i!" process call create "cmd.exe /c Start C:\SE_SETUP\SOFTWAREPM\setup.bat"
)


echo -------------------------------------------------

ren C:\SE_SETUP\SOFTWAREPM\setup.bat setup2.bat >nul 2>&1
echo exit >C:\SE_SETUP\SOFTWAREPM\setup.bat
START /MIN schtasks /delete /tn PMCOPYlocal /F >nul 2>&1
START /MIN schtasks /delete /tn PMCOPY /F >nul 2>&1
ping localhost -n 3 >nul 2>&1
START /MIN schtasks /create /sc once /sd 01/01/2199 /st 21:00 /tn PMCOPYlocal /tr C:\SE_SETUP\SOFTWAREPM\setup2.bat /F /RL HIGHEST >nul 2>&1

set "file2=c:\se_setup\passedpm.txt"
setlocal EnableDelayedExpansion
<"!file2!" (
  for /f %%i in ('type "!file2!" ^| find /c /v ""') do set /a nnn=%%i && for /l %%m in (1 1 %%i) do (
    set /p "line22_%%m="
  )
)
set "counter=1"


set "psegpw=pseg20@0SEC"

set "counter=1"
for /l %%i in (1 1 !nnn!) do ( 
rem echo ========================================== 
echo [!counter! of !nnn!]. Running Software PM on !line22_%%i! 
rem echo ========================================== 
set /A "counter=!counter!+1" >nul 2>&1
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c net user se_admin !psegpw! /add" >nul 2>&1
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c net localgroup "Administrators" se_admin /add" >nul 2>&1
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c net user se_admin !psegpw!" >nul 2>&1
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c rem WMIC USERACCOUNT WHERE \"Name='se_admin'\" SET PasswordExpires=False" >nul 2>&1


WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /delete /tn PMCOPY2 /F" >nul 2>&1
ping localhost -n 2 >nul 2>&1
WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /create /sc once /sd 01/01/2199 /st 23:30 /tn PMCOPY2 /tr C:\SE_SETUP\SOFTWAREPM\setuptsk.bat /F /RL HIGHEST" >nul 2>&1



WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /delete /tn PMCOPY /F" >nul 2>&1
ping localhost -n 2 >nul 2>&1
WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /create /sc once /sd 01/01/2199 /st 22:59 /tn PMCOPY /tr C:\SE_SETUP\SOFTWAREPM\setup.bat /F /RL HIGHEST" >nul 2>&1
ping localhost -n 2 >nul 2>&1
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c C:\SE_SETUP\SOFTWAREPM\setup.bat"
rem ping localhost -n 4 >nul


rem ping localhost -n 6 >nul 2>&1

rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c if not exist C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\*.csv call C:\SE_SETUP\SOFTWAREPM\setup.bat" >nul 2>&1
schtasks /end /tn PMCOPY /S !line22_%%i! >nul 2>&1
schtasks /end /tn PMCOPY2 /S !line22_%%i! >nul 2>&1
ping localhost -n 1 >nul 2>&1
rem schtasks /run /tn PMCOPY >nul 2>&1
WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /run /tn PMCOPYlocal" >nul 2>&1
ping localhost -n 1 >nul 2>&1
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /run /tn PMCOPYlocal" >nul 2>&1

rem ===================================================================================================================
WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /run /tn PMCOPY" >c:\se_setup\softwarepm\wmic.txt
rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN C:\SE_SETUP\SOFTWAREPM\setup.bat" >c:\se_setup\softwarepm\wmic.txt
rem ===================================================================================================================

ping localhost -n 16 >nul 2>&1
rem if not exist "\\!line22_%%i!\C$\se_setup\softwarepm\!date:~10,4!-!date:~4,2!-!date:~7,2!\*.csv" WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN C:\SE_SETUP\SOFTWAREPM\setup2.bat" >nul 2>&1


rem ===================================================================================================================
if not exist "\\!line22_%%i!\C$\se_setup\softwarepm\!date:~10,4!-!date:~4,2!-!date:~7,2!\*.csv" WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN C:\SE_SETUP\SOFTWAREPM\setup.bat" >nul 2>&1
rem ===================================================================================================================

rem echo WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /run /tn PMCOPY"


type c:\se_setup\softwarepm\wmic.txt | findstr "successful" >nul 2>&1

rem ping localhost -n 10 >nul 2>&1
rem if exist "\\!line22_%%i!\C$\se_setup\softwarepm\!date:~10,4!-!date:~4,2!-!date:~7,2!\*.csv" echo !date:~4!:!time:~0,5!. !line22_%%i! - Successful. >>c:\se_setup\softwarepm\PM_Logs.txt
rem if exist "\\!line22_%%i!\C$\se_setup\softwarepm\!date:~10,4!-!date:~4,2!-!date:~7,2!\*.csv" echo !line22_%%i! >>c:\se_setup\passedpm2.txt
rem if not exist "\\!line22_%%i!\C$\se_setup\softwarepm\!date:~10,4!-!date:~4,2!-!date:~7,2!\*.csv" echo !line22_%%i! >>c:\se_setup\failedpm.txt

if !errorlevel! EQU 0 (echo !date:~4!:!time:~0,5!. !line22_%%i! - Successful. >>c:\se_setup\softwarepm\PM_Logs.txt
echo !line22_%%i! >>c:\se_setup\passedpm2.txt)
rem if !errorlevel! NEQ 0 (echo !line22_%%i! >>c:\se_setup\failedpm.txt)
if !errorlevel! NEQ 0 echo !date:~4!:!time:~0,5!. !line22_%%i! - Failed. Run PM locally. >>c:\se_setup\softwarepm\PM_Logs.txt 

del c:\se_setup\softwarepm\wmic.txt /q >nul 2>&1

rem WMIC /node:"!line22_%%i!" process call create "cmd.exe /c if not exist C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\*.* call C:\SE_SETUP\SOFTWAREPM\setup.bat" >nul 2>&1


:skiplocal
rem WMIC /node:"! ..
rem WMIC /node:"!line2_%%i!" process call create "cmd.exe /c echo It's now safe to close this window... &  ping localhost -n 72000 >nul & del C:\SE_SETUP\SOFTWAREPM\setup.bat"
rem ping localhost -n 7 >nul
rem WMIC /node:"!line2_%%i!" process call create "cmd.exe /c SCHTASKS /Run /TN "Backup""
rem ***** leave this bracket
)

goto dontretrypm
type c:\se_setup\failedpm.txt | Findstr /I "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9" >nul 2>&1
if %errorlevel% EQU 0 goto retrypm
if %errorlevel% NEQ 0 goto dontretrypm
:retrypm
set "nnn=0"
set "file3=c:\se_setup\failedpm.txt" >nul 2>&1
setlocal EnableDelayedExpansion
<"!file3!" (
  for /f %%i in ('type "!file3!" ^| find /c /v ""') do set /a nnnn=%%i && for /l %%m in (1 1 %%i) do (
    set /p "line3_%%m="
  )
)
set "counter=1"
echo -----------------------------------------------------
for /l %%i in (1 1 !nnnn!) do ( 
echo [!counter! of !nnnn!]. Retrying Failed Software PM on !line3_%%i! 
WMIC /node:"!line22_%%i!" process call create "cmd.exe /c START /MIN schtasks /run /tn PMCOPY" >c:\se_setup\softwarepm\wmic.txt
ping localhost -n 8 >nul 2>&1

type c:\se_setup\softwarepm\wmic.txt | findstr "successful" >nul 2>&1





if !errorlevel! EQU 0 (echo !date:~4!:!time:~0,5!. !line3_%%i! - Retry Successful. >>c:\se_setup\softwarepm\PM_Logs.txt
echo !line3_%%i! >>c:\se_setup\passedpm2.txt)
if !errorlevel! NEQ 0 (echo !date:~4!:!time:~0,5!. !line3_%%i! - Failed. Run PM locally. >>c:\se_setup\softwarepm\PM_Logs.txt 
echo . >\\!line3_%%i!\C$\SE_SETUP\SOFTWAREPM\setup.bat
if exist \\!line3_%%i!\C$\SE_SETUP\SOFTWAREPM\setup.bat del \\!line3_%%i!\C$\SE_SETUP\SOFTWAREPM\setup.bat /q)
set /A "counter=!counter!+1" >nul 2>&1
del c:\se_setup\softwarepm\wmic.txt /q >nul 2>&1


)
:dontretrypm
echo ----------------------------------------------------- >>c:\se_setup\softwarepm\PM_Logs.txt

set "file2a=c:\se_setup\passedpm2.txt"
setlocal EnableDelayedExpansion
<"!file2a!" (
  for /f %%i in ('type "!file2a!" ^| find /c /v ""') do set /a o=%%i && for /l %%m in (1 1 %%i) do (
    set /p "line22a_%%m="
  )
)

rem below checks to see if the pm is being done on the same pc tool is running on. if so, and if the pm did not run properly, start it manually without WMIC

ping localhost -n 12 >nul 
if not exist "\C:\se_setup\softwarepm\!date:~10,4!-!date:~4,2!-!date:~7,2!\*.csv" goto retrylocally >nul 2>&1
goto dontretrylocally
:retrylocally
 del C:\SE_SETUP\SOFTWAREPM\localhost*.csv /q >nul 2>&1
rem ip ADDRESS
 FOR /f "tokens=2 delims=:" %%a IN ('ipconfig ^| findstr "IPv4"') DO (echo %%a >>C:\SE_SETUP\SOFTWAREPM\localhostIP.csv) 
 echo  localhost >>C:\SE_SETUP\SOFTWAREPM\localhostIP.csv
  echo %computername% >>C:\SE_SETUP\SOFTWAREPM\localhostIP.csv
   echo 127.0.0.1 >>C:\SE_SETUP\SOFTWAREPM\localhostIP.csv
rem transpose all vertical rows to one column
 START /W /I /MIN powershell -Command "Get-Content 'C:\SE_SETUP\SOFTWAREPM\localhostIP.csv' | foreach {$out = $out + $_} ; $out | Out-File 'C:\SE_SETUP\SOFTWAREPM\localhostIP2.csv' -Encoding Ascii" 
 set /p IpAddr=<C:\SE_SETUP\SOFTWAREPM\localhostIP2.csv 

 type C:\SE_SETUP\distinctip.txt | findstr /i /X "%IpAddr%" >nul 2>&1
 if %errorlevel% EQU 0 START /WAIT /MIN powershell -command "Start-Process -NoNewWindow C:\SE_SETUP\SOFTWAREPM\setup2.bat"
 :dontretrylocally

rem ***** leave this bracket
rem echo %line_1%, %line_22% etc.
rem start C:\SE_SETUP\SOFTWAREPM\setup.bat
rem del C:\SE_SETUP\SOFTWAREPM\setup.bat /q
del c:\se_setup\distinctip2.txt /q >nul 2>&1
del c:\se_setup\distinctip3.txt /q >nul 2>&1
del c:\se_setup\softwarepm\CopyAllPMsToMe.bat /q >nul 2>&1
del C:\SE_SETUP\SOFTWAREPM\setup.vbs /q >nul 2>&1
del c:\se_setup\failedpm.txt /q >nul 2>&1
del c:\se_setup\passedpm*.txt /q >nul 2>&1
cls
echo @echo off >c:\se_setup\softwarepm\CopyAllPMsToMe.bat
for /f "tokens=* delims= " %%a in (C:\SE_SETUP\distinctip.txt) do (echo xcopy "\\%%a\c$\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\*%date:~-4%.html" "c:\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >>c:\se_setup\softwarepm\CopyAllPMsToMe.bat)
rem for /f "tokens=* delims= " %%a in (C:\SE_SETUP\distinctip.txt) do (echo xcopy "\\%%a\c$\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\SUMMARY\*.txt" "c:\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\SUMMARY\" /y /d /s >>c:\se_setup\softwarepm\CopyAllPMsToMe.bat)
echo exit >>c:\se_setup\softwarepm\CopyAllPMsToMe.bat
echo -------------------------------------------------
type c:\se_setup\softwarepm\PM_Logs.txt | findstr "%date%"
echo -------------------------------------------------
rem echo Browse to C:\SE_SETUP\SOFTWAREPM on this machine and wait.
rem echo PM sheets from remote machines should automatically be copied to that location
rem echo.
rem echo.
rem echo Run the CopyAllPMsToMe.bat file to manually copy PM sheets from other 
rem echo machines to this computer.
cd C:\SE_SETUP\
if exist C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2% start cmd.exe @cmd /c "explorer.exe /e,C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%"
if not exist C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%  echo Error Creating C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2% Folder.

cd C:\SE_SETUP\ >nul 2>&1
rem FOR /F "delims=" %%A IN ('DIR/AD/B/S^|SORT/R') DO RD "%%A" >nul 2>&1

set /A html=%o%
set /A failedcount=%distinctipcount%-%o%
rem echo Software PM Complete. 
echo Successful:%o% 
echo Failed:%failedcount%
echo -------------------------------------------------
echo 0%% Complete. 0 of %html% files created.
rem echo Please wait for all %html% Html files to load. Use the "Copy PMs To Me" button if needed.
rem >c:\se_setup\SOFTWAREPM\progress.txt echo 0
set "progcheck=0"
goto endprog

:INETroutes
cls
rem echo Exporting INET Routing Tables for %line%
del c:\se_setup\INET_RoutingTable.txt /q >nul 2>&1 
taskkill /f /IM "Telnet*" >nul 2>&1 
>c:\SE_SETUP\sendkeys1.vbs ECHO set OBJECT=WScript.CreateObject("WScript.Shell") 
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "set logfile c:\se_setup\INET_RoutingTable.txt{ENTER}"  
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "open %line%{ENTER}"  
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "csi{ENTER}"  
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "csi{ENTER}"  
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "LA{ENTER}"  
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "^{C}"  
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "quit{ENTER}" 
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 500
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys "quit{ENTER}" 
>>c:\SE_SETUP\sendkeys1.vbs ECHO WScript.sleep 50 
>>c:\SE_SETUP\sendkeys1.vbs ECHO OBJECT.SendKeys " " 

rem echo Checking for Telnet on this machine and enabling...
rem echo Please Wait...
telnet 999.9.9.9 >nul 2>&1 
if %errorlevel% equ 9009 goto tel
goto skiptel
:tel
pkgmgr /iu:TelnetClient
dism /online /Enable-Feature /FeatureName:TelnetClient
:skiptel
 
start telnet.exe
cscript c:\se_setup\SendKeys1.vbs >nul 2>&1 
ping localhost -n 2 >nul 
START /WAIT /MIN powershell -command "[void][reflection.assembly]::loadwithpartialname('system.windows.forms');[system.windows.forms.sendkeys]::sendwait('^{]}')" 
ping localhost -n 2 >nul 
rem ping localhost -n 1 >nul 
rem START /WAIT /MIN powershell -command "[void][reflection.assembly]::loadwithpartialname('system.windows.forms');[system.windows.forms.sendkeys]::sendwait('quit{ENTER}')" 
taskkill /f /IM "Telnet*" >nul 2>&1 
echo LINKADDR(HW) ,X, IP ADDR ,X, D LINK NAME_SS Table >c:\se_setup\INET_RoutingTable1.txt
type c:\se_setup\INET_RoutingTable.txt | findstr ",X," >>c:\se_setup\INET_RoutingTable1.txt
START /WAIT /MIN powershell -Command "(gc c:\se_setup\INET_RoutingTable1.txt) -replace '->  ', '|' | Out-File c:\se_setup\INET_RoutingTable2.txt" 
START /WAIT /MIN powershell -Command "(gc c:\se_setup\INET_RoutingTable2.txt) -replace ',X,', '|' | Out-File c:\se_setup\INET_RoutingTable3.txt" 
START /WAIT /MIN powershell -Command "(gc c:\se_setup\INET_RoutingTable3.txt) -replace ' ', '' | Out-File c:\se_setup\INET_RoutingTable4.txt" 
START /WAIT /MIN powershell -Command "(gc c:\se_setup\INET_RoutingTable4.txt) -replace ' ', '' | Out-File c:\se_setup\INET_RoutingTable5.txt" 

type c:\se_setup\INET_RoutingTable5.txt>c:\se_setup\INET_RoutingTable6.txt
del c:\se_setup\INET_RoutingTable.txt /q >nul 2>&1 
del c:\se_setup\INET_RoutingTable1.txt /q >nul 2>&1 
del c:\se_setup\INET_RoutingTable2.txt /q >nul 2>&1 
del c:\se_setup\INET_RoutingTable3.txt /q >nul 2>&1 
del c:\se_setup\INET_RoutingTable4.txt /q >nul 2>&1 
del c:\se_setup\INET_RoutingTable5.txt /q >nul 2>&1 
del c:\se_setup\sendkeys1.vbs /q >nul 2>&1 
del \\%line%\c$\se_setup\SOFTWAREPM\INET_RoutingTable.txt /q >nul 2>&1 
copy c:\se_setup\INET_RoutingTable6.txt \\%line%\c$\se_setup\SOFTWAREPM\INET_RoutingTable.txt /y >nul 2>&1 
del c:\se_setup\INET_RoutingTable6.txt /q >nul 2>&1 
cd C:\SE_SETUP\
goto :eof




echo. >c:\se_setup\log.txt

:endprog
ping localhost -n 4 >nul 2>&1
START /WAIT /MIN powershell -command "Get-ChildItem -Path C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2% -Recurse -Filter '*SchneiderSWPM_*' | Measure-Object | %%{$_.Count} | Out-File c:\se_setup\SOFTWAREPM\num1.txt"
type c:\se_setup\SOFTWAREPM\num1.txt>c:\se_setup\SOFTWAREPM\num.txt
del c:\se_setup\SOFTWAREPM\num1.txt /q >nul 2>&1
:numm
set /p num=<c:\se_setup\SOFTWAREPM\num.txt >nul 2>&1
rem if %errorlevel% NEQ 0 goto endprog
START /WAIT /MIN powershell -command "[math]::Round(%num%/%html% * 100,0) | Out-File c:\se_setup\SOFTWAREPM\progress.txt -Encoding Ascii"
rem type c:\se_setup\SOFTWAREPM\progress1.txt>c:\se_setup\SOFTWAREPM\progress.txt
rem del c:\se_setup\SOFTWAREPM\progress1.txt /q >nul 2>&1
set /p progress=<c:\se_setup\SOFTWAREPM\progress.txt >nul 2>&1
for /f "tokens=* delims= " %%a in (C:\SE_SETUP\distinctip.txt) do xcopy "\\%%a\c$\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\*%date:~-4%.html" "c:\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\" /y /d /s >nul 2>&1
if %progcheck% EQU %progress% goto skipprogreport

echo %progress%%% Complete. %num% of %html% files created.




for /f "tokens=* delims= " %%a in (C:\SE_SETUP\distinctip.txt) do (if exist "\\%%a\c$\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" echo %date% %time% %%a Successful >>c:\se_setup\log.txt)
for /f "tokens=* delims= " %%a in (C:\SE_SETUP\distinctip.txt) do (if not exist "\\%%a\c$\se_setup\softwarepm\%date:~10,4%-%date:~4,2%-%date:~7,2%\SchneiderSWPM*.html" echo %date% %time% %%a Failed >>c:\se_setup\log.txt)
echo =========================================================== >>c:\se_setup\log.txt






:skipprogreport
set "progcheck=%progress%"

rem echo %progress% >c:\se_setup\SOFTWAREPM\progress.txt
if %progress% EQU 100 goto endprogforreal
goto endprog
:endprogforreal
ping localhost -n 19 >nul 2>&1

START /WAIT /MIN powershell -Command "Start-Process -NoNewWindow C:\SE_SETUP\SOFTWAREPM\CopyAllPMsToMe.bat"
del C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\*.csv /q >nul 2>&1

echo.
echo.
rem echo Finalizing Customer Report...


rem echo Software PM Complete.
exit >nul 2>&1 
exit



del c:\se_setup\SOFTWAREPM\pmhtml.csv /q >nul 2>&1
rem del c:\se_setup\SOFTWAREPM\progress.txt /q >nul 2>&1
del c:\se_setup\SOFTWAREPM\num.txt /q >nul 2>&1
del c:\se_setup\checkd*.txt /q >nul 2>&1
del c:\se_setup\SkipRetention.txt /q >nul 2>&1
del c:\se_setup\SkipChkdsk.txt /q >nul 2>&1
del c:\se_setup\header.html /q >nul 2>&1
del C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\CustomerSWPM_Report_%date:~4,2%-%date:~7,2%-%date:~10,4%.html /q >nul 2>&1



:CustRep 
goto exitt
rem ping localhost -n 10 >nul 2>&1

echo ^<p^>^<span style="color: #27AE60; font-size: 50pt;"^>^<strong^>^<span style="font-family: Arial;"^>Schneider Electric^</span^>^</strong^>^</span^>^</p^> >C:\SE_SETUP\header.html  
echo ^<p^>^<span style="color: #27AE60; font-size: 16pt; font-family: Arial; "^>^<u^>Customer Software Preventative Maintenance Report^</u^>^</span^>^</p^> >>C:\SE_SETUP\header.html 
echo ^<br^> >>C:\SE_SETUP\header.html 
echo ^<li^>^<span style="color: #27AE60; font-family: Arial; "^>^<b^>Site Name:^</b^>!site!^</li^> >>C:\SE_SETUP\header.html 
echo ^<li^>^<span style="color: #27AE60; font-family: Arial; "^>^<b^>Date of PM:^</b^>%date:~4,2%-%date:~7,2%-%date:~10,4%^</li^> >>C:\SE_SETUP\header.html 
rem echo ^<li^>^<span style="color: #27AE60; font-family: Arial; "^>^<b^>Machine Name:^</b^>%computername%^</li^> >>C:\SE_SETUP\header.html 
echo ^<li^>^<span style="color: #27AE60; font-family: Arial; "^>^<b^>Engineer:^</b^>!engineer!^</li^> >>C:\SE_SETUP\header.html 
echo ^<p^>^<span style="color: #000000; font-size: 8pt;"^>For more information, request and refer to full Technical report. For any service related matters, please contact our Buildings Service Center 24x7 at 1-877-822-2601^</span^>^</p^> >>C:\SE_SETUP\header.html 






echo. 2>>C:\SE_SETUP\header.html 
rem echo $css = @^" >>C:\SE_SETUP\header.html 
echo ^<br^> >>C:\SE_SETUP\header.html 
echo ^<br^> >>C:\SE_SETUP\header.html 
echo ^<style^> >>C:\SE_SETUP\header.html 
echo h1, h5, th { table-layout: fixed; width: 100%%; text-align: left; margin: auto; font-family: Consolas; } >>C:\SE_SETUP\header.html 
rem echo table { table-layout: fixed; width: 100%%; margin: left; font-family: Consolas; box-shadow: 10px 10px 5px #888; border: thin ridge grey; max-width: 100%%;white-space:nowrap;} >>C:\SE_SETUP\htm.ps1 
echo table { margin: left; font-family: Consolas; box-shadow: 10px 10px 5px #888; border: thin ridge grey; max-width: 100%%;white-space:nowrap;} >>C:\SE_SETUP\header.html 
echo th { background: #0046c3; color: #fff; max-width: 400px; padding: 5px 10px; } >>C:\SE_SETUP\header.html 
echo td { font-size: 11px; padding: 5px 20px; color: #000; } >>C:\SE_SETUP\header.html 
echo tr { background: #b8d1f3; } >>C:\SE_SETUP\header.html 
echo tr:nth-child(even) { background: #dae5f4; } >>C:\SE_SETUP\header.html 
echo tr:nth-child(odd) { background: #b8d1f3; } >>C:\SE_SETUP\header.html 
echo ^</style^> >>C:\SE_SETUP\header.html 
rem echo ^"@ >>C:\SE_SETUP\header.html 





echo ^</head^>^<body^> >>C:\SE_SETUP\header.html 
echo ^<table^> >>C:\SE_SETUP\header.html 
echo ^<colgroup^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^<col/^> >>C:\SE_SETUP\header.html 
echo ^</colgroup^> >>C:\SE_SETUP\header.html 
echo ^<tr^>^<th^>Computer Name^</th^>^<th^>IP Address^</th^>^<th^>Mask^</th^>^<th^>Gateway^</th^>^<th^>Mac Address^</th^>^<th^>Domain^</th^>^<th^>Operating System^</th^>^<th^>Original Install Date^</th^>^<th^>System Boot Time^</th^>^<th^>System Manufacturer^</th^>^<th^>System Model^</th^>^<th^>Total Physical Memory^</th^>^<th^>Memory Usage Percentage^</th^>^<th^>CPU Usage Percentage^</th^>^<th^>CPU Details^</th^>^<th^>Drive Usage Percentage^</th^>^<th^>Drive Name / Free / Total^</th^>^<th^>Check Disk Results^</th^>^<th^>Firewall Status^</th^>^<th^>RDP Status^</th^>^<th^>Last Windows Update^</th^>^<th^>First Access Event ^</th^>^<th^>Video Retention ^</th^>^<th^>IP Devices Online^</th^>^<th^>NTP Source^</th^>^<th^>Total Database Size^</th^>^<th^>TightVNC^</th^>^<th^>TrendMicro^</th^>^<th^>Alerts^</th^>^<th^>Misc. ^</th^>^</tr^> >>C:\SE_SETUP\header.html 



rem del "C:\SE_SETUP\SOFTWAREPM\pmheader*.csv" /q >nul 2>&1
rem del "C:\SE_SETUP\SOFTWAREPM\pmhtml*.csv" /q >nul 2>&1
cd "C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%" >nul 2>&1
dir /b | findstr "SchneiderSWPM" >>C:\SE_SETUP\SOFTWAREPM\pmhtml.csv
echo ^@echo off>C:\SE_SETUP\pmcust.bat
ping localhost -n 5 >nul 2>&1
FOR /f %%a IN (C:\SE_SETUP\SOFTWAREPM\pmhtml.csv) DO (echo type C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\%%a ^| findstr /C:"ITServicesNJ" ^>^>C:\SE_SETUP\header.html >>C:\SE_SETUP\pmcust.bat)
rem FOR /f %%a IN (C:\SE_SETUP\SOFTWAREPM\pmhtml.csv) DO (type C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\%%a | findstr /C:"ITServicesNJ" >>C:\SE_SETUP\header.html)
rem type C:\SE_SETUP\pmheader.csv >>C:\SE_SETUP\header.html
powershell -command "Start-Process -NoNewWindow C:\SE_SETUP\pmcust.bat"

echo ^</table^> >>C:\SE_SETUP\header.html 
echo ^</body^>^</html^> >>C:\SE_SETUP\header.html 

ping localhost -n 5 >nul 2>&1

type C:\SE_SETUP\header.html >C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\CustomerSWPM_Report_%date:~4,2%-%date:~7,2%-%date:~10,4%.html 
rem powershell -Command "(gc C:\SE_SETUP\header.html) -replace 'xxxcv', '' | Out-File C:\SE_SETUP\SOFTWAREPM\%date:~10,4%-%date:~4,2%-%date:~7,2%\CustomerSWPM_Report_%date:~4,2%-%date:~7,2%-%date:~10,4%.html" 



rem del "C:\SE_SETUP\pmheader.csv" /q >nul 2>&1
rem del "C:\SE_SETUP\SOFTWAREPM\pm*.csv" /q >nul 2>&1
rem del "C:\SE_SETUP\SOFTWAREPM\header.html" /q >nul 2>&1

echo.
echo.
echo Software PM Complete.

:exitt
exit >nul 2>&1 


