Haystack = %A_ScriptDir%"
Needle := "[^\\]+$"       ;Match all characters that are not a "/" starting from the end of the haystack
RegExMatch(Haystack, Needle, Match)
StringTrimRight, ParentPath, Haystack, StrLen(Match)
if(A_ComputerName = "ABI-DT31")	;shop display
{
	PathName = ShopDisplay
	FileName = ShopSlideshow.pps
	ComputerFound := True
}
else if(A_ComputerName = "ABI-DT32")	;Engineering Office display
{
	PathName = EngOfficeDisplay
	FileName = EngOfficeSlideshow.pps
	ComputerFound := True
}
else
{
	ComputerFound := False
}
if(ComputerFound = True)
{
	Loop{
		FileGetSize, FileSize_Now, %ParentPath%\%PathName%\History.txt
		;msgbox %FileSize_Now%
		if FileSize_Now <> %FileSize_Last%
		{
			Process,Close,POWERPNT.exe
			Process, WaitClose, POWERPNT.exe
			
			FileDelete, %A_ScriptDir%\%FileName%
			FileCopy, %ParentPath%\%PathName%\%FileName%, %A_ScriptDir%\%FileName%, %DoOverwrite%
			
			sleep 200
			Run, %FileName%,,, WinPid
		}
		else
		{
			Process, Exist, POWERPNT.exe
			if (errorlevel=0)
			{
				sleep 200
				Run, %FileName%,,, WinPid
			}
			IfWinExist, Sponsored session		; Title of the prog
			{
				WinActivate
				Send {Enter}
			}
			sleep 500
		}
		FileSize_Last = %FileSize_Now%
		;msgbox %FileSize_Last%
	}
}

