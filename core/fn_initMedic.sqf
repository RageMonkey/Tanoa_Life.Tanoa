#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{

	if (life_enslaved) then
	{
		life_enslaved = false; //reset so that slave code doesn't abort due to cool down
		[[player,false],"life_fnc_sellHostageAction",player,false] spawn life_fnc_MP;
		
	} else {
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};

};
[] call life_fnc_equipGear;

if (life_missing_organ) then
{
	hint "You are missing an Organ go to a Hospital!";
};