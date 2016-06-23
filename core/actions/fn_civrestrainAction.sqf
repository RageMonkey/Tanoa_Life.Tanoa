/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "zipTie")) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if((animationState cursorTarget) != "Incapacitated") exitWith{};
//if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(side player == civilian) then {
	if(life_inv_zipties < 1) exitWith {hint"You need a zip tie to restrain someone."};
	life_inv_zipties = life_inv_zipties - 1;
};
//Broadcast!

[player,"zipties"] call life_fnc_globalSound;
playSound "zipties";

_unit setVariable["zipTie",true,true];
[[player], "life_fnc_civrestrain", _unit, false] spawn life_fnc_MP;
[[0,format["%1 was ziptied by %2",_unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;