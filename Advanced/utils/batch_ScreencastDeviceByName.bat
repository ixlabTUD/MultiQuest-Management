:: Starts screencasting from all adb connected devices!
:: call via batch_ScreencastDeviceByName.bat "<deviceName>" "<PathWithoutMP4EndingWith\-MayBeEmpty>"
:: i.e. batch_ScreencastDeviceByName.bat "123d523ogdf34"

:: See example use in "batch_ScreencastDeviceByName.bat"

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


@REM @REM Learn: USB or WiFi:
@REM @set "deviceAddr=%1"
@REM SET _result=%deviceAddr:~3,1%
@REM @REM ECHO %_result%      
@REM IF "%_result%"=="." (
@REM     echo FoundIP
@REM     echo Bailing...
@REM     GOTO quit
@REM ) ELSE (
@REM     echo FoundUSB
@REM     echo Continuing.
@REM )
@REM echo.

@REM Calculate Time in Unix
for /f %%x in ('wmic path win32_utctime get /format:list ^| findstr "="') do (
    set %%x)
set /a z=(14-100%Month%%%100)/12, y=10000%Year%%%10000-z
set /a ut=y*365+y/4-y/100+y/400+(153*(100%Month%%%100+12*z-3)+2)/5+Day-719469
set /a ut=ut*86400+100%Hour%%%100*3600+100%Minute%%%100*60+100%Second%%%100


@REM Process
FOR /F "tokens=1,3,9" %%a IN ('adb -s %1 shell ip route') DO (
    echo from: %%a
    echo on: %%b
    echo android device IP: %%c
    Rem Catch!
    IF "%%b" NEQ "wlan0" ( goto end )
    echo.

    Rem Start ScrCpy
    echo Starting scrcpy on device on: %%c
    IF "%~2" == "" (
        @REM If %1 NOT an IP:
        findstr /r "*[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*" "%1" >nul 2>&1
        IF ERRORRLEVEL NEQ 0 (
            echo Starting scrcpy on device on: %1
            start /b scrcpy -s %1 --force-adb-forward --crop 1832:1920:0:0
        ) ELSE (
            echo Starting scrcpy on device on: %%c
            start /b scrcpy --tcpip=%%c --force-adb-forward --crop 1832:1920:0:0
        )
    ) ELSE (
        @REM for /f "Tokens=4 delims=." %%d in (%%c) do set lastOctett=%%d
        @REM echo %lastOctett%
        @REM pause

        @REM for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
        @REM set mytime=%time%
        @REM echo Current time is %mydate%:%mytime%

        @REM call :GetUnixTime UNIX_TIME
        echo %ut% seconds have elapsed since 1970-01-01 00:00:00

        @REM If %1 NOT an IP:
        findstr /r "*[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*" "%1" >nul 2>&1
        IF ERRORRLEVEL NEQ 0 (
            echo Starting scrcpy on device on: %1
            start /b scrcpy -s %1 --force-adb-forward --crop 1832:1920:0:0 -r "%~2.%ut%.mp4"
        ) ELSE (
            echo Starting scrcpy on device on: %%c
            @REM start /b scrcpy -s %%c:5555 --force-adb-forward --crop 1832:1920:0:0 -r "%~2.%ut%.%1.mp4"
            start /b scrcpy -s %%c:5555 --force-adb-forward --crop 1832:1920:0:0 -r "%~2.%ut%.mp4"

        )

    )
    echo.
)

:theEnd
@endlocal 


@REM Close Window
echo.
echo This window will self destruct in t-30 seconds.
timeout /t 30

@REM pause

:quit
exit


:GetUnixTime
setlocal enableextensions
for /f %%x in ('wmic path win32_utctime get /format:list ^| findstr "="') do (
    set %%x)
set /a z=(14-100%Month%%%100)/12, y=10000%Year%%%10000-z
set /a ut=y*365+y/4-y/100+y/400+(153*(100%Month%%%100+12*z-3)+2)/5+Day-719469
set /a ut=ut*86400+100%Hour%%%100*3600+100%Minute%%%100*60+100%Second%%%100
echo %ut%
endlocal & set "%1=%ut%"


:: start application (check if its already running?)
:: encryption
:: sound
:: screen ratio
:: window size