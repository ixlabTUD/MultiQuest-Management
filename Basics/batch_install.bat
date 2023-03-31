:: Install the passed APK on all connected devices!
:: call via batch_install.bat "<PathTo.APK>"
:: i.e. batch_install.bat "C:/My/Hidden/Masterpiece.apk"

:: Inspired by https://stackoverflow.com/a/31834403/10475048

@echo off
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a install -r %1 )
)