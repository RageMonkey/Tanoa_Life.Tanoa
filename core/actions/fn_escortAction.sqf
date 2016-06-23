/*
	File: fn_escortAction.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNil "_unit" OR isNull _unit OR !isPlayer _unit) exitWith {};
//if(!(side _unit in [civilian,independent])) exitWith {};
if((playerSide != west) && !(_unit getVariable["hostage",false])) exitWith {};	//If player is civilian and restrained is not hostage then abort
if((player distance _unit > 3)) exitWith {};
_unit attachTo [player,[0.1,1.1,0]];
_unit setVariable["transporting",false,true];
_unit setVariable["Escorting",true,true];
player reveal _unit;

