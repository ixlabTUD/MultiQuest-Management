@REM This tool uses Windows Terminal ("wt") (https://learn.microsoft.com/en-us/windows/terminal/) to allow a more structured layout when dealing with multiple cmd windows. It requires wt to be installed and added as a path variable.
@REM This tool opens 6 cmd panes within one wt window to allow quick access.

@REM I tend to use these for 
    @REM 1. batch_launch.bat "com.vrad.divrex_V2"
    @REM 2. batch_stop.bat "com.vrad.divrex_V2"
    @REM 3. batch_mainStartMultiDeviceConnection.bat
    @REM 4. adb devices
    @REM 5. batch_ProximitySensorOff.bat
    @REM 6. batch_mainStartMultiDeviceScreenCast.bat
@REM ([1-3] = Top row left to right)
@REM ([4-6] = Bottom row left to right)


start /b wt -p "Command Prompt" -d %~dp0\Basics ; split-pane -p "Command Prompt"  -V -d %~dp0\Basics -s .66666 ; split-pane -p "Command Prompt"  -V -d %~dp0\Advanced ; mf left ; mf left ; split-pane -p "Command Prompt"  -H -d %~dp0\Basics ; mf right ; split-pane -p "Command Prompt"  -H -d %~dp0\Basics\SystemBehaviour ; mf right ; split-pane -p "Command Prompt"  -H -d %~dp0\Advanced
