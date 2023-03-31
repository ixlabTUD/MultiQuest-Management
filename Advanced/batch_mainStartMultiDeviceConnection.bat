:: Runs "batch_ConnectToDeviceByName" on all devices!
:: call via batch_mainStartMultiDeviceConnection.bat

@echo off

FOR /F "tokens=1,2 skip=1" %%a IN ('adb devices') DO (
    echo Starting on device on: %%a
    
    @REM Start ConnectToDeviceByName
    start .\utils\batch_ConnectToDeviceByName.bat %%a)
    timeout /t 3
    :next
)

:loopQuit
echo Ending...
pause

:: start-process powershell -ArgumentList '-noexit -command Read-Host'

:: adb kill-server
:: set audio
:: set experimental?
