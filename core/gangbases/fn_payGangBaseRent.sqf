#include <macro.h>
/*
	File: fn_payGangBaseRent.sqf
	Author: RageMonkey
	Based on House buy By: Bryan "Tonic" Boardwine
	
	Description:
	Extends rent by 1 week
	
*/
private["_uid","_action","_gangBaseRentPrice","_markerName","_gangBaseRentPriceText","_tier","_curMarkerName","_markerNameNotParse"];
//if (__GETC__(life_member) < 3) exitWith {cutText [localize "STR_BASE_Donator", "PLAIN"];};

_uid = getPlayerUID player;
_markerName = parseText(ctrlText 2707);
_markerNameNotParse = ctrlText 2707;

closeDialog 0;

{	
	_curMarkerName = _x select 0;
	if (_curMarkerName == _markerNameNotParse) then {
		_tier = _x select 1;
	};
} foreach life_all_bases;	
	
if (_tier == 1) then {
	_gangBaseRentPrice = 1000000;
	_gangBaseRentPriceText = "$1,000,000";
}
	else
{
	_gangBaseRentPrice = 2000000;
	_gangBaseRentPriceText = "$2,000,000";
};


_action = [
	format[localize "STR_BASE_Rent",
	_gangBaseRentPriceText],localize "STR_BASE_RentConfirm",localize "STR_BASE_Pay",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;


if(_action) then {
	
	_gFund = grpPlayer getVariable ["gang_bank",0];
	
	if(_gFund < _gangBaseRentPrice) exitWith {hint format [localize "STR_BASE_NotEnough"]};
	
	_gFund = _gFund - _gangBaseRentPrice;
	grpPlayer setVariable ["gang_bank",_gFund,true];

	[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	[[_markerName,grpPlayer],"TON_fnc_payGangBaseRent",false,false] spawn life_fnc_MP;
	
	cutText [localize "STR_BASE_RentPaid", "PLAIN"];
	[[_markerNameNotParse],"TON_fnc_fireFlareDefence",false,false] spawn life_fnc_MP;
};