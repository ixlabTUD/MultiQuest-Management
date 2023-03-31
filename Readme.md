# Quest Batch Files

Here you can find a lot of batch files that allow to batch many common tasks.
It proves to save a lot of time for uses cases where you need to control more than one Quest.

## Requirements
**ADB:** For all scripts, you will need to have ADB on your computer and registered in your systems _path_. You can check whether this is the case by typing adb in a CMD/terminal window.

**Pro Tip:** It helps to use the same ADB instance on all apps, as they will fight each other otherwise. I find it helpful to use the Unity-Editor's ADB of the Unity-Version I currently use in all apps (Path, [Meta Quest Developer Hub](https://developer.oculus.com/meta-quest-developer-hub), ...)


**ScrCpy**: To see what the headsets use including passthrough, we use [ScrCpy](https://github.com/Genymobile/scrcpy). Download it and add this, too, to your systems _path_.

## Folder Structure & Files.

Most files need to be executed from a terminal. Hence, all folders have a "open_a_terminal_here" file for your convenience.

Additionally, all files are commented - so if you are unsure how to use any of them, just open the file and you should find a description and a sample usage.
Else: Ask [Florian Schier](mailto:florian.schier@tu-dresden.de).

### Basic
Files in _Basic_ are files for basic tasks!

Looking for batch 
- `install` and `uninstall`
- `launch` and `stop`
- sending custom `adb` commands to all devices? (WIP)

Basic has got you covered! 
-- Simply open a terminal here and run them according to their documentation. (See comments in .bat files.)

Additionally, the basics als contain a `SystemBehaviour` folder - here you can manipulate the Guardian- and Proximity-Sensor-Flags for all adb connected devices!

### Advanced
Files in _Advanced_ are more advanced. 🚀 
This folder thus holds a utils folder, which you might not need to look at. It just allows for a cleaner structure.

From here, you can batch-connect and batch-screencast.

**How to Batch-Connect?**
It is possible, to connect Android devices through ADB wirelessly!

Doing this on one device is easy enough, but it becomes incredibly tideous over time. Thus, we batch this process instead. 

1. Connect as many devices as you can/need to your computer with USB-A/-C cables.
2. Ensure all of them (including your machine!) are on the same network. (Eduroam does not always work, and most certainly never does at the APB.)
3. Optional: run `adb devices` in a terminal to ensure you have all devices connected and reachable by adb.
4. Run the batch file "`batch_mainStartMultiDeviceConnection`" 
5. Optional: run `adb devices` in a terminal to hopefully now find _n_ new devices that are connected with thorugh an IP.
6. USB-unplug all your devices.

!! Devices need to be USB-connected && on the same network !!

**How to do Batch-Screencasting?**
This allows you to start a ScreenCopy-client for every connected device! 

_Note:_ Please first **disconnect all usb devices** if you want to use this on wirelessly connected devices. Unplugging ANY device (even a mouse) can cause ScreenCopy to kill all clients and close all streams.

- `batch_mainStartMultiDeviceConnection` followed by `batch_mainStartMultiDeviceScreenCast`.
    - `batch_mainStartMultiDeviceConnection`: Connects all USB-connected ADB devices that are on the same WiFi through TCP.
    - `batch_mainStartMultiDeviceScreenCast`: Starts cast on all devices that can currently be reached through `adb devices`

Steps:
- Connect devices (USB or ADB wireless, i.e. through `batch_mainStartMultiDeviceConnection`)
- Run `batch_mainStartMultiDeviceScreenCast`.
- _n_ windows should open up with screen casts! Be patient if they don't open up immediately, some commands may take a second, especially when connecting devices through adb wireless.


### Under Development

These are under development and should not be considered stable. The goal is to build more features that we find ourselves doing again and again, and maybe giving them some interface and not just terminal. As this is a very low priority, feel free to contribute.


## Debugging Tips

### General Errors

If problems occur, `adb devices` is your friend. It will tell you what devices are connected, and you might be able to determine why devices aren't working as intended by starting here.

### No TCP-connected devices?

Run `adb devices` and check what devices are connected. 

- USB-connected devices will appear by their cryptic unique device name, 
- TCP connected devices will show via their IP and Port.

Found no wireless devices after running `batch_mainStartMultiDeviceConnection`? Make sure you are on the same Network!

_Note:_ Some networks, such as Eduroam, do often not allow this.


### Device shows up in `adb devices` list, but as unauthorized?
Put on the HMD and allow the connection from there. You can also "always allow from this device" if you trust the computer.

### Device shows up in `adb devices` list, but as offline?
Your device might be sleeping, or its current connection to the WiFi network might be broken. Check this first.
