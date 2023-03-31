:: Launch an installed package on all connected devices!
:: call via batch_scrcpy.bat <IP> <Crop>
:: i.e. batch_scrcpy.bat "192.168.1.1" "1224:1440:0:0"

@echo off
scrcpy --tcpip=%~1 --force-adb-forward --bit-rate 2M --crop %~2
pause 