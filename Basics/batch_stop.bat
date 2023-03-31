:: Force-Stop the passed package on all connected devices
:: call via batch_stop.bat <Package.Name>
:: i.e. batch_stop.bat com.fs.ixViewRdev

:: Inspired by https://stackoverflow.com/a/31834403/10475048


@echo off
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a shell am force-stop %1)
)