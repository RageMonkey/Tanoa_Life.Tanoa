#include <macro.h>
/*
	File: fn_gangBaseMenu.sqf
	Author: RageMonkey
	Based on ATM Menu By: Bryan "Tonic" Boardwine
	
	Description:
	Opens and manages the Gang Base Menu
*/
private["_display","_textMoney","_units","_type","_gangName","_gangBank","_gangBaseRent","_handle","_textRentDate"];

//if (__GETC__(life_member) < 3) exitWith {cutText [localize "STR_BASE_Donator", "PLAIN"];};

if(!dialog) then
{
	if(!(createDialog "Life_gang_base")) exitWith {};
};

disableSerialization;
_markerName = _this select 3;

//Temp Text
_textMoney ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa'/> $%2","Calculating...","Calculating..."];
_textRentDate ctrlSetStructuredText parseText format["Base Rent Due:<br/>%1","Calculating..."];


grpPlayer setVariable["gang_baseRentDateReady",false,true];
_handle =[[_markerName,grpPlayer,player],"TON_fnc_getRentDate",false,false] spawn life_fnc_MP;
waitUntil {grpPlayer getVariable "gang_baseRentDateReady";};

_gangBaseRentDate = grpPlayer getVariable "gang_baseRentDate";


_display = findDisplay 2700;
_textMoney = _display displayCtrl 2701;
_units = _display displayCtrl 2703;
_textRentDate = _display displayCtrl 2708;

_gangName = grpPlayer getVariable "gang_name";
_gangBank = grpPlayer getVariable "gang_bank";

lbClear _units;
_textMoney ctrlSetStructuredText parseText format["<img size='1.7' image='icons\bank.paa'/> $%1<br/><img size='1.6' image='\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa'/> $%2",[life_RoT_atm] call life_fnc_numberText,[_gangBank] call life_fnc_numberText];
_textRentDate ctrlSetStructuredText parseText format["Base Rent Due:<br/>%1",_gangBaseRentDate];


ctrlSetText [2707,_markerName];

lbSetCurSel [2703,0];

if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	(getControl(2700,2705)) ctrlEnable false;
};


