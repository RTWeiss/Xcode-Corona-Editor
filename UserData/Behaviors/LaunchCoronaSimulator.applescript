#!/usr/bin/osascript

(*
Xcode behaviour script to open active Xcode project in the Corona Simulator.

This script assumes that the CoronaSDK folder is installed in the
applications folder. If you installed it somewhere else you need
to change the coronaPath property below.

This script only works if your xcodeproject file and the folder with
your corona project files resides in the same folder and have the same name.
*)

property coronaPath : (path to applications folder as text) & "CoronaSDK:Corona Terminal"

tell application "Xcode"
	
	tell first project
		set targetProject to (get project directory)
		set projectName to (get name)
		set pbxFile to targetProject & "/" & projectName & ".xcodeproj/project.pbxproj"
		
		set projectPath to targetProject & "/" & projectName
		--display dialog projectPath
	end tell
end tell

tell application "System Events" to set simulatorIsRunning to (name of processes) contains "Corona Simulator"

if simulatorIsRunning = false then
	
	(*
	Uncomment shell script below to lua syntax color 
	whole Xcode project on each simulator launch
	*)
	
	--do shell script "perl -pi -w -e 's/lastKnownFileType = sourcecode.lua;/lastKnownFileType = sourcecode.corona; xcLanguageSpecificationIdentifier = xcode.lang.lua;/g' " & pbxFile
	
	tell application "Finder" to open coronaPath
	delay 1
	tell application "Corona Simulator" to open projectPath
else
	tell application "Corona Simulator" to open projectPath
end if

(*
Remove lines below if you want Corona Simulator window to have 
focus ( instead of Xcode ) after launching it.
*)
delay 0.5
tell application "Xcode" to activate

