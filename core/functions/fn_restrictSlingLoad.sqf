#include <macro.h>
/*
	File: fn_restrictSlingLoad.sqf
	Original Author: Paul "Jerico" Smith
	Edited by: Spadge
	
	Description: Disables a vehicle from being Sling Loaded
*/

private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(typeOf _vehicle in (__GETC__(RoT_RestrictedSling))) then {
	_vehicle enableRopeAttach false;
};