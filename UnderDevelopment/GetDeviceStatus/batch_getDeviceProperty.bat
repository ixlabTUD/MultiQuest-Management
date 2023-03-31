:: Get the current wifi properties from all adb connected devices.
:: call via batch_getStatus.bat <Status>
:: i.e. batch_getStatus.bat battery
:: Options are, for example: battery diskstats wifi location usagestats cpuinfo iphonesubinfo telephony.registry meminfo netstat package

:: To get all possible options:
:: call batch_getStatus.bat
:: call batch_getStatus.bat help

@echo off


IF "%1" == "" GOTO help
IF "%1" == "help"  GOTO help

GOTO execute


:execute
echo executing.
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a shell dumpsys %1 %* )
)
GOTO end


:help
echo Listing available options:
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" DO ( 
        start /b adb -s %%a shell dumpsys | findstr /c: "DUMP OF SERVICE" 

        :: Listing once will suffice.
        GOTO end
    )
)



:end