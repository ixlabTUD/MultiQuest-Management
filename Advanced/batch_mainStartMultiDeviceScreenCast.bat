:: Runs "batch_ScreencastDeviceByName" on all devices!
:: call via batch_mainStartMultiDeviceScreenCast.bat "<PathWithoutMP4EndingWith\-MayBeEmpty>"

@echo off

FOR /F "tokens=1,2 skip=1" %%a IN ('adb devices') DO (
    echo Starting on device on: %%a

    @REM Start ConnectAndScreencast
    @REM make sure that it is a device, and that it is not offline.
    IF "%~1" == "" (
        IF "%%b" == "device" ( start .\utils\batch_ScreencastDeviceByName.bat %%a)
    ) ELSE (
        @REM start scrcpy --tcpip=%%c --force-adb-forward --crop 
        IF "%%b" == "device" ( start .\utils\batch_ScreencastDeviceByName.bat %%a "%~1")
    )
    timeout /t 5
)

:loopQuit
echo Ending...
pause

:: start-process powershell -ArgumentList '-noexit -command Read-Host'

:: adb kill-server
:: set audio
:: set experimental?
