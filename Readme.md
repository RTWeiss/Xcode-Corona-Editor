##Xcode as Corona SDK Editor##

This plugin works with Xcode 4+5 - Corona Starter, Basic, Pro, Enterprise and Cards

Created by Jacob Nielsen 2014 - v.1.3.1

--------------------------------------------------------------

###This project includes:###

* Auto-completion for all Corona API calls and constants
* Lua/Corona Syntax Coloring
* Corona Project Templates built into Xcode
* Corona File Templates built into Xcode
* Xcode behavior scripts for improved workflow

Behaviour scripts extends Xcodes functionality. You can pick them from the menu bar or put them on a keyboard shortcut.
Included behavior scripts:

* Launch Corona Simulator with current project
* Online documentation lookup from selected text
* Bridging of Corona Simulators options to: Show Project Sandbox, Relaunch and Build
* Open Android Device Monitor (Android SDK installation needed)
* Install apk to usb connected Android device (Android SDK installation needed)
* Upload to TestFlight
+ and more...

--------------------------------------------------------------
###Installation:###

After cloning this repo or downloading it as a zip file.

1.  Make sure Xcode is closed down.

2.  Run the Add-Corona-To-Xcode.sh script in terminal by typing:
  
  sudo your_path_to/Add-Corona-To-Xcode.sh

3.  The script installs everything exept the behavior scripts.
  Behaviors need to be installed manually in Xcode. See below.


--------------------------------------------------------------
###Verifying installation:###

* Start Xcode and create a new project template for Corona with:
  File > New > Project ( or shift+cmd+n )

* When the project is created you can check if Lua syntax coloring is installed correctly
  by selecting eg. the main.lua file and navigating to: Editor > Syntax Coloring > Lua

* Try typing eg. display in one of the lua files to see if auto-completion works.
  ( If not make sure auto-completion is enabled in the Xcode preferences )

* Press cmd+n to create file templates.

NOTE: I didn't yet manage to find a way for Xcode to recognize the .lua file type - meaning
that you have to select the lua syntax coloring manually for each file. As a workaround for this I did a couple of behavior scripts to deal with assigning lua syntax coloring. One script for coloring all lua files in current Xcode project and another one for coloring the selected file. You can assign these scripts to keyboard shortcuts via Xcode behaviors to make your life easier. ( See how to below )

If anyone figures out how to register the lua file type in Xcode please let me know. My guess is that something should be modified in the DevToolsCore.framework here: /Applications/Xcode.app/Contents/OtherFrameworks/DevToolsCore.framework/Versions/A/Resources


-
###Installing behaviors in Xcode:###

1.  In the Xcode menu bar select: Xcode > Behaviors > Edit Behaviors..
2.  Click the + sign in the lower left corner
3.  Name the behavior "Launch Corona Simulator"
4.  Assign a shortcut by clicking the box next to the behavior name (*)
5.  Click the option to "Notify using bezel or system notification"
6.  Click the option "Run" and "Choose Script..."
7.  Navigate to ~/Library/Developer/Xcode/UserData/Behaviors and pick the script called "LaunchCoronaSimulator" (**)
8.  Close the Behavior window and open a Corona project.
9.  Try running the behavior by using your shortcut or selecting it at Xcode > Behaviors

If the behavior was installed correctly Corona Simulator ( +Terminal ) should launch and open the Corona project you are currently working on in Xcode. The script assumes that the CoronaSDK folder is installed in the applications folder. If you installed it somewhere else you need to change the coronaPath property in the script.

The first time you run the "LaunchCoronaSimulator" script a dialog will show asking you to enable access for assistive devices. You need to do this or the scripts wont work. 

Go through the same procedure to install the other behavior scripts you would like to use.

------
(*) It can be hard to find a free shortcut, but if you create a new keybinding set for Corona in Xcode > Preferences > Keybindings don't be afraid to overwrite keybindings... you can always switch back.

(**) By default the Library folder isn't visible in Mac OS. If you can't see it run this in terminal: chflags nohidden ~/Library/


--------------------------------------------------------------
###Description of other included behavior scripts:###

* LuaSyntaxColorProject: colors all .lua files in current Xcode project.
* LuaSyntaxColorFile: colors selected .lua file in current Xcode project.

* OpenADM: Opens the Android Device Monitor. Installation of Android SDK needed. Change adm_path in the script to match your setup.

* AndroidDeviceInstallApk: Installs apk build to Android device connected via usb. Installation of Android SDK needed for this to work. Change buildFolder and adbPath properties in the script to match your setup.

* UploadTestFlight. Converts app to ipa and submits it to TestFlight. Installation of TestFlight desktop application needed: http://www.testflightapp.com/desktop

* ShowFilePath: Reveals file selected in Xcode in finder

* SaveAllAndRelaunch: Saves all modified files in Xcode and relaunches the Corona Simulator.

* Scale@2xTo@1x: Creates downscaled @1x.png copies of @2x.png files in your project folder. (TODO @4x version)

* OnlineDocSearch: Searches Coronas online documentation with selected text in Xcode. 

* DashDocSearch: Searches Coronas documentation with selected text in Dash documentation browser application ( http://kapeli.com/dash )

The rest of the scripts are simply bridging functionality from Corona Simulator:

* ShowProjectSandbox
* CoronaRelaunch
* BuildCoronaIOS
* BuildCoronaAndroid

--------------------------------------------------------------
###Miscellaneous:###

* After installing lua syntax coloring you can add/remove keywords for coloring in the Lua.xclangspec located at: 
  ~/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/Lua.xclangspec 
  You don't need to run the Add-Lua.sh script again for Xcode to register the changes.

* It is quite easy to do your own Project/File Templates. As a starting point just copy one of the subfolders located at:
  ~/Library/Developer/Xcode/Templates and edit the files. Project templates need a unique id to work. Edit the templates
  TemplateInfo.plist.

* If you want to create your own applescript behavior scripts remember to:

  - Add #!/usr/bin/osascript at the top of the script
  - Export the script as text from AppleScript Editor
  - Run chmod -x <your_script> on it in the terminal

* If you need to migrate a project from another IDE to Xcode do the folowing:
  - In Xcode create a project template and delete the folder with the Corona files (from xcode).
  - In finder create a new folder with the same name as the one you deleted.
  - Put your own Corona files in it.
  - In Xcode select File > Add files to Project.. and select the folder you just created.
  - Run the LuaSyntaxColorProject behavior script.


--------------------------------------------------------------
###Resources used:###

http://www.bobmccune.com/2012/03/04/creating-custom-xcode-4-file-templates/

http://blog.boreal-kiss.net/2011/03/11/a-minimal-project-template-for-xcode-4/

The lua syntax coloring script was found at this repository (Thanks to Brian Reinhart):

https://github.com/breinhart/Lua-In-Xcode
