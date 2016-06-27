#include <macro.h>
/*
	File: fn_fireGangBaseDefences.sqf
	Author: RageMonkey
	Based on House buy By: Bryan "Tonic" Boardwine
	
	Description:
	Fires base defences
	
*/
private["_uid","_action","_markerName"];

//if (__GETC__(life_member) < 3) exitWith {cutText [localize "STR_BASE_Donator", "PLAIN"];};

_uid = getPlayerUID player;
_markerName = _this select 3;

closeDialog 0;

_action = [
	localize "STR_BASE_AccessDenied",
	localize "STR_BASE_AccessVault",localize "STR_BASE_OK"
] call BIS_fnc_guiMessage;


if(_action) then {
	[[_markerName],"TON_fnc_AccessVault",false,false] spawn life_fnc_MP;
};