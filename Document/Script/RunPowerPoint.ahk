Haystack = %A_ScriptDir%"
Needle := "[^\\]+$"       ;Match all characters that are not a "/" starting from the end of the haystack
RegExMatch(Haystack, Needle, Match)
StringTrimRight, ParentPath, Haystack, StrLen(Match)
Loop{
	FileGetSize, FileSize_Now, %ParentPath%\PowerPoint\History.txt
	;msgbox %FileSize_Now%
	if FileSize_Now <> %FileSize_Last%
	{
		IfWinExist, PowerPoint Slide Show - [TV Slideshow.pps]		; Title of the prog
		{
			WinActivate
			WinClose
		}

		FileDelete, %A_ScriptDir%\TV Slideshow.pps
		FileCopy, %ParentPath%\PowerPoint\TV Slideshow.pps, %A_ScriptDir%\TV Slideshow.pps, %DoOverwrite%
		
		sleep 500
		Run, TV Slideshow.pps,,, WinPid
		WinWaitActive, Ahk_pid %WinPid%
		sleep 500
		Send {F5}
	}
	else
	{
		sleep 500
	}
	FileSize_Last = %FileSize_Now%
	;msgbox %FileSize_Last%
}
