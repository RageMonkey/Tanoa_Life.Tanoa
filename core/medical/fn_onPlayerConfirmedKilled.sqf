#include <macro.h>
/*
	file: fn_onPlayerConfirmedKilled.sqf
	author: RageMonkey
	
	Player has been confirmed Killed -> Respawn
*/
private["_unit"];

if(alive player) exitWith {};	//Dont respawn the Player if he is alive
waitUntil {player getVariable ["killConfirmed",FALSE] || alive player};
if(alive player) exitWith {};	//Dont respawn the Player if he is alive
titlecut ["Kill Confirmed","BLACK IN",25];
titleCut ["You are Dead, a Medic did not save your life in time...", "BLACK FADED", 999];

((findDisplay 7300) displayCtrl 7302) ctrlEnable true;
((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
((findDisplay 7300) displayCtrl 7301) ctrlSetText localize "STR_Medic_Respawn_2"; 

//Kill Confirmed Variable Reset
player setVariable["killConfirmed",TRUE,TRUE];

titleCut ["You are Dead, a Medic did not save your life in time...", "BLACK FADED", 999];

[[0,format[localize "STR_NOTF_KillConfirmed", profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;