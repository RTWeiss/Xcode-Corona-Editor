#!/usr/bin/osascript

(*
Xcode behaviour script to convert app file to ipa and submit it to TestFlight.
Installation of TestFlight desktop application needed: http://www.testflightapp.com/desktop
*)

property buildFolder : (the POSIX path of (path to desktop folder as text))

set appFile to choose file with prompt "Choose app to submit to Testflight:" of type {"app"} default location buildFolder

set appPath to (the POSIX path of appFile)
set parentDirectory to (do shell script "dirname " & appPath)
set parentDirectoryPosix to POSIX file (parentDirectory)

tell application "Finder"
	tell application "TestFlight" to activate --open projectPath
	do shell script "cd " & parentDirectory & "; rm -rf 'Payload';"
	set Payload to make new folder at parentDirectoryPosix with properties {name:"Payload"}
	move appFile to Payload
	do shell script "cd " & parentDirectory & "; zip -r 'Payload.zip' 'Payload';"
	do shell script "cd " & parentDirectory & ";mv 'Payload.zip' 'Payload.ipa'"
	tell application "TestFlight" to open parentDirectory & "/Payload.ipa"
	move appFile to parentDirectoryPosix
	do shell script "cd " & parentDirectory & "; rm -rf 'Payload';"
end tell
