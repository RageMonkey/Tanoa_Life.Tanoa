#include <macro.h>
/*
	File: fn_militaryBasePlaceExplosives.sqf
	Author: RageMonkey
	
	Description:
	Place Explosives
	
*/
private["_uiDisp","_time","_timer","_door","_handle"];

//Ensure 4 Cops Online
if({side _x == west} count playableUnits < 4) exitWith {hint localize "STR_MB_NotEnoughCops"};

//Check Blasting Charge
if(life_inv_blastingcharge < 1) exitWith {hint localize "STR_MB_NoCharge"};
life_inv_blastingcharge = life_inv_blastingcharge - 1;


//Timer
_door = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(_door getVariable["chargeplaced",false]) exitWith {hint localize "STR_MB_Blast_AlreadyPlaced"};
if(_door getVariable["door_open",false]) exitWith {hint localize "STR_MB_Blast_AlreadyOpen"};

_door setVariable["chargeplaced",true,true];
[[1,localize "STR_MB_Blast_Placed"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
hint localize "STR_MB_Blast_KeepOff";
_handle = [] spawn life_fnc_militaryBaseExplosives;
[[],"life_fnc_militaryBaseExplosives",west,false] spawn life_fnc_MP;

[[[1,2],localize "STR_MB_Alert"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};

//Server
[[getPlayerUID player,name player],"TON_fnc_initMilitaryBase",false,false] spawn life_fnc_MP;
_door setVariable["chargeplaced",false,true];
_door setVariable["door_open",true,true];


