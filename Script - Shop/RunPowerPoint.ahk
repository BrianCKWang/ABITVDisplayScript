Haystack = %A_ScriptDir%"
Needle := "[^\\]+$"       ;Match all characters that are not a "/" starting from the end of the haystack
RegExMatch(Haystack, Needle, Match)
StringTrimRight, ParentPath, Haystack, StrLen(Match)
Loop{
	FileGetSize, FileSize_Now, %ParentPath%\Shop Display\History.txt
	;msgbox %FileSize_Now%
	if FileSize_Now <> %FileSize_Last%
	{
		IfWinExist, PowerPoint Slide Show - [Shop TV Slideshow.pps]		; Title of the prog
		{
			WinActivate
			WinClose
		}
		WinWaitClose PowerPoint Slide Show - [Shop TV Slideshow.pps]
		FileDelete, %A_ScriptDir%\Shop TV Slideshow.pps
		FileCopy, %ParentPath%\Shop Display\Shop TV Slideshow.pps, %A_ScriptDir%\Shop TV Slideshow.pps, %DoOverwrite%
		
		sleep 500
		Run, Shop TV Slideshow.pps,,, WinPid
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
