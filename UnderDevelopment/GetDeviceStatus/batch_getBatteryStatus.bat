:: Get the current battery properties from all adb connected devices.
:: call via batch_getBatteryStatus.bat

@echo off
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a shell dumpsys battery )
)