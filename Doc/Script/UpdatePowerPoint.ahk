#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Haystack = %A_ScriptDir%"
Needle := "[^\\]+$"       ;Match all characters that are not a "/" starting from the end of the haystack
RegExMatch(Haystack, Needle, Match)
StringTrimRight, ParentPath, Haystack, StrLen(Match)

FormatTime, CurrentDateTime,, yyyy-MM-dd HH:mm:ss
Entry = %CurrentDateTime% %A_ComputerName%
;msgbox %Entry%

FileAppend, %Entry%`n, History.txt