-- Version 0.0.1
on main(argv, posix)
	set z to "'00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00'"
	try
		repeat with x in argv
			log "parsing: " & x
			repeat 1 times
				if posix = 1 then
					set f to quoted form of POSIX path of x
				else
					set f to quoted form of x
				end if
				set cmd to "xattr -wx com.apple.FinderInfo " & z & " " & f
				do shell script cmd
				set cmd to "exiftool -s -s -s -charset IPTC=UTF8 -IPTC:Keywords " & f
				set r to (do shell script cmd)
				if r = "" then
					log "skip " & f
					exit repeat
				end if
				log "tags found: " & r

				set o to text item delimiters of AppleScript
				set text item delimiters of AppleScript to ", "
				set n to count text item of r
				set t to {}
				repeat with i from 1 to n
					--log i
					set end of t to i
					set item i of t to "\"" & text item i of r & "\""
					--log item i of t
				end repeat
				set text item delimiters of AppleScript to ","
				set tag to "'(" & t as string & ")'"
				--log tag
				set text item delimiters of AppleScript to o

				set cmd to "xattr -w com.apple.metadata:_kMDItemUserTags " & tag & " " & f
				--log cmd
				do shell script cmd
			end repeat
		end repeat
	on error
		display alert "Error: setting tags failed." as warning
		return
	end try
	return
end main

on run argv
	if argv as string = "Current Application" then
		display alert "Nothing to be done." as informational
		return
	end if
	main(argv, 0)
	return
end run

on open argv
	main(argv, 1)
	display alert "Done!" as informational
	return
end run
