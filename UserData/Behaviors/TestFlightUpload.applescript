#!/usr/bin/osascript

(*
Xcode behaviour script to convert app file to ipa and submit it to TestFlight.
Installation of TestFlight desktop application needed: http://www.testflightapp.com/desktop
*)

property buildFolder : (the POSIX path of (path to desktop folder as text)) -- & "/Builds/"

set appFile to choose file with prompt "Choose app to submit to Testflight:" of type {"app"} default location buildFolder

try
	set text item delimiters to "."
	set appName to first text item of (appFile as text)
	set text item delimiters to ":"
	set appName to last text item of (appName as text)
on error
	set appName to "Payload"
end try

set appPath to (the POSIX path of appFile)
set parentDirectory to (do shell script "dirname " & appPath)
set parentDirectoryPosix to POSIX file (parentDirectory)

tell application "Finder"
	do shell script "cd " & parentDirectory & "; rm -rf 'Payload';"
	set Payload to make new folder at parentDirectoryPosix with properties {name:"Payload"}
	move appFile to Payload
	do shell script "cd " & parentDirectory & "; zip -r 'Payload.zip' 'Payload';"
	do shell script "cd " & parentDirectory & ";mv 'Payload.zip' '" & appName & ".ipa'"
	move appFile to parentDirectoryPosix
	do shell script "cd " & parentDirectory & "; rm -rf 'Payload';"
	tell application "TestFlight" to activate
	tell application "TestFlight" to open parentDirectory & "/" & appName & ".ipa"
end tell
