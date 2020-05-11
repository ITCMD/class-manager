#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Ignore
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Loop
{
WinWaitActive,Class Manager for Liberty University | By ITCMD
WinSet,AlwaysOnTop,on,A
WinSet, Transparent, 210, A
WinWaitNotActive,A
}