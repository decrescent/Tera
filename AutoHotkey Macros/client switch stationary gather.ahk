;IMPORTANT NOTE:
;You must be at your computer or else this is against ToS

global ClientPIDs := [104748, 103772, 108008, 109092, 107464, 107232, 109380, 109344]
global ClientCount := ClientPIDs.MaxIndex()

;Exits program if holding Shift
ExitCall()
{
	;GetKeyState, state, Shift
	;if state = D
	;	Exit
}

;Switches window focus to passed client
SwapClient(clientNum)
{
	ExitCall()
	
	temp := ClientPIDs[clientNum]
	ControlSend, , f, ahk_pid %temp%
	;WinActivate, ahk_pid %temp%
	;WinWaitActive, ahk_pid %temp%
}

;Program
Sleep, 2000
Loop,
{
	;Gather on each client
	for index,PID in ClientPIDs
	{			
		SwapClient(index)
		Sleep, 10
	}
	
	;Wait for the nodes to respawn
	Loop, 35
	{
		Random, rand, 1000, 1050
		Sleep, %rand%
		ExitCall()
	}
}