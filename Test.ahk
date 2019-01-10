#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Haystack := "E:\Brian\Projects\Project 37 - Shop Powerpoint Auto update\PowerPoint\Script"
Haystack = %A_WorkingDir%
Needle := "[^\\]+$"       ;Match all characters that are not a "/" starting from the end of the haystack

RegExMatch(Haystack, Needle, Match)

StringTrimRight, OutputVar, Haystack, StrLen(Match)

MsgBox    %    OutputVar