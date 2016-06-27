/*
	File: RoT_Healing.sqf
	Author: Spadge
	
	Description:
	Slowly heal over time.
*/

private ["_newDamage","_t"];

while {alive player} do
{
	waitUntil {damage player > 0.00 && damage player < 0.26};
	if(damage player > 0) then {
		_newDamage = (damage player) - 0.05;
		if(_newDamage < 0) then {_newDamage = 0;};
		player setDamage _newDamage;
		if(damage player == 0) then {
			[] call life_fnc_hudUpdate; //Request update of hud.
		};
	};
	sleep 60.0;
};