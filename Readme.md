#Xcode Corona Editor#
Created by Jacob Nielsen 2014

Works with Xcode 4+5

Corona SDK, Corona Enterprise and CoronaCards

--------------------------------------------------------------

Features:

- Lua (Corona) Syntax Coloring
- Corona SDK API auto-completion
- Corona Project Templates
- Corona File Templates
- Xcode behaviors to bridge Xcode-Corona Simulator
- A bunch of other useful Xcode behaviors


--------------------------------------------------------------
Installation:

1.	Make sure Xcode is closed down.

2.	Run the Add-Corona-To-Xcode.sh script in terminal by typing:
	
	sudo your_path_to/Add-Corona-To-Xcode.sh

3.	Now everything should be installed except the behaviors. 
	Behaviors need to be installed manually in Xcode. See below.


--------------------------------------------------------------
Checking installation:

*	Start Xcode and create a new project template for Corona with:
	File > New > Project ( or shift+cmd+n )

*	When the project is created you can check if Lua syntax coloring is installed correctly
	by selecting eg. the main.lua file and navigating to: Editor > Syntax Coloring > Lua

*	Try typing eg. display in one of the lua files to see if auto-completion works.
	( If not make sure auto-completion is enabled in the Xcode preferences )

*	Press cmd+n to create file templates.

NOTE: I didn't yet manage to find a way for Xcode to recognize the .lua file type - meaning
that you have to select the lua syntax coloring manually for each file. As a workaround for this I did a couple of behavior scripts to deal with assigning lua syntax coloring. One script colors all lua files in current Xcode project and another only colors the selected file. You can assign these scripts to keyboard shortcuts via Xcode behaviors to make your life easier. ( See how to below )

If anyone figures out how to register the lua file type in Xcode please let me know. My guess is that something should be modified in the Xcode package here: /Applications/Xcode.app/Contents/OtherFrameworks/DevToolsCore.framework/Versions/A/Resources


-
Installing behaviors in Xcode:

1.	In the Xcode menu bar select: Xcode > Behaviors > Edit Behaviors..

2.	Click the + sign in the lower left corner

3.	Name the behavior "Launch Corona Simulator"

4.	Assign a shortcut by clicking the box next to the behavior name (*)

5.	Click the option to "Notify using bezel or system notification"

6.	Click the option "Run" and "Choose Script..."

7.	Navigate to ~/Library/Developer/Xcode/UserData/Behaviors 
	and pick the script called "LaunchCoronaSimulator" (**)

8.	Close the Behavior window and open a Corona project.

9.	Try running the behavior by using your shortcut or selecting it at Xcode > Behaviors

If the behavior was installed correctly Corona Simulator ( +Terminal ) should launch and open the Corona project you are currently working on in Xcode. The script assumes that the CoronaSDK folder is installed in the applications folder. If you installed it somewhere else you need to change the coronaPath property in the script.

Go through the same procedure to install the other behavior scripts in the behaviors folder.

------
(*) It can be hard to find a free shortcut, but if you create a new Corona keybinding set in Xcode > Preferences > Keybindings don't be afraid to overwrite keybindings... you can always switch back.

(**) By default the Library folder isn't visible in Mac OS. If you can't see it run this in terminal: chflags nohidden ~/Library/


--------------------------------------------------------------
Description of other included behavior scripts:

* LuaSyntaxColorProject: syntax colors all .lua files in current Xcode project.
* LuaSyntaxColorFile: syntax colors selected .lua file in current Xcode project.

* Scale@2xTo@1x: Creates downscaled @1x.png copies of @2x.png files in your project folder.
  (if someone feels like extending this script to a @4x version please let me know)

* OpenADM: Opens the Android Device Monitor. Installation of Android SDK needed. Change adm_path in the script to match your setup.

* AndroidDeviceInstallApk: Installation of Android SDK needed for this to work. Change buildFolder and adbPath properties in the script to match your setup.

The rest explain themselves. They are simply bridging functionality from Corona Simulator:

* ShowProjectSandbox
* CoronaRelaunch
* BuildCoronaIOS
* BuildCoronaAndroid


--------------------------------------------------------------
Tips and tricks:

* I didn't add a lot of Corona API keywords to the Lua.xclangspec because I prefer it that way, but it is possible.
  After installing lua syntax coloring with you can add more keywords for coloring in the Lua.xclangspec located at: 
  ~/Applications/Xcode.app/Contents/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/Lua.xclangspec 
  You don't need to run the Add-Lua.sh script again for Xcode to register the changes.

* It is quite easy to do your own Project / File Templates. As a starting point just copy one of the subfolders located at:
  ~/Library/Developer/Xcode/Templates and edit the files. Project templates need a unique id to work. Edit the templates
  TemplateInfo.plist to do that.

* Feel free to clone this repository and send me pull requests if you come up with improvements or new features.


--------------------------------------------------------------
Resources used to create XCE:

http://www.bobmccune.com/2012/03/04/creating-custom-xcode-4-file-templates/

http://blog.boreal-kiss.net/2011/03/11/a-minimal-project-template-for-xcode-4/

The lua syntax coloring script was found at this repository (Thanks to Brian Reinhart):

https://github.com/breinhart/Lua-In-Xcode
