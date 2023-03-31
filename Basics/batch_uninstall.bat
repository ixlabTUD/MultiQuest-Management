:: Uninstall the passed APK on all connected devices!
:: call via batch_uninstall.bat "<PathTo.APK>"
:: i.e. batch_uninstall.bat "C:/My/Hidden/Masterpiece.apk"

@echo off
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a uninstall %1 )
)