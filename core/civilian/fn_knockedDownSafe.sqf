/*
	File: fn_knockedDownSafe.sqf
	Original Author: Spadge
	
	Description: Downed in a safe zone
*/
private["_unit"];
_unit = _this select 0;
sleep 1;
[[_unit,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
_unit playMoveNow "amovppnemstpsraswrfldnon";