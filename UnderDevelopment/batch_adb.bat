:: Run the same ADB Command on all connected devices. NOT FULLY TESTED!
:: call via batch_adb.bat <ADB command>

:: Inspired by https://stackoverflow.com/a/31834403/10475048


@echo off
cls
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b %1)
)