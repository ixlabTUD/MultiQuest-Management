:: Disables "ProximitySensor" on all devices!
:: call via batch_ProximitySensorOff.bat

@echo off

FOR /F "tokens=1,2 skip=1" %%a IN ('adb devices') DO (
    echo Starting on device on: %%a

    @REM Disable proximity sensor on all devices
    IF "%%b" == "device" ( 
        start /b adb -s %%a shell am broadcast -a com.oculus.vrpowermanager.prox_close
    )
    @REM Enable proximity sensor on all devices
    @REM IF "%%b" == "device" ( start /b adb -s %%a shell am broadcast -a com.oculus.vrpowermanager.automation_disable)
)

:loopQuit
echo Ending...
pause

:: start-process powershell -ArgumentList '-noexit -command Read-Host'

:: adb kill-server
:: set audio
:: set experimental?
