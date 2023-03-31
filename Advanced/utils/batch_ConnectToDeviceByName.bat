:: Connects Wifi to all "TCP-not-connected && USB-connected" devices and !
:: call via batch_ConnectToDeviceByName.bat "<deviceName>"
:: i.e. batch_ConnectToDeviceByName.bat "123d523ogdf34"

:: See example use in "batch_ConnectToDeviceByName.bat"

@echo off

@setlocal ENABLEDELAYEDEXPANSION

@REM TimeStamp
echo Started at:        %Date% - %time:~0,-3%
echo Checking device:   "%1"
echo.

@REM Fetch all devices
@set "listOfDevices="
@FOR /F "tokens=1,2 skip=1" %%a IN ('adb devices') DO (
    @set "listOfDevices=!listOfDevices! %%a"
)
echo List of devices: %listOfDevices%
echo.


@REM Learn: USB or WiFi:
@set "deviceAddr=%1"
SET _result=%deviceAddr:~3,1%
@REM ECHO %_result%      
IF "%_result%"=="." (
    echo FoundIP
    echo Bailing...
    GOTO quit
) ELSE (
    echo FoundUSB
    echo Continuing.
)
echo.

@REM Process
FOR /F "tokens=1,3,9" %%a IN ('adb -s %1 shell ip route') DO (
    echo from: %%a
    echo on: %%b
    echo android device IP: %%c
    Rem Catch!
    IF "%%b" NEQ "wlan0" ( goto end )
    echo.

    @REM Check if this IP already in devices
    echo %listOfDevices%|find "%%c" >nul
    IF errorlevel 1 (
        echo Device not yet connected wirelessly. Connecting...
        echo.

        Rem Start TCPIP on device
        echo Starting TCPIP on device on: %1
        start /b adb -s %1 tcpip 5555
        timeout /t 3

        Rem Connecting to device
        echo Connecting to device: %%c
        start /b adb connect %%c
        timeout /t 3
        echo.
    ) ELSE (
        echo Device already connected wirelessly.
    )
    echo.
)

:theEnd
@endlocal 


@REM Close Window
echo.
echo This window will self destruct in t-30 seconds.
timeout /t 30

:quit
exit

:: start application (check if its already running?)
:: encryption
:: sound
:: screen ratio
:: window size