#include <macro.h>
/*
	File: fn_gangBaseDeposit.sqf
	Author: RageMonkey
	Based on bank deposit By: Bryan "Tonic" Boardwine
	
	Description:
	Remove funds from player Bank and add Gang Funds
*/
private["_value","_markerName"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_RoT_atm) exitWith {hint localize "STR_BASE_NotEnoughATM"};

_markerName = parseText(ctrlText 2707);

__SUB__(life_RoT_atm,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[6] call SOCK_fnc_updatePartial;
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
["","","",_markerName] spawn life_fnc_gangBaseMenu;