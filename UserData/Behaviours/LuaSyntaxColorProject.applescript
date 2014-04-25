#!/usr/bin/osascript

tell application "Xcode"
	
	tell first project
		set targetProject to (get project directory)
		set projectName to (get name)
		set pbxFile to targetProject & "/" & projectName & ".xcodeproj/project.pbxproj"
		
		--display dialog pbxFile buttons "OK" default button "OK"
	end tell
end tell


do shell script "perl -pi -w -e 's/lastKnownFileType = sourcecode.lua;/lastKnownFileType = sourcecode.corona; xcLanguageSpecificationIdentifier = xcode.lang.lua;/g' " & pbxFile