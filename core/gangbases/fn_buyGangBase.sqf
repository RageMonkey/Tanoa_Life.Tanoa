#include <macro.h>
/*
	File: fn_buyGangBase.sqf
	Author: RageMonkey
	Based on House buy By: Bryan "Tonic" Boardwine
	
	Description:
	Buys the Gang base - assumes it is available
	
*/
private["_uid","_action","_gangBaseBuyPrice","_gangBaseBuyPriceText","_tier","_markerName","_curMarkerName"];
_uid = getPlayerUID player;


if ((getPlayerUID player != (group player) getVariable "gang_owner")) exitWith {cutText [localize "STR_BASE_GangLeader", "PLAIN"];};
//if (__GETC__(life_member) < 3) exitWith {cutText [localize "STR_BASE_Donator", "PLAIN"];};

_markerName = _this select 3;

{	
	_curMarkerName = _x select 0;
	if (_curMarkerName == _markerName) then {
		_tier = _x select 1;
	};
} foreach life_all_bases;
		
		
if (_tier == 1) then {
	_gangBaseBuyPrice = 2000000;
	_gangBaseBuyPriceText = "$2,000,000";
}
	else
{
	_gangBaseBuyPrice = 4000000;
	_gangBaseBuyPriceText = "$4,000,000";
};

_action = [
	format[localize "STR_BASE_Buy",
	_gangBaseBuyPriceText],localize "STR_BASE_BuyConfirm",localize "STR_BASE_Hack",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	
	_gFund = grpPlayer getVariable ["gang_bank",0];
	
	if(_gFund < _gangBaseBuyPrice) exitWith {hint format [localize "STR_BASE_NotEnough"]};
	
	_gFund = _gFund - _gangBaseBuyPrice;
	grpPlayer setVariable ["gang_bank",_gFund,true];

	[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	[[_markerName,grpPlayer],"TON_fnc_claimGangBase",false,false] spawn life_fnc_MP;
	
	cutText [localize "STR_BASE_Bought", "PLAIN"];
	[[_markerName],"TON_fnc_fireFlareDefence",false,false] spawn life_fnc_MP;
};