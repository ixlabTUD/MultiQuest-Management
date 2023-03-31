:: Enables "Guardian" on all devices!
:: call via batch_GuardianOn.bat

@echo off

FOR /F "tokens=1,2 skip=1" %%a IN ('adb devices') DO (
    echo Starting on device on: %%a

    @REM Disable guardian on all devices
    @REM IF "%%b" == "device" ( start /b adb -s %%a shell setprop debug.oculus.guardian_pause 0)
    @REM Enable guardian on all devices
    IF "%%b" == "device" ( start /b adb -s %%a shell setprop debug.oculus.guardian_pause 1)
)

:loopQuit
echo Ending...
pause

:: start-process powershell -ArgumentList '-noexit -command Read-Host'

:: adb kill-server
:: set audio
:: set experimental?
