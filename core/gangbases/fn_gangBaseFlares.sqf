#include <macro.h>
/*
	File: fn_fireGangBaseDefences.sqf
	Author: RageMonkey
	Based on House buy By: Bryan "Tonic" Boardwine
	
	Description:
	Fires base defences
	
*/
private["_uid","_action","_markerName","_gangBaseFlaresPrice","_gangBaseFlaresPriceText"];

//if (__GETC__(life_member) < 3) exitWith {cutText [localize "STR_BASE_Donator", "PLAIN"];};

if (!life_base_flares) exitWith {cutText [localize "STR_BASE_FlaresCooldown", "PLAIN"];};

_uid = getPlayerUID player;
_markerName = _this select 3;

closeDialog 0;


_gangBaseFlaresPrice = 50000;
_gangBaseFlaresPriceText = "$50,000";


_action = [
	format[localize "STR_BASE_Flares",_gangBaseFlaresPriceText],localize "STR_BASE_DefenceConfirm",localize "STR_BASE_Fire",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;


if(_action) then {

	_gFund = grpPlayer getVariable ["gang_bank",0];
	
	if(_gFund < _gangBaseFlaresPrice) exitWith {hint format [localize "STR_BASE_NotEnough"]};
	
	_gFund = _gFund - _gangBaseFlaresPrice;
	grpPlayer setVariable ["gang_bank",_gFund,true];

	[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	[[_markerName],"TON_fnc_fireFlareDefence",false,false] spawn life_fnc_MP;
	
	cutText ["Firing...", "PLAIN"];
	
	life_base_flares = false;
	sleep 180;
	life_base_flares = true;
};