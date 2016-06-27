/*
	File: fn_unzip.sqf
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit || !(_unit getVariable "zipTie")) exitWith {hint"Cant unzip for some reason."};

[[_unit],"life_fnc_unrestrainciv",_unit,false] spawn life_fnc_MP;