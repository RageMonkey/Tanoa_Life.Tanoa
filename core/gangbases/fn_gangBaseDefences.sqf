#include <macro.h>
/*
	File: fn_fireGangBaseDefences.sqf
	Author: RageMonkey
	Based on House buy By: Bryan "Tonic" Boardwine
	
	Description:
	Fires base defences
	
*/
private["_uid","_action","_markerName","_gangBaseDefencesPrice","_gangBaseDefencesPriceText"];

//if (__GETC__(life_member) < 3) exitWith {cutText [localize "STR_BASE_Donator", "PLAIN"];};

if (!life_base_defences) exitWith {cutText [localize "STR_BASE_DefencesCooldown", "PLAIN"];};

_uid = getPlayerUID player;
_markerName = _this select 3;

closeDialog 0;


_gangBaseDefencesPrice = 50000;
_gangBaseDefencesPriceText = "$50,000";


_action = [
	format[localize "STR_BASE_Defence",_gangBaseDefencesPriceText],localize "STR_BASE_DefenceConfirm",localize "STR_BASE_Fire",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;


if(_action) then {

	_gFund = grpPlayer getVariable ["gang_bank",0];
	
	if(_gFund < _gangBaseDefencesPrice) exitWith {hint format [localize "STR_BASE_NotEnough"]};
	
	_gFund = _gFund - _gangBaseDefencesPrice;
	grpPlayer setVariable ["gang_bank",_gFund,true];

	[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	[[_markerName],"TON_fnc_fireGrenadeDefence",false,false] spawn life_fnc_MP;
	
	cutText ["Firing...", "PLAIN"];
	
	life_base_defences = false;
	sleep 180;
	life_base_defences = true;
};