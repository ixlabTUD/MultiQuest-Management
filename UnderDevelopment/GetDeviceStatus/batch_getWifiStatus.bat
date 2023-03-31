:: Get the current wifi properties from all adb connected devices.
:: call via batch_getWifiStatus.bat

@echo off
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a shell dumpsys wifi )
)