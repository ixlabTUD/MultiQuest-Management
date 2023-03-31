:: Launch an installed package on all connected devices!
:: call via batch_launch.bat <Package.Name>
:: i.e. batch_launch.bat com.fs.ixViewRdev

:: Inspired by https://stackoverflow.com/a/31834403/10475048


@echo off
FOR /F "tokens=1,2" %%a IN ('adb devices') DO (
    IF "%%b" == "device" ( start /b adb -s %%a shell monkey -p %1 1)
)