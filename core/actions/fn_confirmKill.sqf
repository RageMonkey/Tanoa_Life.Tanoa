#include <macro.h>
/*
	file: fn_confirmKill.sqf
	author: RageMonkey
	
	On Action Confirm Kill execute Target Player Respawn
*/
private["_unit"];
_unit = cursorTarget;

_unit setVariable["killConfirmed",TRUE,TRUE];