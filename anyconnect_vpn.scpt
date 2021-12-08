-- this script should be used in alfred workflow where TOKEN [argv] is passed as argument to make VPN connection
on run argv
	-- app location
  set appPath to "/System/Volumes/Data/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app"
	-- username to use
  set networkID to "my_username_here"
	-- password: fetch from keychain
  set networkPWD to do shell script "/usr/bin/security find-generic-password -wl  "& quoted form of networkID
  
  --start
	tell application appPath
		activate
	end tell
  
  -- enter stuff in UI
	tell application "System Events"
		tell process appPath
			delay 3
			keystroke networkID
			delay 0.5			
			keystroke tab
			keystroke argv
			delay 0.5
			keystroke tab
			log argv
			keystroke networkPWD
			delay 0.5
			keystroke return
			delay 3
		end tell
	end tell
end run
